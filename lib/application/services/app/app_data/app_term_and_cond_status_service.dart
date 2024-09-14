import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';

mixin AppTermAndCondStatusService {
  Future<Result<Failure, void>> markHaveReadTermAndCond();
  Future<Result<Failure, bool>> haveReadTermAndCondYet(); //?
}
