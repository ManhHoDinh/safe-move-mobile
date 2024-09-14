import '../../../../application/services/term_and_condition/dto/dto.dart';
import '../../../../application/services/term_and_condition/term_and_condition.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';

part 'term_and_cond_state.dart';

class TermAndCondCubit extends SafeCubit<TermAndCondState> {
  TermAndCondCubit({
    required this.failureHandlerManager,
    required this.termAndCondController,
    this.termType = TermType.TERM_AND_COND,
  }) : super(const TermAndCondState()) {
    reload();
  }

  final TermAndCondController termAndCondController;
  final FailureHandlerManager failureHandlerManager;
  final TermType termType;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final termAndCondResult =
        await termAndCondController.getTermAndCondition(termType: termType);
    termAndCondResult.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    termAndCondResult.handleRight((value) {
      emit(state.copyWith(data: value, apiStatus: ApiStatus.success));
    });
  }
}
