import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/profile_url/profile_url.dart';
import '../../../application/services/social_media/social_media.dart';
import '../../../application/services/user/user.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_icon_button.dart';
import '../../shared/widgets/item_divider.dart';
import '../../shared/widgets/profile_info_section.dart';
import '../../shared/widgets/snack_bar/app_snack_bar.dart';
import '../../utilities/share_link.dart';
import 'blocs/business_card_details_cubit.dart';
import 'blocs/business_card_details_state.dart';
import 'widgets/contact_info_section.dart';
import 'widgets/social_content_section.dart';
import 'widgets/social_media_section.dart';

class BusinessCardDetailsScreen extends StatelessWidget {
  const BusinessCardDetailsScreen({super.key, required this.userId});

  final int userId;

  Widget _loadingShimmer() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: ProfileInfoSection(loading: true, name: '', description: ''),
        ),
        SizedBox(height: 20),
        ContactInfoSection(
            naver: 'abc@naver.com', loading: true, phone: '010-1234-5678'),
        SizedBox(
          height: 20,
        ),
        SocialMediaSection(),
        ItemDivider(
          thickness: 4,
        ),
        SocialContentSection(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BusinessCardDetailCubit>(
      lazy: false,
      create: (context) {
        return BusinessCardDetailCubit(
          userController: context.read<UserController>(),
          socialMediaController: context.read<SocialMediaController>(),
          profileUrlController: context.read<ProfileUrlController>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          id: userId,
        );
      },
      child: BlocBuilder<BusinessCardDetailCubit, BusinessCardDetailState>(
          builder: (context, state) {
        return Scaffold(
          appBar: CommonAppBar(
            actions: [
              AppIconButton(
                icon: Assets.svgs.uploadIcon.svg(),
                onTap: () async {
                  final String appLink =
                      BusinessCardDetailsRouteData(userId).location;
                  final result = await shareLink(
                      appLink, context, state.userData.name ?? '');
                  if (result != null && result && context.mounted) {
                    final AppSnackBar snackBar =
                        AppSnackBar(title: S.of(context).shareSuccessfully);
                    snackBar.showSnackBar(context);
                  }
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: state.loading
                  ? AppShimmer(child: _loadingShimmer())
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: ProfileInfoSection(
                            imageUrl: state.userData.avatarUrl,
                            name: state.userData.name ?? '',
                            description: state.userData.bio ?? '',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ContactInfoSection(
                          naver: state.userData.email,
                          phone: state.userData.phoneNumber,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SocialMediaSection(),
                        const ItemDivider(
                          thickness: 4,
                        ),
                        const SocialContentSection(),
                      ],
                    ),
            ),
          ),
        );
      }),
    );
  }
}
