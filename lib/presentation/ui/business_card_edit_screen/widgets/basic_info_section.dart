import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/routes_gen/routes_gen.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/gap_items.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../../../utilities/phone_format.dart';
import '../blocs/profile_info_cubit.dart';
import '../blocs/profile_info_state.dart';

class BasicInfoSection extends StatelessWidget {
  const BasicInfoSection({
    super.key,
    required this.name,
    this.email,
    this.phoneNumber,
    this.bio,
    this.imageUrl,
  });
  final String name;
  final String? email;
  final String? phoneNumber;
  final String? bio;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final phoneArray = phoneFormat(phoneNumber ?? '').split('-');
    final helperImage = ImageLoading(
      height: 80,
      width: 80,
      borderRadius: BorderRadius.circular(100),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).basicInformation,
          style: Styles.s18()
              .withHeight(18 / 18)
              .withWeight(FontWeight.w600)
              .withLetterSpacing(-2.5 / 100),
        ),
        const SizedBox(height: 21),
        BlocListener<ProfileInfoCubit, ProfileInfoState>(
          listener: (context, state) {
            if (state.isUploadImage) {
              context.read<UserCubit>().fetchUserData();
            }
          },
          child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
              buildWhen: (previous, current) {
            return previous.imageUrl != current.imageUrl;
          }, builder: (context, state) {
            return Align(
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.black,
                ),
                child: state.imageUrl != null
                    ? ClipOval(
                        child: Image.network(
                          state.imageUrl!,
                          loadingBuilder: helperImage.loadingBuilder,
                          errorBuilder: helperImage.errorBuilder,
                          fit: BoxFit.cover,
                        ),
                      )
                    : null,
              ),
            );
          }),
        ),
        const SizedBox(height: 4),
        Align(
          child: InkWell(
            onTap: () async {
              final File? file =
                  await const ImagePickerRouteData().push(context);
              if (file != null && context.mounted) {
                context.read<ProfileInfoCubit>().uploadImage(file);
              }
            },
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                S.of(context).changePhoto,
                style: Styles.s13()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.blue.shade500),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        GapItems(
          items: [
            CommonTextField(
              initialValue: name,
              enable: false,
            ),
            CommonTextField(
              initialValue: email,
              enable: false,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    initialValue: phoneArray.length == 3 ? phoneArray[0] : '',
                    enable: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '-',
                    style: Styles.s15()
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                ),
                Expanded(
                  child: CommonTextField(
                    initialValue: phoneArray.length == 3 ? phoneArray[1] : '',
                    enable: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '-',
                    style: Styles.s15()
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                ),
                Expanded(
                  child: CommonTextField(
                    initialValue: phoneArray.length == 3 ? phoneArray[2] : '',
                    enable: false,
                  ),
                ),
              ],
            ),
            CommonTextField(
              initialValue: bio,
              maxLines: 3,
              onChanged: (value) {
                context.read<ProfileInfoCubit>().onBioChange(value);
              },
              maxLength: 30,
              useClearIcon: false,
              textStyle: Styles.s15()
                  .withLetterSpacing(-2.5 / 100)
                  .withColor(AppColors.text.bodyText),
            ),
          ],
        ),
      ],
    );
  }
}
