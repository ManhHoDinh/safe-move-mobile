import 'package:flutter/cupertino.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class ProductActionSection extends StatelessWidget {
  const ProductActionSection({
    super.key,
    this.onPressPurchase,
    this.color,
    this.onPressShoppingCart,
  });

  final VoidCallback? onPressPurchase;
  final VoidCallback? onPressShoppingCart;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.gray.shade70,
        border: Border(
          top: BorderSide(
            color: AppColors.gray.shade100,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 16, top: 10, left: 18, right: 18),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AppOutlinedButton.square(
                onPressed: onPressShoppingCart,
                title: S.of(context).shoppingCart,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: PrimaryButton.square(
                onPressed: onPressPurchase,
                title: S.of(context).buyNow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
