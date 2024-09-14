// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_response.dart';

class ProductResponseMapper extends ClassMapperBase<ProductResponse> {
  ProductResponseMapper._();

  static ProductResponseMapper? _instance;
  static ProductResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductResponseMapper._());
      LocalizedFieldValueMapper.ensureInitialized();
      FileResponseMapper.ensureInitialized();
      CategoryDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProductResponse';

  static int? _$id(ProductResponse v) => v.id;
  static const Field<ProductResponse, int> _f$id = Field('id', _$id, opt: true);
  static LocalizedFieldValue? _$title(ProductResponse v) => v.title;
  static const Field<ProductResponse, LocalizedFieldValue> _f$title =
      Field('title', _$title, opt: true);
  static LocalizedFieldValue? _$description(ProductResponse v) => v.description;
  static const Field<ProductResponse, LocalizedFieldValue> _f$description =
      Field('description', _$description, opt: true);
  static int? _$unitInStock(ProductResponse v) => v.unitInStock;
  static const Field<ProductResponse, int> _f$unitInStock =
      Field('unitInStock', _$unitInStock, opt: true);
  static double? _$originalPrice(ProductResponse v) => v.originalPrice;
  static const Field<ProductResponse, double> _f$originalPrice =
      Field('originalPrice', _$originalPrice, opt: true);
  static double? _$currentPrice(ProductResponse v) => v.currentPrice;
  static const Field<ProductResponse, double> _f$currentPrice =
      Field('currentPrice', _$currentPrice, opt: true);
  static double? _$defaultShippingFee(ProductResponse v) =>
      v.defaultShippingFee;
  static const Field<ProductResponse, double> _f$defaultShippingFee =
      Field('defaultShippingFee', _$defaultShippingFee, opt: true);
  static double? _$jejuShippingFee(ProductResponse v) => v.jejuShippingFee;
  static const Field<ProductResponse, double> _f$jejuShippingFee =
      Field('jejuShippingFee', _$jejuShippingFee, opt: true);
  static double? _$ruralShippingFee(ProductResponse v) => v.ruralShippingFee;
  static const Field<ProductResponse, double> _f$ruralShippingFee =
      Field('ruralShippingFee', _$ruralShippingFee, opt: true);
  static List<FileResponse>? _$images(ProductResponse v) => v.images;
  static const Field<ProductResponse, List<FileResponse>> _f$images =
      Field('images', _$images, opt: true);
  static CategoryDTO? _$category(ProductResponse v) => v.category;
  static const Field<ProductResponse, CategoryDTO> _f$category =
      Field('category', _$category, opt: true);
  static bool? _$isDeleted(ProductResponse v) => v.isDeleted;
  static const Field<ProductResponse, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true);
  static DateTime? _$createdAt(ProductResponse v) => v.createdAt;
  static const Field<ProductResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(ProductResponse v) => v.updatedAt;
  static const Field<ProductResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static double? _$ratingPoint(ProductResponse v) => v.ratingPoint;
  static const Field<ProductResponse, double> _f$ratingPoint =
      Field('ratingPoint', _$ratingPoint, opt: true);
  static int? _$totalUserRating(ProductResponse v) => v.totalUserRating;
  static const Field<ProductResponse, int> _f$totalUserRating =
      Field('totalUserRating', _$totalUserRating, opt: true);

  @override
  final MappableFields<ProductResponse> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #unitInStock: _f$unitInStock,
    #originalPrice: _f$originalPrice,
    #currentPrice: _f$currentPrice,
    #defaultShippingFee: _f$defaultShippingFee,
    #jejuShippingFee: _f$jejuShippingFee,
    #ruralShippingFee: _f$ruralShippingFee,
    #images: _f$images,
    #category: _f$category,
    #isDeleted: _f$isDeleted,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #ratingPoint: _f$ratingPoint,
    #totalUserRating: _f$totalUserRating,
  };

  static ProductResponse _instantiate(DecodingData data) {
    return ProductResponse(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        unitInStock: data.dec(_f$unitInStock),
        originalPrice: data.dec(_f$originalPrice),
        currentPrice: data.dec(_f$currentPrice),
        defaultShippingFee: data.dec(_f$defaultShippingFee),
        jejuShippingFee: data.dec(_f$jejuShippingFee),
        ruralShippingFee: data.dec(_f$ruralShippingFee),
        images: data.dec(_f$images),
        category: data.dec(_f$category),
        isDeleted: data.dec(_f$isDeleted),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        ratingPoint: data.dec(_f$ratingPoint),
        totalUserRating: data.dec(_f$totalUserRating));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductResponse>(map);
  }

  static ProductResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductResponse>(json);
  }
}

