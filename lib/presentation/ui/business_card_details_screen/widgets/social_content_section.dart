import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utilities/launch_url.dart';
import '../../../gen/app_colors.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';
import '../blocs/business_card_details_cubit.dart';
import '../blocs/business_card_details_state.dart';

class SocialContentSection extends StatelessWidget {
  const SocialContentSection({super.key});

  static Widget shimmerItem = AppShimmer(
      child: _ProfileUrl(
    imageUrl: 'image',
    description: 'Hello',
    onTap: () {},
    loading: true,
  ));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCardDetailCubit, BusinessCardDetailState>(
        builder: (context, state) {
      final profileUrlResponse = state.profileUrlResponse;
      final List<_ProfileUrl> profileUrls = profileUrlResponse
          .map((profileUrl) => _ProfileUrl(
                imageUrl: profileUrl.image?.previewUrl,
                description: profileUrl.content,
                onTap: () {
                  if (profileUrl.url != null) {
                    appLaunchUrl(profileUrl.url!, context);
                  }
                },
              ))
          .toList();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: state.loading
            ? ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 32),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return shimmerItem;
                },
              )
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 32),
                itemCount: profileUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return profileUrls[index];
                },
              ),
      );
    });
  }
}

class _ProfileUrl extends StatelessWidget {
  const _ProfileUrl(
      {this.imageUrl, this.description, this.onTap, this.loading = false});

  final String? imageUrl;
  final String? description;
  final VoidCallback? onTap;
  final bool loading;

  static const helperImage = ImageLoading(
    height: 300,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(builder: (context, constraint) {
          return loading
              ? Container(
                  height: 300,
                  width: constraint.maxWidth,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              : Stack(
                  children: [
                    SizedBox(
                      width: constraint.maxWidth,
                      child: Image.network(
                        imageUrl ?? '',
                        fit: BoxFit.cover,
                        loadingBuilder: helperImage
                            .copyWith(width: constraint.maxWidth)
                            .loadingBuilder,
                        errorBuilder: helperImage
                            .copyWith(width: constraint.maxWidth)
                            .errorBuilder,
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onTap,
                        ),
                      ),
                    ),
                  ],
                );
        }),
        const SizedBox(
          height: 12,
        ),
        if (loading)
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(4),
            ),
          )
        else
          Text(
            description ?? '',
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.black),
          )
      ],
    );
  }
}
