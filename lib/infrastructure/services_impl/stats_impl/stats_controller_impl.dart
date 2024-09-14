import '../../../application/services/common/response/src/success_response.dart';
import '../../../application/services/stats/controller/stats_controller.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class StatsControllerImpl with StatsController, DataSourceErrorHandler {
  StatsControllerImpl({
    required this.statsDataSource,
  });

  final StatsDataSource statsDataSource;

  @override
  Future<Result<Failure, SuccessResponse>> visitApp() {
    return handleApiResult(
      future: () => statsDataSource.markUserVisit(),
    );
  }
}
