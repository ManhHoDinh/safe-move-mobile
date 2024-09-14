// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'search_history.dart';

class SearchHistoryMapper extends ClassMapperBase<SearchHistory> {
  SearchHistoryMapper._();

  static SearchHistoryMapper? _instance;
  static SearchHistoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchHistoryMapper._());
      SearchEntryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SearchHistory';

  static List<SearchEntry> _$entries(SearchHistory v) => v.entries;
  static const Field<SearchHistory, List<SearchEntry>> _f$entries =
      Field('entries', _$entries);

  @override
  final MappableFields<SearchHistory> fields = const {
    #entries: _f$entries,
  };

  static SearchHistory _instantiate(DecodingData data) {
    return SearchHistory(entries: data.dec(_f$entries));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchHistory fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SearchHistory>(map);
  }

  static SearchHistory fromJsonString(String json) {
    return ensureInitialized().decodeJson<SearchHistory>(json);
  }
}

mixin SearchHistoryMappable {
  String toJsonString() {
    return SearchHistoryMapper.ensureInitialized()
        .encodeJson<SearchHistory>(this as SearchHistory);
  }

  Map<String, dynamic> toJson() {
    return SearchHistoryMapper.ensureInitialized()
        .encodeMap<SearchHistory>(this as SearchHistory);
  }

  SearchHistoryCopyWith<SearchHistory, SearchHistory, SearchHistory>
      get copyWith => _SearchHistoryCopyWithImpl(
          this as SearchHistory, $identity, $identity);
  @override
  String toString() {
    return SearchHistoryMapper.ensureInitialized()
        .stringifyValue(this as SearchHistory);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SearchHistoryMapper.ensureInitialized()
                .isValueEqual(this as SearchHistory, other));
  }

  @override
  int get hashCode {
    return SearchHistoryMapper.ensureInitialized()
        .hashValue(this as SearchHistory);
  }
}

extension SearchHistoryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchHistory, $Out> {
  SearchHistoryCopyWith<$R, SearchHistory, $Out> get $asSearchHistory =>
      $base.as((v, t, t2) => _SearchHistoryCopyWithImpl(v, t, t2));
}

abstract class SearchHistoryCopyWith<$R, $In extends SearchHistory, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SearchEntry,
      SearchEntryCopyWith<$R, SearchEntry, SearchEntry>> get entries;
  $R call({List<SearchEntry>? entries});
  SearchHistoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SearchHistoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchHistory, $Out>
    implements SearchHistoryCopyWith<$R, SearchHistory, $Out> {
  _SearchHistoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchHistory> $mapper =
      SearchHistoryMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SearchEntry,
          SearchEntryCopyWith<$R, SearchEntry, SearchEntry>>
      get entries => ListCopyWith($value.entries,
          (v, t) => v.copyWith.$chain(t), (v) => call(entries: v));
  @override
  $R call({List<SearchEntry>? entries}) =>
      $apply(FieldCopyWithData({if (entries != null) #entries: entries}));
  @override
  SearchHistory $make(CopyWithData data) =>
      SearchHistory(entries: data.get(#entries, or: $value.entries));

  @override
  SearchHistoryCopyWith<$R2, SearchHistory, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchHistoryCopyWithImpl($value, $cast, t);
}

class SearchEntryMapper extends ClassMapperBase<SearchEntry> {
  SearchEntryMapper._();

  static SearchEntryMapper? _instance;
  static SearchEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchEntryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SearchEntry';

  static String _$searchText(SearchEntry v) => v.searchText;
  static const Field<SearchEntry, String> _f$searchText =
      Field('searchText', _$searchText);
  static String _$id(SearchEntry v) => v.id;
  static const Field<SearchEntry, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<SearchEntry> fields = const {
    #searchText: _f$searchText,
    #id: _f$id,
  };

  static SearchEntry _instantiate(DecodingData data) {
    return SearchEntry(
        searchText: data.dec(_f$searchText), id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchEntry fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SearchEntry>(map);
  }

  static SearchEntry fromJsonString(String json) {
    return ensureInitialized().decodeJson<SearchEntry>(json);
  }
}

mixin SearchEntryMappable {
  String toJsonString() {
    return SearchEntryMapper.ensureInitialized()
        .encodeJson<SearchEntry>(this as SearchEntry);
  }

  Map<String, dynamic> toJson() {
    return SearchEntryMapper.ensureInitialized()
        .encodeMap<SearchEntry>(this as SearchEntry);
  }

  SearchEntryCopyWith<SearchEntry, SearchEntry, SearchEntry> get copyWith =>
      _SearchEntryCopyWithImpl(this as SearchEntry, $identity, $identity);
  @override
  String toString() {
    return SearchEntryMapper.ensureInitialized()
        .stringifyValue(this as SearchEntry);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SearchEntryMapper.ensureInitialized()
                .isValueEqual(this as SearchEntry, other));
  }

  @override
  int get hashCode {
    return SearchEntryMapper.ensureInitialized().hashValue(this as SearchEntry);
  }
}

extension SearchEntryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchEntry, $Out> {
  SearchEntryCopyWith<$R, SearchEntry, $Out> get $asSearchEntry =>
      $base.as((v, t, t2) => _SearchEntryCopyWithImpl(v, t, t2));
}

abstract class SearchEntryCopyWith<$R, $In extends SearchEntry, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? searchText, String? id});
  SearchEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SearchEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchEntry, $Out>
    implements SearchEntryCopyWith<$R, SearchEntry, $Out> {
  _SearchEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchEntry> $mapper =
      SearchEntryMapper.ensureInitialized();
  @override
  $R call({String? searchText, String? id}) => $apply(FieldCopyWithData({
        if (searchText != null) #searchText: searchText,
        if (id != null) #id: id
      }));
  @override
  SearchEntry $make(CopyWithData data) => SearchEntry(
      searchText: data.get(#searchText, or: $value.searchText),
      id: data.get(#id, or: $value.id));

  @override
  SearchEntryCopyWith<$R2, SearchEntry, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchEntryCopyWithImpl($value, $cast, t);
}
