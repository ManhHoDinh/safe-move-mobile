import 'package:dart_mappable/dart_mappable.dart';

import '../../dto/dto.dart';

part 'get_referred_user_response.mapper.dart';

@MappableClass()
class GetReferredUserResponse with GetReferredUserResponseMappable {
  const GetReferredUserResponse({
    this.users,
  });

  factory GetReferredUserResponse.fromJson(Map<String, dynamic> json) =>
      GetReferredUserResponseMapper.fromJson(json);

  final List<UserDTO>? users;
}
