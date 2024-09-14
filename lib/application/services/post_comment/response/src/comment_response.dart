import 'package:dart_mappable/dart_mappable.dart';

import '../../../user/user.dart';
import 'child_comment_response.dart';

part 'comment_response.mapper.dart';

@MappableClass()
class CommentResponse with CommentResponseMappable {
  const CommentResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isHidden,
    this.user,
    this.childComments,
    this.content,
    this.postId,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      CommentResponseMapper.fromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? content;
  final bool? isHidden;
  final UserDTO? user;
  final List<ChildCommentResponse>? childComments;
  final int? postId;
}
