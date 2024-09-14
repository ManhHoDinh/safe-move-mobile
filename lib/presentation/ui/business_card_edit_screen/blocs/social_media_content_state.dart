import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../bases/base_form_input/base_form_input.dart';

enum SocialMediaError {
  empty,
  urlInvalid,
}

class UrlField extends BaseFormInput<String, SocialMediaError> {
  const UrlField.pure({super.value = '', super.error})
      : super.pure(validateOnChanged: false);

  const UrlField.dirty({required super.value, super.error})
      : super.dirty(validateOnChanged: false);

  @override
  SocialMediaError? selfValidate() {
    if (value.trim().isEmpty) {
      return SocialMediaError.empty;
    }
    final parse = Uri.tryParse(value);
    if (parse == null || (parse.scheme != 'http' && parse.scheme != 'https')) {
      return SocialMediaError.urlInvalid;
    }

    return null;
  }
}

class ContentField extends BaseFormInput<String, SocialMediaError> {
  const ContentField.pure({
    super.value = '',
    super.error,
  }) : super.pure();

  const ContentField.dirty({required super.value, super.error}) : super.dirty();

  @override
  SocialMediaError? selfValidate() {
    if (value.trim().isEmpty) {
      return SocialMediaError.empty;
    }
    return null;
  }
}

class SocialMediaContentItem {
  SocialMediaContentItem({
    this.content,
    this.url,
    this.fileRequest,
    this.fileKey,
    this.fileUrl,
    this.id,
  });

  String? content;
  final int? id;
  String? url;
  File? fileRequest;
  String? fileKey;
  String? fileUrl;
}

class SocialMediaContentState extends Equatable {
  const SocialMediaContentState({
    this.content = const ContentField.pure(),
    this.url = const UrlField.pure(),
    this.socialMediaContentList = const [],
    this.fileUrl,
  });
  final ContentField content;
  final UrlField url;
  final String? fileUrl;
  final List<SocialMediaContentItem> socialMediaContentList;

  bool get canSubmit {
    return (content.isValid && url.isValid && fileUrl != null) ||
        socialMediaContentList.isEmpty;
  }

  SocialMediaContentState resetFields({
    List<SocialMediaContentItem>? socialMediaContentList,
  }) {
    return SocialMediaContentState(
      content: const ContentField.dirty(value: ''),
      url: const UrlField.dirty(value: ''),
      socialMediaContentList:
          socialMediaContentList ?? this.socialMediaContentList,
    );
  }

  SocialMediaContentState copyWithFile({
    String? fileUrl,
    ContentField? content,
    UrlField? url,
    List<SocialMediaContentItem>? socialMediaContentList,
  }) {
    return SocialMediaContentState(
      fileUrl: fileUrl,
      content: content ?? this.content,
      url: url ?? this.url,
      socialMediaContentList:
          socialMediaContentList ?? this.socialMediaContentList,
    );
  }

  SocialMediaContentState copyWith({
    ContentField? content,
    UrlField? url,
    List<SocialMediaContentItem>? socialMediaContentList,
    String? fileUrl,
  }) {
    return SocialMediaContentState(
      content: content ?? this.content,
      url: url ?? this.url,
      fileUrl: fileUrl ?? this.fileUrl,
      socialMediaContentList:
          socialMediaContentList ?? this.socialMediaContentList,
    );
  }

  @override
  List<Object?> get props => [
        content,
        url.error,
        url.value,
        content.error,
        content.value,
        fileUrl,
        socialMediaContentList,
        canSubmit
      ];
}
