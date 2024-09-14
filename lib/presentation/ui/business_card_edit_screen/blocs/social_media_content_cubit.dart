import 'dart:io';

import '../../../../application/services/file/file.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../utilities/image_uploader.dart';
import 'social_media_content_state.dart';

class SocialMediaContentCubit extends SafeCubit<SocialMediaContentState> {
  SocialMediaContentCubit({
    required this.failureHandlerManager,
    required this.userController,
    required this.fileController,
  }) : super(const SocialMediaContentState()) {
    _fetchData();
  }

  final FailureHandlerManager failureHandlerManager;
  final UserController userController;
  final FileController fileController;

  void onContentChanged(String value) {
    final list =
        List<SocialMediaContentItem>.from(state.socialMediaContentList);
    list[list.length - 1].content = value;

    emit(state.copyWith(
      content: ContentField.dirty(value: value),
      socialMediaContentList: list,
    ));
  }

  void onContentUrlChanged(String value) {
    final list =
        List<SocialMediaContentItem>.from(state.socialMediaContentList);
    list[list.length - 1].url = value;
    emit(state.copyWith(
      url: UrlField.dirty(value: value),
      socialMediaContentList: list,
    ));
  }

  void onFileChanged(File? file) {
    final list =
        List<SocialMediaContentItem>.from(state.socialMediaContentList);
    list[list.length - 1].fileRequest = file;
    list[list.length - 1].fileKey = file?.path.split('/').last;
    list[list.length - 1].fileUrl = file?.path;
    emit(state.copyWithFile(
      fileUrl: file?.path,
      socialMediaContentList: list,
    ));
  }

  void reload() {
    _fetchData();
  }

  void _fetchData() async {
    final result = await userController.getMyProfileUrl();
    result.handleLeft((failure) {
      failureHandlerManager.handle(failure);
    });
    result.handleRight((value) {
      ContentField content = const ContentField.pure();
      UrlField url = const UrlField.pure();
      String? fileUrl;
      if (value.isNotEmpty) {
        content =
            ContentField.dirty(value: value[value.length - 1].content ?? '');
        url = UrlField.dirty(value: value[value.length - 1].url ?? '');
        fileUrl = value[value.length - 1].image?.previewUrl;
      }
      emit(state.copyWith(
          content: content,
          url: url,
          fileUrl: fileUrl,
          socialMediaContentList: value
              .map((e) => SocialMediaContentItem(
                    content: e.content,
                    url: e.url,
                    id: e.id,
                    fileKey: e.image?.fileKey,
                    fileUrl: e.image?.previewUrl,
                  ))
              .toList()));
    });
  }

  Future<Result<Failure, List<ProfileUrlResponse>>?>
      updateSocialMediaContent() async {
    if (state.socialMediaContentList.isNotEmpty) {
      final errorUrl = state.url.selfValidate();
      final errorContent = state.content.selfValidate();

      if (errorUrl != null || errorContent != null) {
        emit(state.copyWith(
          url: UrlField.dirty(value: state.url.value, error: errorUrl),
          content: ContentField.dirty(
              value: state.content.value, error: errorContent),
        ));
        return null;
      }
    }

    final imageUploader = ImageUploader(
      fileController: fileController,
      failureHandlerManager: failureHandlerManager,
    );
    final List<ProfileUrlRequest> request = [];
    for (final SocialMediaContentItem item in state.socialMediaContentList) {
      FileRequest? image = item.fileRequest != null
          ? await imageUploader.uploadImage(item.fileRequest!)
          : null;
      if (image == null &&
          item.id != null &&
          item.fileKey != null &&
          item.fileUrl != null) {
        image = FileRequest(fileKey: item.fileKey!, previewUrl: item.fileUrl!);
      }
      request.add(ProfileUrlRequest(
        content: item.content!,
        id: item.id,
        url: item.url!,
        image: image,
      ));
    }

    final result = userController.upsertMyProfileUrl(request);
    return result;
  }

  void deleteSocialMedia(int index) {
    final results =
        List<SocialMediaContentItem>.from(state.socialMediaContentList);
    results.removeAt(index);
    if (results.isNotEmpty) {
      final socialItem = results[results.length - 1];
      emit(state.copyWith(
        socialMediaContentList: results,
        content: ContentField.dirty(value: socialItem.content ?? ''),
        url: UrlField.dirty(value: socialItem.url ?? ''),
        fileUrl: socialItem.fileKey,
      ));
      return;
    }
    emit(state.resetFields(socialMediaContentList: results));
  }

  void onAddSocialMedia() {
    final results =
        List<SocialMediaContentItem>.from(state.socialMediaContentList);

    if (results.isNotEmpty) {
      final errorUrl = state.url.selfValidate();
      final errorContent = state.content.selfValidate();

      if (errorUrl != null || errorContent != null) {
        emit(state.copyWith(
          url: UrlField.dirty(value: state.url.value, error: errorUrl),
          content: ContentField.dirty(
              value: state.content.value, error: errorContent),
        ));
        return;
      }
    }
    if (!state.canSubmit) {
      return;
    }

    results.add(SocialMediaContentItem());

    emit(state.resetFields(
      socialMediaContentList: results,
    ));
  }
}
