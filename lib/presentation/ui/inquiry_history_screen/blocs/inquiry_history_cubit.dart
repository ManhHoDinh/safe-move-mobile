import '../../../../application/services/qa/controller/controller.dart';
import '../../../../application/services/qa/dto/dto.dart';
import '../../../../application/services/qa/request/src/qa_create_request.dart';
import '../../../../application/services/qa/response/response.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import 'inquiry_history_state.dart';

class InquiryHistoryCubit
    extends InfiniteLoaderCubit<InquiryHistoryState, QAUserResponse> {
  InquiryHistoryCubit({
    required super.failureHandlerManager,
    required this.qaController,
  }) : super(initialState: const InquiryHistoryState());

  final QAController qaController;

  void onChangeFilterStatus(QAFilterType filterType) {
    emit(state.copyWith(filterType: filterType));
    reload();
  }
  void onChangeQAType(QAType type) {
    emit(state.copyWith(type: type));
    reload();
  }

  @override
  Future<Result<Failure, PageableData<QAUserResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await qaController.getQAsByFilter(
      size: pageSize,
      page: page,
      filter: state.filterType,
      type: state.type
    );
    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        final totalPages = value.totalPages ?? 0;
        final data = value.content ?? [];
        return PageableData(
          totalItems: value.totalElements ?? 0,
          totalPages: totalPages,
          data: data,
        );
      },
    );
  }
}
