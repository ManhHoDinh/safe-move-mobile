import 'package:dart_mappable/dart_mappable.dart';

import '../../../user/user.dart';
import '../../post_comment.dart';
import '../response.dart';

part 'child_comment_response.mapper.dart';

@MappableClass()
class ChildCommentResponse with ChildCommentResponseMappable {
  const ChildCommentResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isHidden,
    this.user,
    this.content,
  });

  factory ChildCommentResponse.fromJson(Map<String, dynamic> json) =>
      ChildCommentResponseMapper.fromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isHidden;
  final UserDTO? user;
  final String? content;

  static ChildCommentResponse fromComment(CommentResponse commentResponse) {
    return ChildCommentResponse(
      id: commentResponse.id,
      createdAt: commentResponse.createdAt,
      updatedAt: commentResponse.updatedAt,
      isHidden: commentResponse.isHidden,
      content: commentResponse.content,
      user: commentResponse.user,
    );
  }
}
