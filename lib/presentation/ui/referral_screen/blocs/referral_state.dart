part of 'referral_cubit.dart';

class ReferralState {
  const ReferralState({
    this.apiStatus = ApiStatus.initial,
    this.data = const [],
  });

  final ApiStatus apiStatus;
  final List<UserDTO> data;

  ReferralState copyWith({
    ApiStatus? apiStatus,
    List<UserDTO>? data,
  }) {
    return ReferralState(
      data: data ?? this.data,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }
}
