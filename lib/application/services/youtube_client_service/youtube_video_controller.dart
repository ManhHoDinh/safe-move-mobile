import 'package:dart_mappable/dart_mappable.dart';

import '../../../utilities/constants/constants.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../common/common.dart';
import '../file/file.dart';
import '../post_comment/post_comment.dart';

part 'youtube_video_controller.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum YoutubeVideoType {
  LONG,
  SHORT,
}

@MappableClass()
class YoutubeResponse with YoutubeResponseMappable {
  const YoutubeResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.title,
    this.thumbnail,
    this.commentCounter,
    this.viewCounter,
    this.reactionCounter,
    this.isReacted,
    this.videoUrl,
  });

  factory YoutubeResponse.fromJson(Map<String, dynamic> json) =>
      YoutubeResponseMapper.fromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? videoUrl;
  final YoutubeVideoType? type;
  final FileResponse? thumbnail;
  final int? reactionCounter;
  final int? viewCounter;
  final int? commentCounter;
  final bool? isReacted;
}

@MappableEnum(caseStyle: enumCaseStyle)
enum YoutubeVideoSort {
  LATEST,
  BY_VIEW,
  BY_REACTION,
}

@MappableClass()
class ReactionRequest with ReactionRequestMappable {
  const ReactionRequest({
    required this.isReact,
  });

  final bool isReact;
}

mixin YoutubeVideoController {
  Future<Result<Failure, PagingResponse<YoutubeResponse>>> getPlayList({
    int? page,
    int? size,
    String? keyword,
    YoutubeVideoType? youtubeVideoType,
    YoutubeVideoSort? sort,
  });

  Future<Result<Failure, YoutubeResponse>> getYoutubeVideoById({
    required int id,
  });

  Future<Result<Failure, PagingResponse<CommentResponse>>>
      getYoutubeVideoComments({
    required int id,
    int? page,
    int? size,
  });

  Future<Result<Failure, SuccessResponse>> reactYoutubeVideo({
    required int id,
    required ReactionRequest request,
  });

  Future<Result<Failure, CommentResponse>> saveComment({
    required int postId,
    required CommentCreationRequest request,
  });

  Future<Result<Failure, CommentResponse>> editComment({
    required int postId,
    required int commentId,
    required CommentUpdateRequest request,
  });

  Future<Result<Failure, SuccessResponse>> deleteComment({
    required int postId,
    required int commentId,
  });
}
