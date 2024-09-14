// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'main_page_title_response.dart';

class MainPageTitleResponseMapper
    extends ClassMapperBase<MainPageTitleResponse> {
  MainPageTitleResponseMapper._();

  static MainPageTitleResponseMapper? _instance;
  static MainPageTitleResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MainPageTitleResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MainPageTitleResponse';

  static int? _$id(MainPageTitleResponse v) => v.id;
  static const Field<MainPageTitleResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$firstTitleKr(MainPageTitleResponse v) => v.firstTitleKr;
  static const Field<MainPageTitleResponse, String> _f$firstTitleKr =
      Field('firstTitleKr', _$firstTitleKr, opt: true);
  static String? _$firstTitleEn(MainPageTitleResponse v) => v.firstTitleEn;
  static const Field<MainPageTitleResponse, String> _f$firstTitleEn =
      Field('firstTitleEn', _$firstTitleEn, opt: true);
  static String? _$firstTitleCn(MainPageTitleResponse v) => v.firstTitleCn;
  static const Field<MainPageTitleResponse, String> _f$firstTitleCn =
      Field('firstTitleCn', _$firstTitleCn, opt: true);
  static String? _$firstTitleJp(MainPageTitleResponse v) => v.firstTitleJp;
  static const Field<MainPageTitleResponse, String> _f$firstTitleJp =
      Field('firstTitleJp', _$firstTitleJp, opt: true);
  static String? _$secondTitleKr(MainPageTitleResponse v) => v.secondTitleKr;
  static const Field<MainPageTitleResponse, String> _f$secondTitleKr =
      Field('secondTitleKr', _$secondTitleKr, opt: true);
  static String? _$secondTitleEn(MainPageTitleResponse v) => v.secondTitleEn;
  static const Field<MainPageTitleResponse, String> _f$secondTitleEn =
      Field('secondTitleEn', _$secondTitleEn, opt: true);
  static String? _$secondTitleCn(MainPageTitleResponse v) => v.secondTitleCn;
  static const Field<MainPageTitleResponse, String> _f$secondTitleCn =
      Field('secondTitleCn', _$secondTitleCn, opt: true);
  static String? _$secondTitleJp(MainPageTitleResponse v) => v.secondTitleJp;
  static const Field<MainPageTitleResponse, String> _f$secondTitleJp =
      Field('secondTitleJp', _$secondTitleJp, opt: true);
  static String? _$thirdTitleKr(MainPageTitleResponse v) => v.thirdTitleKr;
  static const Field<MainPageTitleResponse, String> _f$thirdTitleKr =
      Field('thirdTitleKr', _$thirdTitleKr, opt: true);
  static String? _$thirdTitleEn(MainPageTitleResponse v) => v.thirdTitleEn;
  static const Field<MainPageTitleResponse, String> _f$thirdTitleEn =
      Field('thirdTitleEn', _$thirdTitleEn, opt: true);
  static String? _$thirdTitleCn(MainPageTitleResponse v) => v.thirdTitleCn;
  static const Field<MainPageTitleResponse, String> _f$thirdTitleCn =
      Field('thirdTitleCn', _$thirdTitleCn, opt: true);
  static String? _$thirdTitleJp(MainPageTitleResponse v) => v.thirdTitleJp;
  static const Field<MainPageTitleResponse, String> _f$thirdTitleJp =
      Field('thirdTitleJp', _$thirdTitleJp, opt: true);
  static String? _$fourthTitleKr(MainPageTitleResponse v) => v.fourthTitleKr;
  static const Field<MainPageTitleResponse, String> _f$fourthTitleKr =
      Field('fourthTitleKr', _$fourthTitleKr, opt: true);
  static String? _$fourthTitleEn(MainPageTitleResponse v) => v.fourthTitleEn;
  static const Field<MainPageTitleResponse, String> _f$fourthTitleEn =
      Field('fourthTitleEn', _$fourthTitleEn, opt: true);
  static String? _$fourthTitleCn(MainPageTitleResponse v) => v.fourthTitleCn;
  static const Field<MainPageTitleResponse, String> _f$fourthTitleCn =
      Field('fourthTitleCn', _$fourthTitleCn, opt: true);
  static String? _$fourthTitleJp(MainPageTitleResponse v) => v.fourthTitleJp;
  static const Field<MainPageTitleResponse, String> _f$fourthTitleJp =
      Field('fourthTitleJp', _$fourthTitleJp, opt: true);

  @override
  final MappableFields<MainPageTitleResponse> fields = const {
    #id: _f$id,
    #firstTitleKr: _f$firstTitleKr,
    #firstTitleEn: _f$firstTitleEn,
    #firstTitleCn: _f$firstTitleCn,
    #firstTitleJp: _f$firstTitleJp,
    #secondTitleKr: _f$secondTitleKr,
    #secondTitleEn: _f$secondTitleEn,
    #secondTitleCn: _f$secondTitleCn,
    #secondTitleJp: _f$secondTitleJp,
    #thirdTitleKr: _f$thirdTitleKr,
    #thirdTitleEn: _f$thirdTitleEn,
    #thirdTitleCn: _f$thirdTitleCn,
    #thirdTitleJp: _f$thirdTitleJp,
    #fourthTitleKr: _f$fourthTitleKr,
    #fourthTitleEn: _f$fourthTitleEn,
    #fourthTitleCn: _f$fourthTitleCn,
    #fourthTitleJp: _f$fourthTitleJp,
  };

  static MainPageTitleResponse _instantiate(DecodingData data) {
    return MainPageTitleResponse(
        id: data.dec(_f$id),
        firstTitleKr: data.dec(_f$firstTitleKr),
        firstTitleEn: data.dec(_f$firstTitleEn),
        firstTitleCn: data.dec(_f$firstTitleCn),
        firstTitleJp: data.dec(_f$firstTitleJp),
        secondTitleKr: data.dec(_f$secondTitleKr),
        secondTitleEn: data.dec(_f$secondTitleEn),
        secondTitleCn: data.dec(_f$secondTitleCn),
        secondTitleJp: data.dec(_f$secondTitleJp),
        thirdTitleKr: data.dec(_f$thirdTitleKr),
        thirdTitleEn: data.dec(_f$thirdTitleEn),
        thirdTitleCn: data.dec(_f$thirdTitleCn),
        thirdTitleJp: data.dec(_f$thirdTitleJp),
        fourthTitleKr: data.dec(_f$fourthTitleKr),
        fourthTitleEn: data.dec(_f$fourthTitleEn),
        fourthTitleCn: data.dec(_f$fourthTitleCn),
        fourthTitleJp: data.dec(_f$fourthTitleJp));
  }

  @override
  final Function instantiate = _instantiate;

  static MainPageTitleResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MainPageTitleResponse>(map);
  }

  static MainPageTitleResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<MainPageTitleResponse>(json);
  }
}

