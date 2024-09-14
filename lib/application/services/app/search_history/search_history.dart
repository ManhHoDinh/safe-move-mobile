import 'package:dart_mappable/dart_mappable.dart';

import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';

part 'search_history.mapper.dart';

@MappableClass()
class SearchHistory with SearchHistoryMappable {
  const SearchHistory({
    required this.entries,
  });
  factory SearchHistory.fromJson(Map<String, dynamic> json) =>
      SearchHistoryMapper.fromJson(json);
  final List<SearchEntry> entries;
}

@MappableClass()
class SearchEntry with SearchEntryMappable {
  const SearchEntry({
    required this.searchText,
    required this.id,
  });
  factory SearchEntry.fromJson(Map<String, dynamic> json) =>
      SearchEntryMapper.fromJson(json);

  final String id;
  final String searchText;
}

abstract interface class SearchHistoryService {
  Future<Result<Failure, SearchHistory>> getHistory();

  Future<Result<Failure, void>> saveHistory(SearchHistory history);
}
