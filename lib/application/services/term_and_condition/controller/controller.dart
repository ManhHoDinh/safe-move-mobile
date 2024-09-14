import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../dto/dto.dart';
import '../term_and_condition.dart';

mixin TermAndCondController {
  Future<Result<Failure, TermAndCondResponse>> getTermAndCondition(
      {required TermType termType});
}
