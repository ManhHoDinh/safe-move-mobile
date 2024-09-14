// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'language_type.dart';

class PostLanguageMapper extends EnumMapper<PostLanguage> {
  PostLanguageMapper._();

  static PostLanguageMapper? _instance;
  static PostLanguageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostLanguageMapper._());
    }
    return _instance!;
  }

  static PostLanguage fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PostLanguage decode(dynamic value) {
    switch (value) {
      case 'KOREAN':
        return PostLanguage.KOREAN;
      case 'ENGLISH':
        return PostLanguage.ENGLISH;
      case 'CHINESE':
        return PostLanguage.CHINESE;
      case 'JAPANESE':
        return PostLanguage.JAPANESE;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PostLanguage self) {
    switch (self) {
      case PostLanguage.KOREAN:
        return 'KOREAN';
      case PostLanguage.ENGLISH:
        return 'ENGLISH';
      case PostLanguage.CHINESE:
        return 'CHINESE';
      case PostLanguage.JAPANESE:
        return 'JAPANESE';
    }
  }
}

extension PostLanguageMapperExtension on PostLanguage {
  String toValue() {
    PostLanguageMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PostLanguage>(this) as String;
  }
}
