// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_category_dto.dart';

class PostCategoryDTOMapper extends ClassMapperBase<PostCategoryDTO> {
  PostCategoryDTOMapper._();

  static PostCategoryDTOMapper? _instance;
  static PostCategoryDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostCategoryDTOMapper._());
      CategoryTypeMapper.ensureInitialized();
      SubCategoryDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PostCategoryDTO';

  static int? _$id(PostCategoryDTO v) => v.id;
  static const Field<PostCategoryDTO, int> _f$id = Field('id', _$id, opt: true);
  static CategoryType? _$categoryType(PostCategoryDTO v) => v.categoryType;
  static const Field<PostCategoryDTO, CategoryType> _f$categoryType =
      Field('categoryType', _$categoryType, opt: true);
  static String? _$nameKorea(PostCategoryDTO v) => v.nameKorea;
  static const Field<PostCategoryDTO, String> _f$nameKorea =
      Field('nameKorea', _$nameKorea, opt: true);
  static String? _$nameEnglish(PostCategoryDTO v) => v.nameEnglish;
  static const Field<PostCategoryDTO, String> _f$nameEnglish =
      Field('nameEnglish', _$nameEnglish, opt: true);
  static String? _$nameChina(PostCategoryDTO v) => v.nameChina;
  static const Field<PostCategoryDTO, String> _f$nameChina =
      Field('nameChina', _$nameChina, opt: true);
  static String? _$nameJapan(PostCategoryDTO v) => v.nameJapan;
  static const Field<PostCategoryDTO, String> _f$nameJapan =
      Field('nameJapan', _$nameJapan, opt: true);
  static SubCategoryDTO? _$parent(PostCategoryDTO v) => v.parent;
  static const Field<PostCategoryDTO, SubCategoryDTO> _f$parent =
      Field('parent', _$parent, opt: true);

  @override
  final MappableFields<PostCategoryDTO> fields = const {
    #id: _f$id,
    #categoryType: _f$categoryType,
    #nameKorea: _f$nameKorea,
    #nameEnglish: _f$nameEnglish,
    #nameChina: _f$nameChina,
    #nameJapan: _f$nameJapan,
    #parent: _f$parent,
  };

  static PostCategoryDTO _instantiate(DecodingData data) {
    return PostCategoryDTO(
        id: data.dec(_f$id),
        categoryType: data.dec(_f$categoryType),
        nameKorea: data.dec(_f$nameKorea),
        nameEnglish: data.dec(_f$nameEnglish),
        nameChina: data.dec(_f$nameChina),
        nameJapan: data.dec(_f$nameJapan),
        parent: data.dec(_f$parent));
  }

  @override
  final Function instantiate = _instantiate;

  static PostCategoryDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostCategoryDTO>(map);
  }

  static PostCategoryDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<PostCategoryDTO>(json);
  }
}

mixin PostCategoryDTOMappable {
  String toJsonString() {
    return PostCategoryDTOMapper.ensureInitialized()
        .encodeJson<PostCategoryDTO>(this as PostCategoryDTO);
  }

  Map<String, dynamic> toJson() {
    return PostCategoryDTOMapper.ensureInitialized()
        .encodeMap<PostCategoryDTO>(this as PostCategoryDTO);
  }

  PostCategoryDTOCopyWith<PostCategoryDTO, PostCategoryDTO, PostCategoryDTO>
      get copyWith => _PostCategoryDTOCopyWithImpl(
          this as PostCategoryDTO, $identity, $identity);
  @override
  String toString() {
    return PostCategoryDTOMapper.ensureInitialized()
        .stringifyValue(this as PostCategoryDTO);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PostCategoryDTOMapper.ensureInitialized()
                .isValueEqual(this as PostCategoryDTO, other));
  }

  @override
  int get hashCode {
    return PostCategoryDTOMapper.ensureInitialized()
        .hashValue(this as PostCategoryDTO);
  }
}

extension PostCategoryDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostCategoryDTO, $Out> {
  PostCategoryDTOCopyWith<$R, PostCategoryDTO, $Out> get $asPostCategoryDTO =>
      $base.as((v, t, t2) => _PostCategoryDTOCopyWithImpl(v, t, t2));
}

abstract class PostCategoryDTOCopyWith<$R, $In extends PostCategoryDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SubCategoryDTOCopyWith<$R, SubCategoryDTO, SubCategoryDTO>? get parent;
  $R call(
      {int? id,
      CategoryType? categoryType,
      String? nameKorea,
      String? nameEnglish,
      String? nameChina,
      String? nameJapan,
      SubCategoryDTO? parent});
  PostCategoryDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PostCategoryDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostCategoryDTO, $Out>
    implements PostCategoryDTOCopyWith<$R, PostCategoryDTO, $Out> {
  _PostCategoryDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostCategoryDTO> $mapper =
      PostCategoryDTOMapper.ensureInitialized();
  @override
  SubCategoryDTOCopyWith<$R, SubCategoryDTO, SubCategoryDTO>? get parent =>
      $value.parent?.copyWith.$chain((v) => call(parent: v));
  @override
  $R call(
          {Object? id = $none,
          Object? categoryType = $none,
          Object? nameKorea = $none,
          Object? nameEnglish = $none,
          Object? nameChina = $none,
          Object? nameJapan = $none,
          Object? parent = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (categoryType != $none) #categoryType: categoryType,
        if (nameKorea != $none) #nameKorea: nameKorea,
        if (nameEnglish != $none) #nameEnglish: nameEnglish,
        if (nameChina != $none) #nameChina: nameChina,
        if (nameJapan != $none) #nameJapan: nameJapan,
        if (parent != $none) #parent: parent
      }));
  @override
  PostCategoryDTO $make(CopyWithData data) => PostCategoryDTO(
      id: data.get(#id, or: $value.id),
      categoryType: data.get(#categoryType, or: $value.categoryType),
      nameKorea: data.get(#nameKorea, or: $value.nameKorea),
      nameEnglish: data.get(#nameEnglish, or: $value.nameEnglish),
      nameChina: data.get(#nameChina, or: $value.nameChina),
      nameJapan: data.get(#nameJapan, or: $value.nameJapan),
      parent: data.get(#parent, or: $value.parent));

  @override
  PostCategoryDTOCopyWith<$R2, PostCategoryDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PostCategoryDTOCopyWithImpl($value, $cast, t);
}
