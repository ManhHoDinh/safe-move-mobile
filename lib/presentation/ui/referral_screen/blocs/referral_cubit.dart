import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';

part 'referral_state.dart';

class ReferralCubit extends SafeCubit<ReferralState> {
  ReferralCubit({
    required this.failureHandlerManager,
    required this.userController,
  }) : super(const ReferralState()) {
    reload();
  }

  final UserController userController;
  final FailureHandlerManager failureHandlerManager;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final referralResult = await userController.getReferredUsers();
    referralResult.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    referralResult.handleRight((value) {
      emit(state.copyWith(data: value.users, apiStatus: ApiStatus.success));
    });
  }
}
