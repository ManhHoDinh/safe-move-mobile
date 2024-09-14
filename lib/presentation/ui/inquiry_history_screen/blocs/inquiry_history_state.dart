import '../../../../application/services/qa/qa.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

class InquiryHistoryState extends InfiniteLoaderState<QAUserResponse> {
  const InquiryHistoryState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    this.filterType = QAFilterType.all,
    this.type = QAType.all,
  });

  final QAFilterType filterType;
  final QAType type;

  @override
  InfiniteLoaderState<QAUserResponse> loadingManagementStateChanged(
      {List<QAUserResponse>? data,
      bool? isFirstLoad,
      Failure? infiniteLoadingFailure,
      ApiStatus? infiniteLoadingStatus,
      int? totalItems}) {
    return InquiryHistoryState(
        data: data ?? this.data,
        isFirstLoad: isFirstLoad ?? this.isFirstLoad,
        infiniteLoadingFailure:
            infiniteLoadingFailure ?? this.infiniteLoadingFailure,
        infiniteLoadingStatus:
            infiniteLoadingStatus ?? this.infiniteLoadingStatus,
        totalItems: totalItems ?? this.totalItems,
        filterType: filterType,
        type: type);
  }

  InquiryHistoryState copyWith({
    List<QAUserResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
    QAFilterType? filterType,
    QAType? type,
  }) {
    return InquiryHistoryState(
        data: data ?? this.data,
        isFirstLoad: isFirstLoad ?? this.isFirstLoad,
        infiniteLoadingFailure:
            infiniteLoadingFailure ?? this.infiniteLoadingFailure,
        infiniteLoadingStatus:
            infiniteLoadingStatus ?? this.infiniteLoadingStatus,
        totalItems: totalItems ?? this.totalItems,
        filterType: filterType ?? this.filterType,
        type: type ?? this.type);
  }
}
