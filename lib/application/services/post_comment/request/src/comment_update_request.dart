import 'package:dart_mappable/dart_mappable.dart';

part 'comment_update_request.mapper.dart';

@MappableClass()
class CommentUpdateRequest with CommentUpdateRequestMappable {
  const CommentUpdateRequest({
    this.content,
  });

  final String? content;
}
