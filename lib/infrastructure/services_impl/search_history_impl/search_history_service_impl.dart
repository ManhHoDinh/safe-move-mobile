import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/failures/persistent/persistent.dart';
import '../../../application/services/app/search_history/search_history.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';

class SearchHistoryServiceImpl implements SearchHistoryService {
  const SearchHistoryServiceImpl({
    required this.prefs,
  });

  final SharedPreferences prefs;

  static const _searchHistoryKey = 'SM-search-history';

  @override
  Future<Result<Failure, SearchHistory>> getHistory() async {
    try {
      final result = prefs.getString(_searchHistoryKey);
      if (result?.isEmpty ?? true) {
        return const Right(SearchHistory(entries: []));
      }
      return Right(SearchHistoryMapper.fromJsonString(result!));
    } catch (error) {
      return const Left(PersistentReadFailure());
    }
  }

  @override
  Future<Result<Failure, void>> saveHistory(SearchHistory history) async {
    final serialized = history.toJsonString();
    await prefs.setString(_searchHistoryKey, serialized);
    return const Right(null);
  }
}
