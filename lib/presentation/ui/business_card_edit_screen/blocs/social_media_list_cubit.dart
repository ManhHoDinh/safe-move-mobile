import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/user.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import 'social_media_content_state.dart';
import 'social_media_list.state.dart';

class SocialMediaListCubit extends Cubit<SocialMediaListState> {
  SocialMediaListCubit({
    required this.failureHandlerManager,
    required this.userController,
  }) : super(const SocialMediaListState()) {
    _fetchData();
  }

  final FailureHandlerManager failureHandlerManager;
  final UserController userController;

  void reload() {
    _fetchData();
  }

  void _fetchData() async {
    final result = await userController.getMySocialMedias();
    result.handleLeft((failure) {
      failureHandlerManager.handle(failure);
    });
    result.handleRight((value) {
      SocialMediaTypeField socialType = const SocialMediaTypeField.pure();
      UrlField url = const UrlField.pure();
      if (value.isNotEmpty) {
        socialType = SocialMediaTypeField.dirty(
            value: value[value.length - 1].socialType);
        url = UrlField.dirty(value: value[value.length - 1].url ?? '');
      }
      emit(state.copyWith(
          socialType: socialType,
          url: url,
          socialMediaList: value
              .map((e) => SocialMediaListItem(
                    id: e.id,
                    socialType: e.socialType,
                    url: e.url,
                  ))
              .toList()));
    });
  }

  Future<Result<Failure, List<SocialMediaResponse>>?>
      updateSocialMedia() async {
    final results = List<SocialMediaListItem>.from(state.socialMediaList);
    if (results.isNotEmpty) {
      final errorUrl = state.url.selfValidate();
      final errorContent = state.socialType.selfValidate();

      if (errorUrl != null || errorContent != null) {
        emit(state.copyWith(
          url: UrlField.dirty(value: state.url.value, error: errorUrl),
        ));
        return null;
      }
    }

    final List<SocialMediaRequest> socialMediaRequest = [];
    for (int i = 0; i < state.socialMediaList.length; i++) {
      socialMediaRequest.add(SocialMediaRequest(
        type: state.socialMediaList[i].socialType!,
        url: state.socialMediaList[i].url ?? '',
        id: state.socialMediaList[i].id,
      ));
    }

    return userController.upsertMySocialMedias(socialMediaRequest);
  }

  void onSocialTypeChanged(SocialMediaType socialType) {
    final list = List<SocialMediaListItem>.from(state.socialMediaList);
    list[list.length - 1].socialType = socialType;
    emit(state.copyWith(
      socialType: SocialMediaTypeField.dirty(value: socialType),
      socialMediaList: list,
    ));
  }

  void onUrlChanged(String url) {
    final list = List<SocialMediaListItem>.from(state.socialMediaList);
    list[list.length - 1].url = url;
    emit(state.copyWith(
      url: UrlField.dirty(value: url),
      socialMediaList: list,
    ));
  }

  void deleteSocialMedia(int index) {
    final results = List<SocialMediaListItem>.from(state.socialMediaList);
    results.removeAt(index);
    if (results.isNotEmpty) {
      final socialItem = results[results.length - 1];
      emit(state.copyWith(
          socialMediaList: results,
          socialType: SocialMediaTypeField.dirty(value: socialItem.socialType),
          url: UrlField.dirty(value: socialItem.url ?? '')));
      return;
    }
    emit(state.resetFields(socialMediaList: results));
  }

  void onAddSocialMedia() {
    final results = List<SocialMediaListItem>.from(state.socialMediaList);
    if (results.isNotEmpty) {
      final errorUrl = state.url.selfValidate();
      final errorContent = state.socialType.selfValidate();

      if (errorUrl != null || errorContent != null) {
        emit(state.copyWith(
          url: UrlField.dirty(value: state.url.value, error: errorUrl),
        ));
        return;
      }
    }

    if (!state.canSubmit) {
      return;
    }

    results.add(SocialMediaListItem());

    emit(state.resetFields(
      socialMediaList: results,
    ));
  }
}
