import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../theme/theme.dart';
import '../buttons/app_outlined_button.dart';
import '../buttons/primary_button.dart';
import '../model_route_pages/dialog_page.dart';

class AppAlertDialog {
  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
    String? title,
    required String content,
    String? acceptTitle,
  }) {
    return DialogPage(
      key: key,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _AppDialog(
          title: title,
          acceptTitle: acceptTitle,
          content: content,
        );
      },
    );
  }
}

class AppConfirmDialog {
  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
    String? title,
    required String content,
    String? acceptTitle,
    String? rejectTitle,
  }) {
    return DialogPage(
      key: key,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _AppDialog(
          title: title,
          acceptTitle: acceptTitle,
          content: content,
          rejectTitle: rejectTitle,
          showRejectButton: true,
        );
      },
    );
  }
}

class _AppDialog extends StatelessWidget {
  const _AppDialog({
    this.title,
    required this.content,
    this.acceptTitle,
    this.rejectTitle,
    this.showRejectButton = false,
  });

  final String? title;
  final String content;
  final String? acceptTitle;
  final String? rejectTitle;
  final bool showRejectButton;

  void _handleAccept(BuildContext context) {
    context.pop(true);
  }

  void _handleReject(BuildContext context) {
    context.pop(false);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      sized: false,
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Dialog(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 24),
          width: 295,
          decoration: BoxDecoration(
            color: AppColors.gray.shade50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 33.5),
                margin: const EdgeInsets.only(bottom: 12, top: 16),
                child: Text(
                  title ?? S.of(context).notificationAlert,
                  textAlign: TextAlign.center,
                  style: Styles.s15()
                      .withColor(AppColors.text.bodyText)
                      .withWeight(FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: Styles.s15().withColor(AppColors.text.main),
                ),
              ),
              const SizedBox(height: 20),
              if (!showRejectButton)
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => _handleAccept(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      child: Text(
                        acceptTitle ?? S.of(context).ok,
                        textAlign: TextAlign.center,
                        style: Styles.s14()
                            .withColor(AppColors.blue.shade500)
                            .withLetterSpacing(5 / 100),
                      ),
                    ),
                  ),
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: AppOutlinedButton.square(
                        borderActiveColor: AppColors.red.shade600,
                        onPressed: () {
                          _handleReject(context);
                        },
                        title: rejectTitle ?? S.of(context).cancel,
                        textStyle: Styles.s15()
                            .withLetterSpacing(-2.5 / 100)
                            .withWeight(FontWeight.w600)
                            .withColor(AppColors.red.shade600),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: PrimaryButton.square(
                        onPressed: () {
                          _handleAccept(context);
                        },
                        title: acceptTitle ?? S.of(context).ok,
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
