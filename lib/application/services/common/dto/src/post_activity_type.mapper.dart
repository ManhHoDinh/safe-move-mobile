// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_activity_type.dart';

class PostActivityTypeMapper extends EnumMapper<PostActivityType> {
  PostActivityTypeMapper._();

  static PostActivityTypeMapper? _instance;
  static PostActivityTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostActivityTypeMapper._());
    }
    return _instance!;
  }

  static PostActivityType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PostActivityType decode(dynamic value) {
    switch (value) {
      case 'POSTED':
        return PostActivityType.POSTED;
      case 'COMMENTED':
        return PostActivityType.COMMENTED;
      case 'LIKED':
        return PostActivityType.LIKED;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PostActivityType self) {
    switch (self) {
      case PostActivityType.POSTED:
        return 'POSTED';
      case PostActivityType.COMMENTED:
        return 'COMMENTED';
      case PostActivityType.LIKED:
        return 'LIKED';
    }
  }
}

extension PostActivityTypeMapperExtension on PostActivityType {
  String toValue() {
    PostActivityTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PostActivityType>(this) as String;
  }
}
