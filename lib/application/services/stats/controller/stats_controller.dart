import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';

mixin StatsController {
  Future<Result<Failure, SuccessResponse>> visitApp();
}
