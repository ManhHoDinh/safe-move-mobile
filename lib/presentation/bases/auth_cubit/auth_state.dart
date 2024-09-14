part of 'auth_cubit.dart';

abstract class AuthStatusState extends Equatable {
  const AuthStatusState();
}

/// login
class AuthStatusLoggedInState extends AuthStatusState {
  const AuthStatusLoggedInState({
    this.redirectUrl,
    required this.userNeedVerify,
  });

  final String? redirectUrl;
  final bool userNeedVerify;

  @override
  List<Object?> get props => [
        redirectUrl,
        userNeedVerify,
      ];
}

/// logout

enum LogoutReason {
  userLogout,
  sessionExpired,
  killApp,
}

class AuthStatusLoggedOutState extends AuthStatusState {
  const AuthStatusLoggedOutState({
    required this.logoutReason,
    this.url,
  });

  final LogoutReason logoutReason;
  final String? url;

  @override
  List<Object?> get props => [
        logoutReason,
      ];
}
