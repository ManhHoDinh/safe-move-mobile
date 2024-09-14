// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category_dto.dart';

class CategoryDTOMapper extends ClassMapperBase<CategoryDTO> {
  CategoryDTOMapper._();

  static CategoryDTOMapper? _instance;
  static CategoryDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryDTOMapper._());
      CategoryTypeMapper.ensureInitialized();
      SubCategoryDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryDTO';

  static int? _$id(CategoryDTO v) => v.id;
  static const Field<CategoryDTO, int> _f$id = Field('id', _$id, opt: true);
  static String? _$nameKorea(CategoryDTO v) => v.nameKorea;
  static const Field<CategoryDTO, String> _f$nameKorea =
      Field('nameKorea', _$nameKorea, opt: true);
  static String? _$nameEnglish(CategoryDTO v) => v.nameEnglish;
  static const Field<CategoryDTO, String> _f$nameEnglish =
      Field('nameEnglish', _$nameEnglish, opt: true);
  static String? _$nameChina(CategoryDTO v) => v.nameChina;
  static const Field<CategoryDTO, String> _f$nameChina =
      Field('nameChina', _$nameChina, opt: true);
  static String? _$nameJapan(CategoryDTO v) => v.nameJapan;
  static const Field<CategoryDTO, String> _f$nameJapan =
      Field('nameJapan', _$nameJapan, opt: true);
  static CategoryType? _$categoryType(CategoryDTO v) => v.categoryType;
  static const Field<CategoryDTO, CategoryType> _f$categoryType =
      Field('categoryType', _$categoryType, opt: true);
  static List<SubCategoryDTO>? _$children(CategoryDTO v) => v.children;
  static const Field<CategoryDTO, List<SubCategoryDTO>> _f$children =
      Field('children', _$children, opt: true);
  static bool? _$isRoot(CategoryDTO v) => v.isRoot;
  static const Field<CategoryDTO, bool> _f$isRoot =
      Field('isRoot', _$isRoot, opt: true);
  static bool? _$isFavorite(CategoryDTO v) => v.isFavorite;
  static const Field<CategoryDTO, bool> _f$isFavorite =
      Field('isFavorite', _$isFavorite, opt: true);

  @override
  final MappableFields<CategoryDTO> fields = const {
    #id: _f$id,
    #nameKorea: _f$nameKorea,
    #nameEnglish: _f$nameEnglish,
    #nameChina: _f$nameChina,
    #nameJapan: _f$nameJapan,
    #categoryType: _f$categoryType,
    #children: _f$children,
    #isRoot: _f$isRoot,
    #isFavorite: _f$isFavorite,
  };

  static CategoryDTO _instantiate(DecodingData data) {
    return CategoryDTO(
        id: data.dec(_f$id),
        nameKorea: data.dec(_f$nameKorea),
        nameEnglish: data.dec(_f$nameEnglish),
        nameChina: data.dec(_f$nameChina),
        nameJapan: data.dec(_f$nameJapan),
        categoryType: data.dec(_f$categoryType),
        children: data.dec(_f$children),
        isRoot: data.dec(_f$isRoot),
        isFavorite: data.dec(_f$isFavorite));
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryDTO>(map);
  }

  static CategoryDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<CategoryDTO>(json);
  }
}

mixin CategoryDTOMappable {
  String toJsonString() {
    return CategoryDTOMapper.ensureInitialized()
        .encodeJson<CategoryDTO>(this as CategoryDTO);
  }

  Map<String, dynamic> toJson() {
    return CategoryDTOMapper.ensureInitialized()
        .encodeMap<CategoryDTO>(this as CategoryDTO);
  }

  CategoryDTOCopyWith<CategoryDTO, CategoryDTO, CategoryDTO> get copyWith =>
      _CategoryDTOCopyWithImpl(this as CategoryDTO, $identity, $identity);
  @override
  String toString() {
    return CategoryDTOMapper.ensureInitialized()
        .stringifyValue(this as CategoryDTO);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CategoryDTOMapper.ensureInitialized()
                .isValueEqual(this as CategoryDTO, other));
  }

  @override
  int get hashCode {
    return CategoryDTOMapper.ensureInitialized().hashValue(this as CategoryDTO);
  }
}

extension CategoryDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryDTO, $Out> {
  CategoryDTOCopyWith<$R, CategoryDTO, $Out> get $asCategoryDTO =>
      $base.as((v, t, t2) => _CategoryDTOCopyWithImpl(v, t, t2));
}

abstract class CategoryDTOCopyWith<$R, $In extends CategoryDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SubCategoryDTO,
      SubCategoryDTOCopyWith<$R, SubCategoryDTO, SubCategoryDTO>>? get children;
  $R call(
      {int? id,
      String? nameKorea,
      String? nameEnglish,
      String? nameChina,
      String? nameJapan,
      CategoryType? categoryType,
      List<SubCategoryDTO>? children,
      bool? isRoot,
      bool? isFavorite});
  CategoryDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryDTO, $Out>
    implements CategoryDTOCopyWith<$R, CategoryDTO, $Out> {
  _CategoryDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryDTO> $mapper =
      CategoryDTOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SubCategoryDTO,
          SubCategoryDTOCopyWith<$R, SubCategoryDTO, SubCategoryDTO>>?
      get children => $value.children != null
          ? ListCopyWith($value.children!, (v, t) => v.copyWith.$chain(t),
              (v) => call(children: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? nameKorea = $none,
          Object? nameEnglish = $none,
          Object? nameChina = $none,
          Object? nameJapan = $none,
          Object? categoryType = $none,
          Object? children = $none,
          Object? isRoot = $none,
          Object? isFavorite = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (nameKorea != $none) #nameKorea: nameKorea,
        if (nameEnglish != $none) #nameEnglish: nameEnglish,
        if (nameChina != $none) #nameChina: nameChina,
        if (nameJapan != $none) #nameJapan: nameJapan,
        if (categoryType != $none) #categoryType: categoryType,
        if (children != $none) #children: children,
        if (isRoot != $none) #isRoot: isRoot,
        if (isFavorite != $none) #isFavorite: isFavorite
      }));
  @override
  CategoryDTO $make(CopyWithData data) => CategoryDTO(
      id: data.get(#id, or: $value.id),
      nameKorea: data.get(#nameKorea, or: $value.nameKorea),
      nameEnglish: data.get(#nameEnglish, or: $value.nameEnglish),
      nameChina: data.get(#nameChina, or: $value.nameChina),
      nameJapan: data.get(#nameJapan, or: $value.nameJapan),
      categoryType: data.get(#categoryType, or: $value.categoryType),
      children: data.get(#children, or: $value.children),
      isRoot: data.get(#isRoot, or: $value.isRoot),
      isFavorite: data.get(#isFavorite, or: $value.isFavorite));

  @override
  CategoryDTOCopyWith<$R2, CategoryDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CategoryDTOCopyWithImpl($value, $cast, t);
}
