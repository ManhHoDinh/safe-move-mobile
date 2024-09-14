import '../../../../application/services/user/user.dart';

class BusinessCardDetailState {
  const BusinessCardDetailState({
    this.userData = const UserDetailDTO(),
    this.socialMediaResponse = const [],
    this.profileUrlResponse = const [],
    this.loading = false,
  });

  final UserDetailDTO userData;
  final List<SocialMediaResponse> socialMediaResponse;
  final List<ProfileUrlResponse> profileUrlResponse;
  final bool loading;

  BusinessCardDetailState copyWith({
    UserDetailDTO? userData,
    List<SocialMediaResponse>? socialMediaResponse,
    List<ProfileUrlResponse>? profileUrlResponse,
    bool? loading,
  }) {
    return BusinessCardDetailState(
      userData: userData ?? this.userData,
      socialMediaResponse: socialMediaResponse ?? this.socialMediaResponse,
      profileUrlResponse: profileUrlResponse ?? this.profileUrlResponse,
      loading: loading ?? this.loading,
    );
  }
}
