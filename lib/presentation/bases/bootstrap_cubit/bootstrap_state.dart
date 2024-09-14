part of 'bootstrap_cubit.dart';

class BootstrapState extends Equatable {
  const BootstrapState({
    this.username,
    this.initialUrl,
    required this.haveReadTermAndCond,
  });

  final String? initialUrl;
  final String? username;
  final bool haveReadTermAndCond;

  @override
  List<Object?> get props => [
        username,
        initialUrl,
        haveReadTermAndCond,
      ];

  BootstrapState copyWith({
    String? initialUrl,
    String? username,
    bool? haveReadTermAndCond,
  }) {
    return BootstrapState(
      initialUrl: initialUrl ?? this.initialUrl,
      username: username ?? this.username,
      haveReadTermAndCond: haveReadTermAndCond ?? this.haveReadTermAndCond,
    );
  }
}
