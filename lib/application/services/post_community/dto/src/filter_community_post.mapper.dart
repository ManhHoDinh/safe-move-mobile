// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filter_community_post.dart';

class FilterCommunityPostMapper extends EnumMapper<FilterCommunityPost> {
  FilterCommunityPostMapper._();

  static FilterCommunityPostMapper? _instance;
  static FilterCommunityPostMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterCommunityPostMapper._());
    }
    return _instance!;
  }

  static FilterCommunityPost fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FilterCommunityPost decode(dynamic value) {
    switch (value) {
      case 'ALL':
        return FilterCommunityPost.ALL;
      case 'FAVORITE':
        return FilterCommunityPost.FAVORITE;
      case 'POPULAR':
        return FilterCommunityPost.POPULAR;
      case 'LATEST':
        return FilterCommunityPost.LATEST;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FilterCommunityPost self) {
    switch (self) {
      case FilterCommunityPost.ALL:
        return 'ALL';
      case FilterCommunityPost.FAVORITE:
        return 'FAVORITE';
      case FilterCommunityPost.POPULAR:
        return 'POPULAR';
      case FilterCommunityPost.LATEST:
        return 'LATEST';
    }
  }
}

extension FilterCommunityPostMapperExtension on FilterCommunityPost {
  String toValue() {
    FilterCommunityPostMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FilterCommunityPost>(this) as String;
  }
}
