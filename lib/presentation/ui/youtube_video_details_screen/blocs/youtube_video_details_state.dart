part of 'youtube_video_details_cubit.dart';

class YoutubeVideoDetailsState {
  const YoutubeVideoDetailsState({
    this.apiStatus = ApiStatus.initial,
    this.youtubeResponse,
    this.isReacted = false,
    this.reactionCount = 0,
  });

  final ApiStatus apiStatus;
  final YoutubeResponse? youtubeResponse;
  final bool isReacted;
  final int reactionCount;

  YoutubeVideoDetailsState copyWith({
    ApiStatus? apiStatus,
    YoutubeResponse? youtubeResponse,
    bool? isReacted,
    int? reactionCount,
  }) {
    return YoutubeVideoDetailsState(
      apiStatus: apiStatus ?? this.apiStatus,
      youtubeResponse: youtubeResponse ?? this.youtubeResponse,
      isReacted: isReacted ?? this.isReacted,
      reactionCount: reactionCount ?? this.reactionCount,
    );
  }
}