mixin MainPageTitleResponseMappable {
  String toJsonString() {
    return MainPageTitleResponseMapper.ensureInitialized()
        .encodeJson<MainPageTitleResponse>(this as MainPageTitleResponse);
  }

  Map<String, dynamic> toJson() {
    return MainPageTitleResponseMapper.ensureInitialized()
        .encodeMap<MainPageTitleResponse>(this as MainPageTitleResponse);
  }

  MainPageTitleResponseCopyWith<MainPageTitleResponse, MainPageTitleResponse,
          MainPageTitleResponse>
      get copyWith => _MainPageTitleResponseCopyWithImpl(
          this as MainPageTitleResponse, $identity, $identity);
  @override
  String toString() {
    return MainPageTitleResponseMapper.ensureInitialized()
        .stringifyValue(this as MainPageTitleResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MainPageTitleResponseMapper.ensureInitialized()
                .isValueEqual(this as MainPageTitleResponse, other));
  }

  @override
  int get hashCode {
    return MainPageTitleResponseMapper.ensureInitialized()
        .hashValue(this as MainPageTitleResponse);
  }
}

extension MainPageTitleResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MainPageTitleResponse, $Out> {
  MainPageTitleResponseCopyWith<$R, MainPageTitleResponse, $Out>
      get $asMainPageTitleResponse =>
          $base.as((v, t, t2) => _MainPageTitleResponseCopyWithImpl(v, t, t2));
}

