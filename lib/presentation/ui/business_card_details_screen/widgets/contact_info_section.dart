import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utilities/launch_url.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/snack_bar/app_snack_bar.dart';
import '../../../utilities/phone_format.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection(
      {super.key, this.naver, this.phone, this.loading = false});

  final String? naver;
  final String? phone;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: loading
          ? Container(
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          : Row(
              children: [
                if (naver != null && naver!.isNotEmpty)
                  Expanded(
                    child: _ContactItem(
                      value: naver ?? '',
                      icon: Assets.svgs.gmailIcon.svg(),
                      onLongPress: () {
                        Clipboard.setData(ClipboardData(text: naver ?? ''))
                            .then((_) {
                          final snackBar = AppSnackBar(
                              title: S.of(context).copiedToClipboard);
                          snackBar.showSnackBar(context);
                        });
                      },
                    ),
                  )
                else
                  const SizedBox.shrink(),
                if (phone != null && phone!.isNotEmpty)
                  Expanded(
                    child: _ContactItem(
                      value: phoneFormat(phone ?? ''),
                      icon: Assets.svgs.phoneIcon.svg(),
                      onTap: () {
                        if (phone != null) {
                          appCallPhone(phone!, context);
                        }
                      },
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.value,
    required this.icon,
    this.onLongPress,
    this.onTap,
  });

  final String value;
  final Widget icon;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onLongPress: onLongPress,
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 12,
              ),
              Flexible(
                child: Text(
                  value,
                  style: Styles.s13()
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
