import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_switches/app_radio.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../address_management_screen.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    this.addressId,
    this.defaultAddress = false,
    this.phoneNumber,
    this.username,
    this.addressName,
    this.details,
    this.onChanged,
    this.selectedAddressId,
    this.loading = false,
    this.onTapEdit,
    required this.addressType,
  });

  final int? selectedAddressId;
  final int? addressId;
  final String? addressName;
  final String? details;
  final bool defaultAddress;
  final String? username;
  final String? phoneNumber;
  final ValueChanged<int?>? onChanged;
  final VoidCallback? onTapEdit;
  final bool loading;
  final AddressType addressType;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (loading)
          Container(
            padding: const EdgeInsets.all(10),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          )
        else
          addressType == AddressType.selection
              ? AppRadio<int>(
                  value: addressId ?? 0,
                  groupValue: selectedAddressId,
                  onChanged: onChanged,
                )
              : const SizedBox(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (loading)
                  Container(
                    width: 114,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        addressName ?? '',
                        style: Styles.s15()
                            .withLetterSpacing(-2.5 / 100)
                            .withWeight(FontWeight.w500)
                            .withColor(AppColors.text.common),
                      ),
                      const SizedBox(width: 12),
                      if (defaultAddress)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.blue.shade100,
                          ),
                          child: Text(S.of(context).defaultShippingAddress,
                              style: Styles.s13()
                                  .withLetterSpacing(-2.5 / 100)
                                  .withWeight(FontWeight.w500)
                                  .withColor(AppColors.blue.shade500)),
                        )
                      else
                        const SizedBox.shrink()
                    ],
                  ),
                const SizedBox(height: 4),
                if (loading)
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  Text(
                    details ?? '',
                    maxLines: 3,
                    style: Styles.s15()
                        .withHeight(24 / 15)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                const SizedBox(height: 12),
                if (loading)
                  Container(
                    width: 147,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        username ?? '',
                        style: Styles.s15()
                            .withLetterSpacing(-2.5 / 100)
                            .withHeight(24 / 15)
                            .withColor(AppColors.text.bodyText),
                      ),
                      const SizedBox(width: 16),
                      Text(phoneNumber ?? '',
                          style: Styles.s15()
                              .withLetterSpacing(-2.5 / 100)
                              .withHeight(24 / 15)
                              .withColor(AppColors.text.bodyText)),
                      const Spacer(),
                      AppOutlinedButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        onPressed: onTapEdit,
                        backgroundColor: AppColors.gray.shade100,
                        borderActiveColor: AppColors.gray.shade100,
                        title: S.of(context).edit,
                        wrapContent: true,
                        textStyle: Styles.s13()
                            .withWeight(FontWeight.w500)
                            .withLetterSpacing(-2.5 / 100)
                            .withColor(AppColors.blue.shade600),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