mixin ProductResponseMappable {
  String toJsonString() {
    return ProductResponseMapper.ensureInitialized()
        .encodeJson<ProductResponse>(this as ProductResponse);
  }

  Map<String, dynamic> toJson() {
    return ProductResponseMapper.ensureInitialized()
        .encodeMap<ProductResponse>(this as ProductResponse);
  }

  ProductResponseCopyWith<ProductResponse, ProductResponse, ProductResponse>
      get copyWith => _ProductResponseCopyWithImpl(
          this as ProductResponse, $identity, $identity);
  @override
  String toString() {
    return ProductResponseMapper.ensureInitialized()
        .stringifyValue(this as ProductResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductResponseMapper.ensureInitialized()
                .isValueEqual(this as ProductResponse, other));
  }

  @override
  int get hashCode {
    return ProductResponseMapper.ensureInitialized()
        .hashValue(this as ProductResponse);
  }
}

extension ProductResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductResponse, $Out> {
  ProductResponseCopyWith<$R, ProductResponse, $Out> get $asProductResponse =>
      $base.as((v, t, t2) => _ProductResponseCopyWithImpl(v, t, t2));
}

abstract class ProductResponseCopyWith<$R, $In extends ProductResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  LocalizedFieldValueCopyWith<$R, LocalizedFieldValue, LocalizedFieldValue>?
      get title;
  LocalizedFieldValueCopyWith<$R, LocalizedFieldValue, LocalizedFieldValue>?
      get description;
  ListCopyWith<$R, FileResponse,
      FileResponseCopyWith<$R, FileResponse, FileResponse>>? get images;
  CategoryDTOCopyWith<$R, CategoryDTO, CategoryDTO>? get category;
  $R call(
      {int? id,
      LocalizedFieldValue? title,
      LocalizedFieldValue? description,
      int? unitInStock,
      double? originalPrice,
      double? currentPrice,
      double? defaultShippingFee,
      double? jejuShippingFee,
      double? ruralShippingFee,
      List<FileResponse>? images,
      CategoryDTO? category,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt,
      double? ratingPoint,
      int? totalUserRating});
  ProductResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductResponse, $Out>
    implements ProductResponseCopyWith<$R, ProductResponse, $Out> {
  _ProductResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductResponse> $mapper =
      ProductResponseMapper.ensureInitialized();
  @override
  LocalizedFieldValueCopyWith<$R, LocalizedFieldValue, LocalizedFieldValue>?
      get title => $value.title?.copyWith.$chain((v) => call(title: v));
  @override
  LocalizedFieldValueCopyWith<$R, LocalizedFieldValue, LocalizedFieldValue>?
      get description =>
          $value.description?.copyWith.$chain((v) => call(description: v));
  @override
  ListCopyWith<$R, FileResponse,
          FileResponseCopyWith<$R, FileResponse, FileResponse>>?
      get images => $value.images != null
          ? ListCopyWith($value.images!, (v, t) => v.copyWith.$chain(t),
              (v) => call(images: v))
          : null;
  @override
  CategoryDTOCopyWith<$R, CategoryDTO, CategoryDTO>? get category =>
      $value.category?.copyWith.$chain((v) => call(category: v));
  @override
  $R call(
          {Object? id = $none,
          Object? title = $none,
          Object? description = $none,
          Object? unitInStock = $none,
          Object? originalPrice = $none,
          Object? currentPrice = $none,
          Object? defaultShippingFee = $none,
          Object? jejuShippingFee = $none,
          Object? ruralShippingFee = $none,
          Object? images = $none,
          Object? category = $none,
          Object? isDeleted = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? ratingPoint = $none,
          Object? totalUserRating = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != $none) #title: title,
        if (description != $none) #description: description,
        if (unitInStock != $none) #unitInStock: unitInStock,
        if (originalPrice != $none) #originalPrice: originalPrice,
        if (currentPrice != $none) #currentPrice: currentPrice,
        if (defaultShippingFee != $none)
          #defaultShippingFee: defaultShippingFee,
        if (jejuShippingFee != $none) #jejuShippingFee: jejuShippingFee,
        if (ruralShippingFee != $none) #ruralShippingFee: ruralShippingFee,
        if (images != $none) #images: images,
        if (category != $none) #category: category,
        if (isDeleted != $none) #isDeleted: isDeleted,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (ratingPoint != $none) #ratingPoint: ratingPoint,
        if (totalUserRating != $none) #totalUserRating: totalUserRating
      }));
  @override
  ProductResponse $make(CopyWithData data) => ProductResponse(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      unitInStock: data.get(#unitInStock, or: $value.unitInStock),
      originalPrice: data.get(#originalPrice, or: $value.originalPrice),
      currentPrice: data.get(#currentPrice, or: $value.currentPrice),
      defaultShippingFee:
          data.get(#defaultShippingFee, or: $value.defaultShippingFee),
      jejuShippingFee: data.get(#jejuShippingFee, or: $value.jejuShippingFee),
      ruralShippingFee:
          data.get(#ruralShippingFee, or: $value.ruralShippingFee),
      images: data.get(#images, or: $value.images),
      category: data.get(#category, or: $value.category),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      ratingPoint: data.get(#ratingPoint, or: $value.ratingPoint),
      totalUserRating: data.get(#totalUserRating, or: $value.totalUserRating));

  @override
  ProductResponseCopyWith<$R2, ProductResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductResponseCopyWithImpl($value, $cast, t);
}
