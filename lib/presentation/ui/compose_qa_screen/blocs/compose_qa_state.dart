import 'package:equatable/equatable.dart';

import '../../../../application/services/qa/qa.dart';
import '../../../bases/base_form_input/base_form_input.dart';

enum QAFieldError {
  empty,
}

class QuestionField extends BaseFormInput<String, QAFieldError> {
  const QuestionField.pure({super.value = '', super.error}) : super.pure();

  const QuestionField.dirty({required super.value, super.error})
      : super.dirty();

  @override
  QAFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return QAFieldError.empty;
    }
    return null;
  }
}

class ComposeQAState extends Equatable {
  const ComposeQAState({
    this.questionField = const QuestionField.pure(),
    this.type = QAType.product,
    
    this.isSuccess = false,
  });

  final QuestionField questionField;
  final QAType type;
  final bool isSuccess;

  bool get canSubmit {
    return questionField.isValid;
  }

  ComposeQAState copyWith({
    QuestionField? questionField,
    QAType? type,
    bool? isSuccess,
  }) {
    return ComposeQAState(
      questionField: questionField ?? this.questionField,
      type: type ?? this.type,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
        questionField.value,
        questionField.error,
        type,
        canSubmit,
        isSuccess,
      ];
}
