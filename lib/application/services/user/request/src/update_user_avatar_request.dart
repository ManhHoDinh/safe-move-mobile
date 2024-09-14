import 'package:dart_mappable/dart_mappable.dart';

import 'file_request.dart';

part 'update_user_avatar_request.mapper.dart';

@MappableClass()
class UpdateUserAvatarRequest with UpdateUserAvatarRequestMappable {
  const UpdateUserAvatarRequest({
    required this.avatar,
  });

  final FileRequest avatar;
}
