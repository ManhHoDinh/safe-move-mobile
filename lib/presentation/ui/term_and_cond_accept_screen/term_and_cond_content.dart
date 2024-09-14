import 'package:flutter/material.dart';

import '../../gen/locale/app_localizations.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../policy_and_term_conditions/widgets/privacy_policy_tab.dart';
import '../policy_and_term_conditions/widgets/term_of_services_tab.dart';
import '../policy_and_term_conditions/widgets/term_of_use_sm_mall.dart';

enum TermAndCondType { policy, term, mail }

class TermAndPolicyContentScreen extends StatelessWidget {
  const TermAndPolicyContentScreen({super.key, required this.type});

  final TermAndCondType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(S.of(context).termAndCondDetails),
        centerTitle: true,
      ),
      body: type == TermAndCondType.policy
          ? const PrivacyPolicyTab()
          : type == TermAndCondType.term
              ? const TermOfServicesTab()
              : const TermOfUseSMMall(),
    );
  }
}
