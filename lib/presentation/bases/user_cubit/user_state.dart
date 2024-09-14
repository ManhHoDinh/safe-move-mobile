part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({
    this.apiStatus = ApiStatus.initial,
    this.detail,
    this.userFullName,
  });

  final String? userFullName;
  final UserDTO? detail;
  final ApiStatus apiStatus;

  UserState copyWith({
    ApiStatus? apiStatus,
    UserDTO? detail,
    String? userFullName,
  }) {
    return UserState(
      apiStatus: apiStatus ?? this.apiStatus,
      detail: detail ?? this.detail,
      userFullName: userFullName ?? this.userFullName,
    );
  }

  @override
  List<Object?> get props => [
        apiStatus,
        userFullName,
        detail,
      ];
}
