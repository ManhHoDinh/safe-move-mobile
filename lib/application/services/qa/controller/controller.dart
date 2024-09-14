import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/response/response.dart';
import '../../qa/qa.dart';

mixin QAController {
  Future<Result<Failure, PagingResponse<QAResponse>>> getQAs({
    required int productId,
    int? page,
    required int size,
  });

  Future<Result<Failure, PagingResponse<QAUserResponse>>> getQAsByFilter({
    required QAFilterType filter,
    int? page,
    required int size,
    required QAType type,
  });

  Future<Result<Failure, QAResponse>> addQA({
    required QACreateRequest request,
  });

  Future<Result<Failure, QAResponse>> deleteQAById({required int id});
}
