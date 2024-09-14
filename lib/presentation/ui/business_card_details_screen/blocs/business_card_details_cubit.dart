import 'dart:async';

import '../../../../application/services/profile_url/profile_url.dart';
import '../../../../application/services/social_media/social_media.dart';
import '../../../../application/services/user/user.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import 'business_card_details_state.dart';

class BusinessCardDetailCubit extends SafeCubit<BusinessCardDetailState> {
  BusinessCardDetailCubit({
    required this.profileUrlController,
    required this.socialMediaController,
    required this.failureHandlerManager,
    required this.userController,
    required this.id,
  }) : super(const BusinessCardDetailState()) {
    _fetchData();
  }

  final ProfileUrlController profileUrlController;
  final SocialMediaController socialMediaController;
  final UserController userController;
  final FailureHandlerManager failureHandlerManager;
  final int id;

  Future<void> _getUserInfoByUserId() async {
    final result = await userController.getUserInfoById(userId: id);

    result.handleLeft((failure) {
      emit(state.copyWith(loading: false));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(userData: value));
    });
  }

  Future<void> _getProfileUrlByUserId() async {
    final result = await profileUrlController.getProfileUrlByUserId(userId: id);

    result.handleLeft((failure) {
      emit(state.copyWith(loading: false));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(profileUrlResponse: value));
    });
  }

  Future<void> _getSocialMediasByUserId() async {
    final result =
        await socialMediaController.getSocialMediasByUserId(userId: id);

    result.handleLeft((failure) {
      emit(state.copyWith(loading: false));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(socialMediaResponse: value));
    });
  }

  Future<void> _fetchData() async {
    emit(state.copyWith(loading: true));

    await Future.wait([
      _getUserInfoByUserId(),
      _getProfileUrlByUserId(),
      _getSocialMediasByUserId(),
    ]);

    emit(state.copyWith(loading: false));
  }

  void reload() {
    _fetchData();
  }
}
