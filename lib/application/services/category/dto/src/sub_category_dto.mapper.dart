// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sub_category_dto.dart';

class SubCategoryDTOMapper extends ClassMapperBase<SubCategoryDTO> {
  SubCategoryDTOMapper._();

  static SubCategoryDTOMapper? _instance;
  static SubCategoryDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubCategoryDTOMapper._());
      CategoryTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SubCategoryDTO';

  static int? _$id(SubCategoryDTO v) => v.id;
  static const Field<SubCategoryDTO, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(SubCategoryDTO v) => v.name;
  static const Field<SubCategoryDTO, String> _f$name =
      Field('name', _$name, opt: true);
  static CategoryType? _$categoryType(SubCategoryDTO v) => v.categoryType;
  static const Field<SubCategoryDTO, CategoryType> _f$categoryType =
      Field('categoryType', _$categoryType, opt: true);
  static String? _$nameKorea(SubCategoryDTO v) => v.nameKorea;
  static const Field<SubCategoryDTO, String> _f$nameKorea =
      Field('nameKorea', _$nameKorea, opt: true);
  static String? _$nameEnglish(SubCategoryDTO v) => v.nameEnglish;
  static const Field<SubCategoryDTO, String> _f$nameEnglish =
      Field('nameEnglish', _$nameEnglish, opt: true);
  static String? _$nameChina(SubCategoryDTO v) => v.nameChina;
  static const Field<SubCategoryDTO, String> _f$nameChina =
      Field('nameChina', _$nameChina, opt: true);
  static String? _$nameJapan(SubCategoryDTO v) => v.nameJapan;
  static const Field<SubCategoryDTO, String> _f$nameJapan =
      Field('nameJapan', _$nameJapan, opt: true);

  @override
  final MappableFields<SubCategoryDTO> fields = const {
    #id: _f$id,
    #name: _f$name,
    #categoryType: _f$categoryType,
    #nameKorea: _f$nameKorea,
    #nameEnglish: _f$nameEnglish,
    #nameChina: _f$nameChina,
    #nameJapan: _f$nameJapan,
  };

  static SubCategoryDTO _instantiate(DecodingData data) {
    return SubCategoryDTO(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        categoryType: data.dec(_f$categoryType),
        nameKorea: data.dec(_f$nameKorea),
        nameEnglish: data.dec(_f$nameEnglish),
        nameChina: data.dec(_f$nameChina),
        nameJapan: data.dec(_f$nameJapan));
  }

  @override
  final Function instantiate = _instantiate;

  static SubCategoryDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubCategoryDTO>(map);
  }

  static SubCategoryDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<SubCategoryDTO>(json);
  }
}

mixin SubCategoryDTOMappable {
  String toJsonString() {
    return SubCategoryDTOMapper.ensureInitialized()
        .encodeJson<SubCategoryDTO>(this as SubCategoryDTO);
  }

  Map<String, dynamic> toJson() {
    return SubCategoryDTOMapper.ensureInitialized()
        .encodeMap<SubCategoryDTO>(this as SubCategoryDTO);
  }

  SubCategoryDTOCopyWith<SubCategoryDTO, SubCategoryDTO, SubCategoryDTO>
      get copyWith => _SubCategoryDTOCopyWithImpl(
          this as SubCategoryDTO, $identity, $identity);
  @override
  String toString() {
    return SubCategoryDTOMapper.ensureInitialized()
        .stringifyValue(this as SubCategoryDTO);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SubCategoryDTOMapper.ensureInitialized()
                .isValueEqual(this as SubCategoryDTO, other));
  }

  @override
  int get hashCode {
    return SubCategoryDTOMapper.ensureInitialized()
        .hashValue(this as SubCategoryDTO);
  }
}

extension SubCategoryDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubCategoryDTO, $Out> {
  SubCategoryDTOCopyWith<$R, SubCategoryDTO, $Out> get $asSubCategoryDTO =>
      $base.as((v, t, t2) => _SubCategoryDTOCopyWithImpl(v, t, t2));
}

abstract class SubCategoryDTOCopyWith<$R, $In extends SubCategoryDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? name,
      CategoryType? categoryType,
      String? nameKorea,
      String? nameEnglish,
      String? nameChina,
      String? nameJapan});
  SubCategoryDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubCategoryDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubCategoryDTO, $Out>
    implements SubCategoryDTOCopyWith<$R, SubCategoryDTO, $Out> {
  _SubCategoryDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubCategoryDTO> $mapper =
      SubCategoryDTOMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? categoryType = $none,
          Object? nameKorea = $none,
          Object? nameEnglish = $none,
          Object? nameChina = $none,
          Object? nameJapan = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (categoryType != $none) #categoryType: categoryType,
        if (nameKorea != $none) #nameKorea: nameKorea,
        if (nameEnglish != $none) #nameEnglish: nameEnglish,
        if (nameChina != $none) #nameChina: nameChina,
        if (nameJapan != $none) #nameJapan: nameJapan
      }));
  @override
  SubCategoryDTO $make(CopyWithData data) => SubCategoryDTO(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      categoryType: data.get(#categoryType, or: $value.categoryType),
      nameKorea: data.get(#nameKorea, or: $value.nameKorea),
      nameEnglish: data.get(#nameEnglish, or: $value.nameEnglish),
      nameChina: data.get(#nameChina, or: $value.nameChina),
      nameJapan: data.get(#nameJapan, or: $value.nameJapan));

  @override
  SubCategoryDTOCopyWith<$R2, SubCategoryDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubCategoryDTOCopyWithImpl($value, $cast, t);
}
