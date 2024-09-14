// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'supplement_user_information_request.dart';

class SupplementUserInformationRequestMapper
    extends ClassMapperBase<SupplementUserInformationRequest> {
  SupplementUserInformationRequestMapper._();

  static SupplementUserInformationRequestMapper? _instance;
  static SupplementUserInformationRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SupplementUserInformationRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SupplementUserInformationRequest';

  static String _$name(SupplementUserInformationRequest v) => v.name;
  static const Field<SupplementUserInformationRequest, String> _f$name =
      Field('name', _$name);
  static String _$phoneNumber(SupplementUserInformationRequest v) =>
      v.phoneNumber;
  static const Field<SupplementUserInformationRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);
  static String _$sessionToken(SupplementUserInformationRequest v) =>
      v.sessionToken;
  static const Field<SupplementUserInformationRequest, String> _f$sessionToken =
      Field('sessionToken', _$sessionToken);
  static String? _$referralPhoneNumber(SupplementUserInformationRequest v) =>
      v.referralPhoneNumber;
  static const Field<SupplementUserInformationRequest, String>
      _f$referralPhoneNumber =
      Field('referralPhoneNumber', _$referralPhoneNumber, opt: true);

  @override
  final MappableFields<SupplementUserInformationRequest> fields = const {
    #name: _f$name,
    #phoneNumber: _f$phoneNumber,
    #sessionToken: _f$sessionToken,
    #referralPhoneNumber: _f$referralPhoneNumber,
  };

  static SupplementUserInformationRequest _instantiate(DecodingData data) {
    return SupplementUserInformationRequest(
        name: data.dec(_f$name),
        phoneNumber: data.dec(_f$phoneNumber),
        sessionToken: data.dec(_f$sessionToken),
        referralPhoneNumber: data.dec(_f$referralPhoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static SupplementUserInformationRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupplementUserInformationRequest>(map);
  }

  static SupplementUserInformationRequest fromJsonString(String json) {
    return ensureInitialized()
        .decodeJson<SupplementUserInformationRequest>(json);
  }
}

mixin SupplementUserInformationRequestMappable {
  String toJsonString() {
    return SupplementUserInformationRequestMapper.ensureInitialized()
        .encodeJson<SupplementUserInformationRequest>(
            this as SupplementUserInformationRequest);
  }

  Map<String, dynamic> toJson() {
    return SupplementUserInformationRequestMapper.ensureInitialized()
        .encodeMap<SupplementUserInformationRequest>(
            this as SupplementUserInformationRequest);
  }

  SupplementUserInformationRequestCopyWith<SupplementUserInformationRequest,
          SupplementUserInformationRequest, SupplementUserInformationRequest>
      get copyWith => _SupplementUserInformationRequestCopyWithImpl(
          this as SupplementUserInformationRequest, $identity, $identity);
  @override
  String toString() {
    return SupplementUserInformationRequestMapper.ensureInitialized()
        .stringifyValue(this as SupplementUserInformationRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SupplementUserInformationRequestMapper.ensureInitialized()
                .isValueEqual(this as SupplementUserInformationRequest, other));
  }

  @override
  int get hashCode {
    return SupplementUserInformationRequestMapper.ensureInitialized()
        .hashValue(this as SupplementUserInformationRequest);
  }
}

extension SupplementUserInformationRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupplementUserInformationRequest, $Out> {
  SupplementUserInformationRequestCopyWith<$R, SupplementUserInformationRequest,
          $Out>
      get $asSupplementUserInformationRequest => $base.as((v, t, t2) =>
          _SupplementUserInformationRequestCopyWithImpl(v, t, t2));
}

abstract class SupplementUserInformationRequestCopyWith<
    $R,
    $In extends SupplementUserInformationRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? name,
      String? phoneNumber,
      String? sessionToken,
      String? referralPhoneNumber});
  SupplementUserInformationRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SupplementUserInformationRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupplementUserInformationRequest, $Out>
    implements
        SupplementUserInformationRequestCopyWith<$R,
            SupplementUserInformationRequest, $Out> {
  _SupplementUserInformationRequestCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupplementUserInformationRequest> $mapper =
      SupplementUserInformationRequestMapper.ensureInitialized();
  @override
  $R call(
          {String? name,
          String? phoneNumber,
          String? sessionToken,
          Object? referralPhoneNumber = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (sessionToken != null) #sessionToken: sessionToken,
        if (referralPhoneNumber != $none)
          #referralPhoneNumber: referralPhoneNumber
      }));
  @override
  SupplementUserInformationRequest $make(CopyWithData data) =>
      SupplementUserInformationRequest(
          name: data.get(#name, or: $value.name),
          phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
          sessionToken: data.get(#sessionToken, or: $value.sessionToken),
          referralPhoneNumber:
              data.get(#referralPhoneNumber, or: $value.referralPhoneNumber));

  @override
  SupplementUserInformationRequestCopyWith<$R2,
      SupplementUserInformationRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SupplementUserInformationRequestCopyWithImpl($value, $cast, t);
}
