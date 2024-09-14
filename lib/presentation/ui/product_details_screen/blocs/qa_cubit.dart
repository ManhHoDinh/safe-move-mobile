import '../../../../application/services/qa/qa.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import 'qa_state.dart';

class QACubit extends InfiniteLoaderCubit<QAState, QAResponse> {
  QACubit({
    required super.failureHandlerManager,
    required this.qAController,
    required this.productId,
  }) : super(initialState: const QAState());

  final QAController qAController;
  final int productId;

  @override
  Future<Result<Failure, PageableData<QAResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await qAController.getQAs(
      size: pageSize,
      page: page,
      productId: productId,
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
