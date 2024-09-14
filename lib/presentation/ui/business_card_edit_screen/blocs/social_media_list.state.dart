import 'package:equatable/equatable.dart';

import '../../../../application/services/user/user.dart';
import '../../../bases/base_form_input/base_form_input.dart';
import 'social_media_content_state.dart';

class SocialMediaTypeField
    extends BaseFormInput<SocialMediaType?, SocialMediaError> {
  const SocialMediaTypeField.pure({
    super.value,
  }) : super.pure(validateOnChanged: true);

  const SocialMediaTypeField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  SocialMediaError? selfValidate() {
    if (value == null) {
      return SocialMediaError.empty;
    }
    return null;
  }
}

class SocialMediaListItem {
  SocialMediaListItem({
    this.socialType,
    this.url,
    this.id,
  });

  SocialMediaType? socialType;
  String? url;
  final int? id;
}

class SocialMediaListState extends Equatable {
  const SocialMediaListState({
    this.socialType = const SocialMediaTypeField.pure(),
    this.url = const UrlField.pure(),
    this.socialMediaList = const [],
  });
  final SocialMediaTypeField socialType;
  final UrlField url;
  final List<SocialMediaListItem> socialMediaList;

  bool get canSubmit {
    return (socialType.isValid && url.isValid) || socialMediaList.isEmpty;
  }

  SocialMediaListState resetFields({
    List<SocialMediaListItem>? socialMediaList,
  }) {
    return SocialMediaListState(
      socialType: const SocialMediaTypeField.dirty(value: null),
      url: const UrlField.dirty(value: ''),
      socialMediaList: socialMediaList ?? this.socialMediaList,
    );
  }

  SocialMediaListState copyWith({
    SocialMediaTypeField? socialType,
    UrlField? url,
    List<SocialMediaListItem>? socialMediaList,
  }) {
    return SocialMediaListState(
      socialType: socialType ?? this.socialType,
      url: url ?? this.url,
      socialMediaList: socialMediaList ?? this.socialMediaList,
    );
  }

  @override
  List<Object?> get props =>
      [socialType, url.value, url.error, socialMediaList, canSubmit];
}
