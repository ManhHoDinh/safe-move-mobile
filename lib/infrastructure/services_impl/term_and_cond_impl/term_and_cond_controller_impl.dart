import '../../../application/services/term_and_condition/dto/dto.dart';
import '../../../application/services/term_and_condition/term_and_condition.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class TermAndCondControllerImpl
    with TermAndCondController, DataSourceErrorHandler {
  const TermAndCondControllerImpl({
    required this.termAndCondDataSource,
  });

  final TermAndCondDataSource termAndCondDataSource;

  @override
  Future<Result<Failure, TermAndCondResponse>> getTermAndCondition(
      {required TermType termType}) {
    return handleApiResult(
        future: () => termAndCondDataSource.getTermAndCond(termType: termType));
  }
}
