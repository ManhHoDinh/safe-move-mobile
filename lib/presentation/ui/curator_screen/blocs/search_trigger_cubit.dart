import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';

class SearchTriggerState {
  const SearchTriggerState({this.query = ''});

  final String query;
}

class SearchTriggerCubit extends SafeCubit<SearchTriggerState> {
  SearchTriggerCubit() : super(const SearchTriggerState());

  void query(String searchText) {
    emit(SearchTriggerState(query: searchText));
  }
}
