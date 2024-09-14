import 'package:daum_postcode_search/daum_postcode_search.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/logging/logging.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/app_bar/common_app_bar.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final DaumPostcodeSearch daumPostcodeSearch = DaumPostcodeSearch(
      onConsoleMessage: (_, message) => logging.i(message),
      onLoadError: (controller, uri, errorCode, message) => setState(
        () {
          errorMessage = message;
        },
      ),
      onLoadHttpError: (controller, uri, errorCode, message) => setState(
        () {
          errorMessage = message;
        },
      ),
    );

    return Scaffold(
      appBar: CommonAppBar(
        title: Text(S.of(context).addressSearch),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: daumPostcodeSearch,
          ),
        ],
      ),
    );
  }
}
