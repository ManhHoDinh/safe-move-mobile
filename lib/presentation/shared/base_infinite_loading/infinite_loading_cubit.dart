import 'package:meta/meta.dart';

import '../../../utilities/api_status/api_status.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../handlers/failure_handler/failure_handler_manager.dart';

abstract class InfiniteLoaderState<T> {
  const InfiniteLoaderState({
    this.data = const [],
    this.isFirstLoad = true,
    this.infiniteLoadingFailure,
    this.infiniteLoadingStatus = ApiStatus.initial,
    this.totalItems = 0,
  });

  final List<T> data;
  final int totalItems;
  final bool isFirstLoad;
  final Failure? infiniteLoadingFailure;
  final ApiStatus infiniteLoadingStatus;

  // return current state replaced by specified elements,
  // consider the nullability of each
  InfiniteLoaderState<T> loadingManagementStateChanged({
    List<T>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  });
}

abstract class InfiniteLoaderCubit<S extends InfiniteLoaderState<T>, T>
    extends SafeCubit<S> {
  InfiniteLoaderCubit({
    int startPage = 1,
    int pageSize = 20,
    required this.failureHandlerManager,
    required S initialState,
  })  : _startPage = startPage,
        _page = startPage,
        _pageSize = pageSize,
        super(initialState) {
    onInit();
  }

  final int _startPage;
  int _page;
  int _totalPages = 0;
  final int _pageSize;
  String? _searchText;
  final FailureHandlerManager failureHandlerManager;

  @protected
  void handleError(Failure failure) {
    failureHandlerManager.handle(failure);
  }

  @protected
  void onInit() {
    firstLoad();
  }

  @protected
  void firstLoad() async {
    if (state.infiniteLoadingStatus == ApiStatus.loading) {
      return;
    }
    _page = _startPage;
    emit(state.loadingManagementStateChanged(
        infiniteLoadingStatus: ApiStatus.loading,
        isFirstLoad: true,
        data: []) as S);
    final result = await fetchMore(_page, _pageSize, _searchText);
    if (result.isLeft) {
      emit(state.loadingManagementStateChanged(
          infiniteLoadingStatus: ApiStatus.fail,
          infiniteLoadingFailure: result.left) as S);
      handleError(result.left);
      return;
    }
    final responseData = result.right;
    _totalPages = responseData.totalPages;
    _page++;
    emit(state.loadingManagementStateChanged(
      infiniteLoadingStatus: ApiStatus.success,
      data: responseData.data,
      isFirstLoad: false,
      totalItems: responseData.totalItems,
    ) as S);
  }

  void more() async {
    if (state.infiniteLoadingStatus == ApiStatus.loading) {
      return;
    }
    if (_page > _totalPages) {
      return;
    }
    emit(state.loadingManagementStateChanged(
        infiniteLoadingStatus: ApiStatus.loading, isFirstLoad: false) as S);
    final result = await fetchMore(_page, _pageSize, _searchText);
    if (result.isLeft) {
      emit(state.loadingManagementStateChanged(
          infiniteLoadingStatus: ApiStatus.fail,
          infiniteLoadingFailure: result.left) as S);
      handleError(result.left);
      return;
    }
    final responseData = result.right;
    _totalPages = responseData.totalPages;
    _page++;
    emit(state.loadingManagementStateChanged(
      infiniteLoadingStatus: ApiStatus.success,
      totalItems: responseData.totalItems,
      data: state.data.followedBy(responseData.data).toList(),
    ) as S);
  }

  void search(String text) {
    _searchText = text;
    if (_searchText?.isEmpty ?? false) {
      _searchText = null;
    }
    firstLoad();
  }

  void reload() {
    firstLoad();
  }

  @protected
  Future<Result<Failure, PageableData<T>>> fetchMore(
      int page, int pageSize, String? searchText);
}

class PageableData<T> {
  const PageableData({
    this.data = const [],
    required this.totalPages,
    this.totalItems = 0,
  });

  final List<T> data;
  final int totalPages;
  final int totalItems;
}
