// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'social_media_type.dart';

class SocialMediaTypeMapper extends EnumMapper<SocialMediaType> {
  SocialMediaTypeMapper._();

  static SocialMediaTypeMapper? _instance;
  static SocialMediaTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SocialMediaTypeMapper._());
    }
    return _instance!;
  }

  static SocialMediaType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SocialMediaType decode(dynamic value) {
    switch (value) {
      case 'INSTAGRAM':
        return SocialMediaType.instagram;
      case 'KAKAO':
        return SocialMediaType.kakao;
      case 'NAVER_CAFE':
        return SocialMediaType.naverCafe;
      case 'THREAD':
        return SocialMediaType.thread;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SocialMediaType self) {
    switch (self) {
      case SocialMediaType.instagram:
        return 'INSTAGRAM';
      case SocialMediaType.kakao:
        return 'KAKAO';
      case SocialMediaType.naverCafe:
        return 'NAVER_CAFE';
      case SocialMediaType.thread:
        return 'THREAD';
    }
  }
}

extension SocialMediaTypeMapperExtension on SocialMediaType {
  String toValue() {
    SocialMediaTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SocialMediaType>(this) as String;
  }
}
