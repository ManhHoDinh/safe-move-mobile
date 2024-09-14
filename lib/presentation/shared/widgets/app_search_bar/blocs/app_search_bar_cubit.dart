import 'dart:math';

import '../../../../../application/services/app/search_history/search_history.dart';
import '../../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../handlers/failure_handler/failure_handler_manager.dart';

class AppSearchBarState {
  const AppSearchBarState({this.entries = const []});

  final List<SearchEntry> entries;

  AppSearchBarState copyWith({List<SearchEntry>? entries}) {
    return AppSearchBarState(
      entries: entries ?? this.entries,
    );
  }
}

class AppSearchBarCubit extends SafeCubit<AppSearchBarState> {
  AppSearchBarCubit({
    required this.failureHandlerManager,
    required this.searchHistoryService,
  }) : super(const AppSearchBarState()) {
    _fetchData();
  }

  final FailureHandlerManager failureHandlerManager;
  final SearchHistoryService searchHistoryService;

  void _fetchData() async {
    final historyResult = await searchHistoryService.getHistory();
    if (historyResult.isLeft) {
      failureHandlerManager.handle(historyResult.left);
      return;
    }
    emit(state.copyWith(entries: historyResult.right.entries));
  }

  void reload() {
    _fetchData();
  }

  void saveEntry(String searchText) async {
    if (searchText.trim().isEmpty) {
      return;
    }
    final oldEntries = List<SearchEntry>.from(state.entries);
    oldEntries.removeWhere((element) => element.searchText == searchText);
    oldEntries.insert(
        0,
        SearchEntry(
            searchText: searchText,
            id: Random.secure().nextDouble().toString()));
    await _saveEntries(oldEntries);
    _fetchData();
  }

  Future<void> _saveEntries(List<SearchEntry> entries) async {
    final saveEntriesResult =
        await searchHistoryService.saveHistory(SearchHistory(entries: entries));
    if (saveEntriesResult.isLeft) {
      failureHandlerManager.handle(saveEntriesResult.left);
    }
  }

  void deleteEntry(String id) async {
    emit(state.copyWith(
        entries: state.entries.where((element) => element.id != id).toList()));
    final oldEntries = state.entries;
    oldEntries.removeWhere((element) => element.id == id);
    _saveEntries(oldEntries);
  }

  void deleteEntries() async {
    emit(state.copyWith(entries: []));
    _saveEntries(const []);
  }
}
