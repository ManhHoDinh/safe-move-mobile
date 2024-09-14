import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/file/file.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../utilities/image_uploader.dart';
import 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit({
    required this.userController,
    required this.loadingManager,
    required this.failureHandlerManager,
    required this.fileController,
  }) : super(const ProfileInfoState()) {
    _fetchData();
  }

  final UserController userController;
  final LoadingManager loadingManager;
  final FailureHandlerManager failureHandlerManager;
  final FileController fileController;

  Future<Result<Failure, UserDTO>> updateProfileInfo() async {
    final futureLoading = userController.updateUserInfo(UpdateUserInfoRequest(
        name: state.name,
        bio: state.bio,
        email: state.accountType == AccountType.normal ? state.email : null));
    return loadingManager.startLoading(future: futureLoading);
  }

  void uploadImage(File file) async {
    final imageUrl = await loadingManager.startLoading(
      future: _futureUploadImage(file),
    );
    if (imageUrl != null) {
      emit(state.copyWith(imageUrl: imageUrl, isUploadImage: true));
    }
  }

  Future<String?> _futureUploadImage(File file) async {
    final imageUploader = ImageUploader(
        fileController: fileController,
        failureHandlerManager: failureHandlerManager);
    final resultUploadImage = await imageUploader.uploadImage(file);

    if (resultUploadImage != null) {
      final result = await userController
          .updateUserAvatar(UpdateUserAvatarRequest(avatar: resultUploadImage));
      result.handleLeft((failure) {
        failureHandlerManager.handle(failure);
      });

      if (result.isRight) {
        return result.right.avatarUrl;
      }
      return null;
    }
    return null;
  }

  void onBioChange(String value) {
    emit(state.copyWith(bio: value));
  }

  void reload() {
    _fetchData();
  }

  void _fetchData() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final result = await userController.getUserInfo();
    result.handleLeft((failure) {
      emit(state.copyWith(apiStatus: ApiStatus.fail));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        bio: value.bio,
        email: value.email,
        name: value.name,
        phoneNumber: value.phoneNumber,
        imageUrl: value.avatarUrl,
        accountType: value.accountType,
      ));
    });
  }
}
