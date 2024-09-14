import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../user_order_session.dart';

mixin UserOrderSessionController {
  Future<Result<Failure, OrderSessionResponse>> upsertOrderSession(
      OrderSessionCreateRequest request);

  Future<Result<Failure, OrderSessionResponse>> getOrderSession();
}
