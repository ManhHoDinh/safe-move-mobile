part of 'reported_user_cubit.dart';

class ReportedUserState extends InfiniteLoaderState<UserDTO> {
  const ReportedUserState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    this.apiStatus = ApiStatus.initial,
    this.userDetail,
    this.hasFollow = false,
  });

  final ApiStatus apiStatus;
  final UserDetailDTO? userDetail;
  final bool hasFollow;

  ReportedUserState copyWith({
    ApiStatus? apiStatus,
    UserDetailDTO? userDetail,
    bool? hasFollow,
  }) {
    return ReportedUserState(
      apiStatus: apiStatus ?? this.apiStatus,
      userDetail: userDetail ?? this.userDetail,
      hasFollow: hasFollow ?? this.hasFollow,
    );
  }

  @override
  InfiniteLoaderState<UserDTO> loadingManagementStateChanged(
      {List<UserDTO>? data,
      bool? isFirstLoad,
      Failure? infiniteLoadingFailure,
      ApiStatus? infiniteLoadingStatus,
      int? totalItems}) {
    return ReportedUserState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure: infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus ?? this.infiniteLoadingStatus,
    );
  }
}
