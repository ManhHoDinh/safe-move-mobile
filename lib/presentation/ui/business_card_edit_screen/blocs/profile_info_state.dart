import 'package:equatable/equatable.dart';

import '../../../../application/services/user/dto/dto.dart';
import '../../../../utilities/api_status/api_status.dart';

class ProfileInfoState extends Equatable {
  const ProfileInfoState({
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
    this.bio = '',
    this.imageUrl,
    this.apiStatus = ApiStatus.initial,
    this.isUploadImage = false,
    this.accountType = AccountType.normal,
  });

  final String name;
  final String email;
  final String phoneNumber;
  final String bio;
  final String? imageUrl;
  final bool isUploadImage;
  final ApiStatus apiStatus;
  final AccountType accountType;

  ProfileInfoState copyWithImage({
    String? imageUrl,
  }) {
    return ProfileInfoState(
      imageUrl: imageUrl,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      bio: bio,
      apiStatus: apiStatus,
      accountType: accountType,
    );
  }

  ProfileInfoState copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? bio,
    ApiStatus? apiStatus,
    String? imageUrl,
    bool? isUploadImage,
    AccountType? accountType,
  }) {
    return ProfileInfoState(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
      apiStatus: apiStatus ?? this.apiStatus,
      imageUrl: imageUrl ?? this.imageUrl,
      isUploadImage: isUploadImage ?? this.isUploadImage,
      accountType: accountType ?? this.accountType,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        bio,
        apiStatus,
        imageUrl,
        isUploadImage,
        accountType
      ];
}
