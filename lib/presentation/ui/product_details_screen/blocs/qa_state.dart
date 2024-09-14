import '../../../../application/services/qa/qa.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

class QAState extends InfiniteLoaderState<QAResponse> {
  const QAState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
  });

  @override
  InfiniteLoaderState<QAResponse> loadingManagementStateChanged(
      {List<QAResponse>? data,
      bool? isFirstLoad,
      Failure? infiniteLoadingFailure,
      ApiStatus? infiniteLoadingStatus,
      int? totalItems}) {
    return QAState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
    );
  }

  QAState copyWith({
    List<QAResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return QAState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}
