import '../../../application/services/user_order_session/user_order_session.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserOrderSessionControllerImpl
    with UserOrderSessionController, DataSourceErrorHandler {
  const UserOrderSessionControllerImpl({
    required this.userOrderSessionDataSource,
  });

  final UserOrderSessionDataSource userOrderSessionDataSource;

  @override
  Future<Result<Failure, OrderSessionResponse>> upsertOrderSession(
      OrderSessionCreateRequest request) {
    return handleApiResult(
        future: () => userOrderSessionDataSource.upsertOrderSession(request));
  }

  @override
  Future<Result<Failure, OrderSessionResponse>> getOrderSession() {
    return handleApiResult(
        future: () => userOrderSessionDataSource.getOrderSession());
  }
}
