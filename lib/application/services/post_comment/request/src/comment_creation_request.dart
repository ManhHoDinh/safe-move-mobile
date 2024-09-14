import 'package:dart_mappable/dart_mappable.dart';

part 'comment_creation_request.mapper.dart';

@MappableClass()
class CommentCreationRequest with CommentCreationRequestMappable {
  const CommentCreationRequest({
    this.content,
    this.commentParentId,
  });

  final String? content;
  final int? commentParentId;
}
