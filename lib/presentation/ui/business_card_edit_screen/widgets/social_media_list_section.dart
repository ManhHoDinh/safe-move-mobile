import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/user.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../../../shared/widgets/drop_down_bar/drop_down_bar.dart';
import '../../../shared/widgets/drop_down_bar/outline_button_drop_down.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../blocs/social_media_content_state.dart';
import '../blocs/social_media_list.state.dart';
import '../blocs/social_media_list_cubit.dart';

class SocialMediaListSection extends StatefulWidget {
  const SocialMediaListSection({super.key});

  @override
  State<SocialMediaListSection> createState() => _SocialMediaListSectionState();
}

class _SocialMediaListSectionState extends State<SocialMediaListSection> {
  String? renderFieldError(BuildContext context, SocialMediaError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case SocialMediaError.empty:
        return S.of(context).empty;
      case SocialMediaError.urlInvalid:
        return S.of(context).urlInvalid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaListCubit, SocialMediaListState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).socialMedia,
            style: Styles.s18()
                .withWeight(FontWeight.w600)
                .withHeight(18 / 18)
                .withLetterSpacing(-2.5 / 100),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final bool checkedEdit =
                  index == state.socialMediaList.length - 1;
              final socialMediaListItem = state.socialMediaList[index];
              return _SocialMediaSectionItem(
                onDeleteItem: () {
                  context.read<SocialMediaListCubit>().deleteSocialMedia(index);
                },
                enabled: checkedEdit,
                errorTextUrl: checkedEdit
                    ? renderFieldError(context, state.url.error)
                    : null,
                onChangedSocialMediaType: (value) {
                  context
                      .read<SocialMediaListCubit>()
                      .onSocialTypeChanged(value);
                },
                onChangedUrl: (value) {
                  context.read<SocialMediaListCubit>().onUrlChanged(value);
                },
                initialUrl: socialMediaListItem.url,
                socialMediaType: checkedEdit
                    ? state.socialType.value
                    : socialMediaListItem.socialType,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: state.socialMediaList.length,
          ),
          const SizedBox(height: 24),
          AppOutlinedButton(
            onPressed: () {
              context.read<SocialMediaListCubit>().onAddSocialMedia();
            },
            trailing: Align(
                child: Assets.svgs.pickerAddIcon.svg(
                    color: AppColors.blue.shade500, width: 24, height: 24)),
            title: S.of(context).addition,
          )
        ],
      );
    });
  }
}

class _SocialMediaSectionItem extends StatelessWidget {
  const _SocialMediaSectionItem({
    this.onDeleteItem,
    this.socialMediaType,
    this.onChangedSocialMediaType,
    this.onChangedUrl,
    this.initialUrl,
    this.enabled = true,
    this.errorTextUrl,
  });
  final VoidCallback? onDeleteItem;
  final SocialMediaType? socialMediaType;
  final Function(SocialMediaType)? onChangedSocialMediaType;
  final Function(String)? onChangedUrl;
  final String? initialUrl;
  final String? errorTextUrl;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlineButtonDropDown<SocialMediaType>(
          leadingButton: Assets.svgs.subtractionIcon.svg(),
          buttonTitle: S.of(context).delete,
          hintText: S.of(context).snsSelect,
          onChangedDropDown: enabled
              ? (value) => {
                    onChangedSocialMediaType!(value),
                  }
              : null,
          enabled: enabled,
          value: socialMediaType,
          onPressedButton: onDeleteItem,
          data: SocialMediaType.values
              .map((e) => DropDownBarData(value: e, title: e.name))
              .toList(),
        ),
        const SizedBox(
          height: 12,
        ),
        if (initialUrl != null && enabled == false)
          Container(
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray.shade500,
              ),
              color: AppColors.gray.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              initialUrl ?? '',
              style: Styles.s15()
                  .withColor(AppColors.text.common)
                  .withLetterSpacing(-2.5 / 100),
            ),
          )
        else
          CommonTextField(
            keyboardType: TextInputType.url,
            hintText: S.of(context).linkUrl,
            errorText: errorTextUrl,
            initialValue: initialUrl,
            enable: enabled,
            onChanged: enabled
                ? (value) {
                    onChangedUrl!(value);
                  }
                : null,
          )
      ],
    );
  }
}
