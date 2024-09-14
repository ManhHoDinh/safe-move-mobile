import '../../../application/services/common/response/src/paging_response.dart';
import '../../../application/services/qa/qa.dart';
import '../../../application/services/qa/request/request.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class QAControllerImpl with QAController, DataSourceErrorHandler {
  QAControllerImpl({
    required this.qaDataSource,
  });

  final QADataSource qaDataSource;

  @override
  Future<Result<Failure, PagingResponse<QAResponse>>> getQAs(
      {required int productId, int? page, required int size}) {
    return handleApiResult(
      future: () =>
          qaDataSource.getQAs(productId: productId, page: page, size: size),
    );
  }

  @override
  Future<Result<Failure, QAResponse>> addQA(
      {required QACreateRequest request}) {
    return handleApiResult(
      future: () => qaDataSource.addQA(request: request),
    );
  }

  @override
  Future<Result<Failure, QAResponse>> deleteQAById({required int id}) {
    return handleApiResult(
      future: () => qaDataSource.deleteQAById(id: id),
    );
  }

  @override
  Future<Result<Failure, PagingResponse<QAUserResponse>>> getQAsByFilter(
      {required QAFilterType filter, int? page, required int size, required QAType type}) {
   
    return handleApiResult(
      future: () => qaDataSource.getQAsByFilter(
          filter: encodeQAFilterType(filter), page: page, size: size, type: encodeQAType(type)),
    );
  }
}
