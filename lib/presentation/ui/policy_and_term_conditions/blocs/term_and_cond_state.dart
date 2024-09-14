part of 'term_and_cond_cubit.dart';

class TermAndCondState {
  const TermAndCondState({
    this.apiStatus = ApiStatus.initial,
    this.termType = TermType.TERM_AND_COND,
    this.data,
  });

  final ApiStatus apiStatus;
  final TermAndCondResponse? data;
  final TermType termType;

  TermAndCondState copyWith({
    ApiStatus? apiStatus,
    TermAndCondResponse? data,
    TermType? termType,
  }) {
    return TermAndCondState(
      data: data ?? this.data,
      apiStatus: apiStatus ?? this.apiStatus,
      termType: termType ?? this.termType,
    );
  }
}
