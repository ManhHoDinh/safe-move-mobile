import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import 'play_list_item_response.dart';

mixin YoutubeClientService {
  Future<Result<Failure, PlayListItem>> getPlayList({
    String? pageToken,
    int? maxResults,
  });
}