abstract class MainPageTitleResponseCopyWith<
    $R,
    $In extends MainPageTitleResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? firstTitleKr,
      String? firstTitleEn,
      String? firstTitleCn,
      String? firstTitleJp,
      String? secondTitleKr,
      String? secondTitleEn,
      String? secondTitleCn,
      String? secondTitleJp,
      String? thirdTitleKr,
      String? thirdTitleEn,
      String? thirdTitleCn,
      String? thirdTitleJp,
      String? fourthTitleKr,
      String? fourthTitleEn,
      String? fourthTitleCn,
      String? fourthTitleJp});
  MainPageTitleResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MainPageTitleResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MainPageTitleResponse, $Out>
    implements MainPageTitleResponseCopyWith<$R, MainPageTitleResponse, $Out> {
  _MainPageTitleResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MainPageTitleResponse> $mapper =
      MainPageTitleResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? firstTitleKr = $none,
          Object? firstTitleEn = $none,
          Object? firstTitleCn = $none,
          Object? firstTitleJp = $none,
          Object? secondTitleKr = $none,
          Object? secondTitleEn = $none,
          Object? secondTitleCn = $none,
          Object? secondTitleJp = $none,
          Object? thirdTitleKr = $none,
          Object? thirdTitleEn = $none,
          Object? thirdTitleCn = $none,
          Object? thirdTitleJp = $none,
          Object? fourthTitleKr = $none,
          Object? fourthTitleEn = $none,
          Object? fourthTitleCn = $none,
          Object? fourthTitleJp = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (firstTitleKr != $none) #firstTitleKr: firstTitleKr,
        if (firstTitleEn != $none) #firstTitleEn: firstTitleEn,
        if (firstTitleCn != $none) #firstTitleCn: firstTitleCn,
        if (firstTitleJp != $none) #firstTitleJp: firstTitleJp,
        if (secondTitleKr != $none) #secondTitleKr: secondTitleKr,
        if (secondTitleEn != $none) #secondTitleEn: secondTitleEn,
        if (secondTitleCn != $none) #secondTitleCn: secondTitleCn,
        if (secondTitleJp != $none) #secondTitleJp: secondTitleJp,
        if (thirdTitleKr != $none) #thirdTitleKr: thirdTitleKr,
        if (thirdTitleEn != $none) #thirdTitleEn: thirdTitleEn,
        if (thirdTitleCn != $none) #thirdTitleCn: thirdTitleCn,
        if (thirdTitleJp != $none) #thirdTitleJp: thirdTitleJp,
        if (fourthTitleKr != $none) #fourthTitleKr: fourthTitleKr,
        if (fourthTitleEn != $none) #fourthTitleEn: fourthTitleEn,
        if (fourthTitleCn != $none) #fourthTitleCn: fourthTitleCn,
        if (fourthTitleJp != $none) #fourthTitleJp: fourthTitleJp
      }));
  @override
  MainPageTitleResponse $make(CopyWithData data) => MainPageTitleResponse(
      id: data.get(#id, or: $value.id),
      firstTitleKr: data.get(#firstTitleKr, or: $value.firstTitleKr),
      firstTitleEn: data.get(#firstTitleEn, or: $value.firstTitleEn),
      firstTitleCn: data.get(#firstTitleCn, or: $value.firstTitleCn),
      firstTitleJp: data.get(#firstTitleJp, or: $value.firstTitleJp),
      secondTitleKr: data.get(#secondTitleKr, or: $value.secondTitleKr),
      secondTitleEn: data.get(#secondTitleEn, or: $value.secondTitleEn),
      secondTitleCn: data.get(#secondTitleCn, or: $value.secondTitleCn),
      secondTitleJp: data.get(#secondTitleJp, or: $value.secondTitleJp),
      thirdTitleKr: data.get(#thirdTitleKr, or: $value.thirdTitleKr),
      thirdTitleEn: data.get(#thirdTitleEn, or: $value.thirdTitleEn),
      thirdTitleCn: data.get(#thirdTitleCn, or: $value.thirdTitleCn),
      thirdTitleJp: data.get(#thirdTitleJp, or: $value.thirdTitleJp),
      fourthTitleKr: data.get(#fourthTitleKr, or: $value.fourthTitleKr),
      fourthTitleEn: data.get(#fourthTitleEn, or: $value.fourthTitleEn),
      fourthTitleCn: data.get(#fourthTitleCn, or: $value.fourthTitleCn),
      fourthTitleJp: data.get(#fourthTitleJp, or: $value.fourthTitleJp));

  @override
  MainPageTitleResponseCopyWith<$R2, MainPageTitleResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MainPageTitleResponseCopyWithImpl($value, $cast, t);
}
