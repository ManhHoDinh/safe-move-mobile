import '../../../../application/services/qa/qa.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'compose_qa_state.dart';

class ComposeQACubit extends SafeCubit<ComposeQAState> {
  ComposeQACubit({
    required this.loadingManager,
    required this.failureHandlerManager,
    this.redirectUrl,
    required this.qAController,
    required this.productId,
  }) : super(const ComposeQAState());
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final QAController qAController;
  final String? redirectUrl;
  final int productId;

  void onQuestionFieldChange(String value) {
    emit(state.copyWith(
        questionField: QuestionField.dirty(value: value.trim())));
  }

  void onChangedType(QAType type) {
    emit(state.copyWith(type: type));
  }

  void onSubmit() async {
    final errorUrl = state.questionField.selfValidate();

    if (errorUrl != null) {
      emit(
        state.copyWith(
          questionField: QuestionField.dirty(
              value: state.questionField.value, error: errorUrl),
        ),
      );
      return;
    }

    final qaFuture = qAController.addQA(
        request: QACreateRequest(
      productId: productId,
      question: state.questionField.value,
      type: state.type,
    ));
    final loadingQAFuture = await loadingManager.startLoading(future: qaFuture);
    if (loadingQAFuture.isLeft) {
      failureHandlerManager.handle(loadingQAFuture.left);
      return;
    }
    emit(state.copyWith(isSuccess: true));
  }
}
