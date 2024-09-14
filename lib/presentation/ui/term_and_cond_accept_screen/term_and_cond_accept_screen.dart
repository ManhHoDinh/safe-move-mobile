import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/app/app_data/app_term_and_cond_status_service.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_switches/app_checkbox_title.dart';
import '../../shared/widgets/app_switches/app_radio_title.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import 'term_and_cond_content.dart';

class TermAndCondAcceptScreen extends StatefulWidget {
  const TermAndCondAcceptScreen({super.key, this.type});

  final int? type;
  @override
  State<TermAndCondAcceptScreen> createState() {
    return _TermAndCondAcceptScreenState();
  }
}

class _TermAndCondAcceptScreenState extends State<TermAndCondAcceptScreen> {
  bool _personalInfoTermAccept = false;
  bool _smTermAccept = false;
  bool _termOfUseSMMall = false;

  bool get _agreeAll =>
      _personalInfoTermAccept && _smTermAccept && _termOfUseSMMall;

  @override
  Widget build(BuildContext context) {
    final viewTextStyle = Styles.s12().withColor(AppColors.text.bodyText);
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 74),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26 - 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32,
                    child: FittedBox(
                      child: Assets.svgs.logoMain.svg(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).successSecretOfTop1,
                    style: Styles.s24()
                        .withWeight(FontWeight.w600)
                        .withLetterSpacing(-0.5 / 100)
                        .withColor(AppColors.text.main),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppRadioTitle(
              toggleable: true,
              value: true,
              groupValue: _agreeAll,
              onChanged: (value) {
                if (value == null || !value) {
                  _smTermAccept = false;
                  _personalInfoTermAccept = false;
                  _termOfUseSMMall = false;
                } else {
                  _smTermAccept = true;
                  _personalInfoTermAccept = true;
                  _termOfUseSMMall = true;
                }
                setState(() {});
              },
              title: Text(
                S.of(context).agreeToTermAndCond,
                style: Styles.s15()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.main),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: AppColors.gray.shade300,
              height: 1,
              width: double.infinity,
            ),
            AppCheckBoxTitle(
              value: _smTermAccept,
              title: Text(
                S.of(context).smTermAccept,
              ),
              onChanged: (value) {
                setState(() {
                  _smTermAccept = value;
                });
              },
              trailing: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () {
                  const TermAndPolicyContentDetailsRouteData(
                          type: TermAndCondType.policy)
                      .push(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    S.of(context).view,
                    style: viewTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            AppCheckBoxTitle(
              value: _personalInfoTermAccept,
              title: Text(
                S.of(context).personalInfoTermAccept,
              ),
              onChanged: (value) {
                setState(() {
                  _personalInfoTermAccept = value;
                });
              },
              trailing: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () {
                  const TermAndPolicyContentDetailsRouteData(
                          type: TermAndCondType.term)
                      .push(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    S.of(context).view,
                    style: viewTextStyle,
                  ),
                ),
              ),
            ),
            AppCheckBoxTitle(
              value: _termOfUseSMMall,
              title: Text(
                S.of(context).termOfUseSMMall,
              ),
              onChanged: (value) {
                setState(() {
                  _termOfUseSMMall = value;
                });
              },
              trailing: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () {
                  const TermAndPolicyContentDetailsRouteData(
                          type: TermAndCondType.mail)
                      .push(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    S.of(context).view,
                    style: viewTextStyle,
                  ),
                ),
              ),
            ),
            BottomButton(
              padding: const EdgeInsets.only(bottom: 20, top: 56),
              title: S.of(context).next,
              onPress: !_agreeAll
                  ? null
                  : () async {
                      final AppTermAndCondStatusService service =
                          context.read<AppTermAndCondStatusService>();
                      await context.read<LoadingManager>().startLoading(
                          future: service.markHaveReadTermAndCond());
                      if (context.mounted) {
                        if (widget.type == 1) {
                          const UserInfoSupplementRouteData().go(context);
                        } else {
                          const RegisterRouteData().go(context);
                        }
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
