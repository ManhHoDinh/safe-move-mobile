import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/failures/youtube_failure/youtube_failure.dart';
import '../../../application/services/youtube_client_service/play_list_item_response.dart';
import '../../../application/services/youtube_client_service/youtube_client_service.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';

part 'youtube_client_service_impl.g.dart';

class YoutubeClientServiceImpl with YoutubeClientService {
  const YoutubeClientServiceImpl({
    required this.youtubeDataSource,
    required this.apiKey,
    required this.channelPlayListId,
  });

  final String apiKey;
  final String channelPlayListId;
  final YoutubeDataSource youtubeDataSource;

  @override
  Future<Result<Failure, PlayListItem>> getPlayList({
    String? pageToken,
    int? maxResults,
  }) async {
    try {
      final result = await youtubeDataSource.getPlayList(
        pageToken: pageToken,
        part: 'snippet',
        playListId: channelPlayListId,
        key: apiKey,
        maxResults: maxResults,
      );
      return Right(result);
    } on DioException catch (error) {
      return Left(
        YoutubeFailure(
          apiPath: error.response?.realUri.toString() ?? '',
          statusCode: error.response?.statusCode ?? 0,
        ),
      );
    }
  }
}

@RestApi()
abstract class YoutubeDataSource {
  factory YoutubeDataSource(Dio dio, {String baseUrl}) = _YoutubeDataSource;

  static const _endpoints =
      'https://www.googleapis.com/youtube/v3/playlistItems';

  @GET(_endpoints)
  Future<PlayListItem> getPlayList({
    @Query('pageToken') String? pageToken,
    @Query('part') String? part,
    @Query('playlistId') String? playListId,
    @Query('key') String? key,
    @Query('maxResults') int? maxResults,
  });
}
