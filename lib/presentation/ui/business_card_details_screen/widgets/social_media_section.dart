import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/user.dart';
import '../../../../utilities/launch_url.dart';
import '../../../gen/assets.gen.dart';
import '../blocs/business_card_details_cubit.dart';
import '../blocs/business_card_details_state.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  Widget renderIcon(SocialMediaType type) {
    switch (type) {
      case SocialMediaType.instagram:
        return Assets.svgs.instagramIcon.svg();
      case SocialMediaType.kakao:
        return Assets.svgs.kakaoTalkIcon.svg();
      case SocialMediaType.naverCafe:
        return Assets.svgs.naverIcon.svg();
      case SocialMediaType.thread:
        return Assets.svgs.threadIcon.svg();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCardDetailCubit, BusinessCardDetailState>(
        builder: (context, state) {
      final socialMediaResponse = state.socialMediaResponse;
      final List<_Social> socialMedias = socialMediaResponse
          .map((socialMedia) => _Social(
                icon: renderIcon(socialMedia.socialType!),
                onTap: () {
                  if (socialMedia.url != null) {
                    appLaunchUrl(socialMedia.url!, context);
                  }
                },
              ))
          .toList();
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: SizedBox(
          width: double.infinity,
          child: state.loading
              ? Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                      6,
                      (index) => _Social(
                            icon: Assets.svgs.instagramIcon.svg(),
                            onTap: () {},
                            loading: true,
                          )),
                )
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  // alignment: WrapAlignment.start,
                  children: socialMedias,
                ),
        ),
      );
    });
  }
}

class _Social extends StatelessWidget {
  const _Social(
      {required this.icon, required this.onTap, this.loading = false});

  final Widget icon;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          )
        : Stack(
            children: [
              FittedBox(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: icon,
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    customBorder: const CircleBorder(),
                  ),
                ),
              ),
            ],
          );
  }
}
