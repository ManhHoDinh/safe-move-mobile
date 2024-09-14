// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_type.dart';

class PostTypeMapper extends EnumMapper<PostType> {
  PostTypeMapper._();

  static PostTypeMapper? _instance;
  static PostTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostTypeMapper._());
    }
    return _instance!;
  }

  static PostType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PostType decode(dynamic value) {
    switch (value) {
      case 'COMMUNITY':
        return PostType.COMMUNITY;
      case 'CURATOR':
        return PostType.CURATOR;
      case 'SGM_NEWS':
        return PostType.SGM_NEWS;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PostType self) {
    switch (self) {
      case PostType.COMMUNITY:
        return 'COMMUNITY';
      case PostType.CURATOR:
        return 'CURATOR';
      case PostType.SGM_NEWS:
        return 'SGM_NEWS';
    }
  }
}

extension PostTypeMapperExtension on PostType {
  String toValue() {
    PostTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PostType>(this) as String;
  }
}
