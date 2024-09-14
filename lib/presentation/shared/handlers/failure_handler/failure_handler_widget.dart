import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../../../../application/failures/data_convert_failure/data_convert_failure.dart';
import '../../../../application/failures/dio_failure/dio_failure.dart';
import '../../../../application/failures/generic/generic_failure.dart';
import '../../../../application/failures/persistent/persistent.dart';
import '../../../../utilities/failure/convert_code_failure.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../bases/childless_assertion/childless_assertion.dart';
import '../../../bases/navigation_context_resolver/src/navigation_context_resolved_mixin.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import 'failure_handler_manager.dart';

class FailureHandlerWidget extends SingleChildStatelessWidget
    with NavigationContextResolverMixin, ChildlessAssertion {
  const FailureHandlerWidget({super.key});

  @override
  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return BlocListener<FailureHandlerManager, HandlerState>(
      listener: (context, state) {
        if (state is HandlerHandlingState) {
          final navigatorContext = maybeResolve(context);
          if (navigatorContext != null && navigatorContext.mounted) {
            handle(
              navigatorContext,
              state.value,
            );
          }
        }
      },
      child: child,
    );
  }

  void handle(BuildContext context, Failure failure) {
    if (failure is DioFailure) {
      handleDioFailure(context, failure);
    }

    if (failure is DataConvertFailure) {
      handleDataConvertFailure(context, failure);
    }

    if (failure is GenericFailure) {
      handleGenericFailure(context, failure);
    }

    if (failure is PersistentFailure) {
      handlePersistentFailure(context, failure);
    }
  }

  void handleDioFailure(BuildContext context, DioFailure failure) {
    if (failure is ServerFailure || failure is BadRequestFailure) {
      final String code =
          convertFailureCode((failure as ResponseFailure).code ?? '');
      final Map<String, String> errors = {
        'daddrs1000': S.of(context).daddrs1000,
        'aa1000': S.of(context).aa1000,
        'aa1001': S.of(context).aa1001,
        'aa1002': S.of(context).aa1002,
        'aa1003': S.of(context).aa1003,
        'aa1004': S.of(context).aa1004,
        'aa1005': S.of(context).aa1005,
        'aa1006': S.of(context).aa1006,
        'aa1007': S.of(context).aa1007,
        'aa1008': S.of(context).aa1008,
        'aa1009': S.of(context).aa1009,
        'aa1010': S.of(context).aa1010,
        'aa1011': S.of(context).aa1011,
        'aa1012': S.of(context).aa1012,
        'a1001': S.of(context).a1001,
        'a1002': S.of(context).a1002,
        'a1003': S.of(context).a1003,
        'dcrt1000': S.of(context).dcrt1000,
        'dcrt1001': S.of(context).dcrt1001,
        'dc1000': S.of(context).dc1000,
        'dc1001': S.of(context).dc1001,
        'dc1002': S.of(context).dc1002,
        'dc1003': S.of(context).dc1003,
        'dc1004': S.of(context).dc1004,
        'dc1005': S.of(context).dc1005,
        'dcmt1000': S.of(context).dcmt1000,
        'dcmt1001': S.of(context).dcmt1001,
        'dcmt1002': S.of(context).dcmt1002,
        'dcmt1003': S.of(context).dcmt1003,
        'dfvrcate1000': S.of(context).dfvrcate1000,
        'af1000': S.of(context).af1000,
        'af1001': S.of(context).af1001,
        'af1002': S.of(context).af1002,
        'dfile1000': S.of(context).dfile1000,
        'dfl1000': S.of(context).dfl1000,
        'dfl1001': S.of(context).dfl1001,
        'dl1005': S.of(context).dl1005,
        'dmp1000': S.of(context).dmp1000,
        'dntf1000': S.of(context).dntf1000,
        'dntfs1000': S.of(context).dntfs1000,
        'dordd1000': S.of(context).dordd1000,
        'aods1': S.of(context).aods1,
        'dord1000': S.of(context).dord1000,
        'dord1001': S.of(context).dord1001,
        'dord1002': S.of(context).dord1002,
        'dord1003': S.of(context).dord1003,
        'dord1004': S.of(context).dord1004,
        'dord1005': S.of(context).dord1005,
        'dord1006': S.of(context).dord1006,
        'dord1007': S.of(context).dord1007,
        'aos1': S.of(context).aos1,
        'aos2': S.of(context).aos2,
        'dpst1000': S.of(context).dpst1000,
        'dpst1001': S.of(context).dpst1001,
        'dpst1002': S.of(context).dpst1002,
        'dpst1003': S.of(context).dpst1003,
        'dpst1004': S.of(context).dpst1004,
        'dprd1000': S.of(context).dprd1000,
        'dpu1000': S.of(context).dpu1000,
        'dqa1000': S.of(context).dqa1000,
        'dqa1001': S.of(context).dqa1001,
        'drt1000': S.of(context).drt1000,
        'drt1001': S.of(context).drt1001,
        'drct1000': S.of(context).drct1000,
        'dsf1000': S.of(context).dsf1000,
        'dsm1000': S.of(context).dsm1000,
        'au1000': S.of(context).au1000,
        'du1001': S.of(context).du1001,
        'du1002': S.of(context).du1002,
        'du1003': S.of(context).du1003,
        'du1004': S.of(context).du1004,
        'du1005': S.of(context).du1005,
        'du1006': S.of(context).du1006,
        'du1007': S.of(context).du1007,
        'du1008': S.of(context).du1008,
        'du1009': S.of(context).du1009,
        'du1010': S.of(context).du1010,
        'du1011': S.of(context).du1011,
        'du1012': S.of(context).du1012,
        'du1013': S.of(context).du1013,
        'du1014': S.of(context).du1014,
        'du1015': S.of(context).du1015,
        'du1016': S.of(context).du1016,
        'du1017': S.of(context).du1017,
        'sw101': S.of(context).sw101,
        'sw102': S.of(context).sw102,
        'sw103': S.of(context).sw103,
        'sw104': S.of(context).sw104,
        'sw105': S.of(context).sw105,
        'sw106': S.of(context).sw106,
        'sw500': S.of(context).sw500,
      };

      final errorMessage = errors[code];
      AlertRouteData(content: errorMessage ?? '').push(context);
    }

    if (failure is OtherDioFailure) {
      AlertRouteData(content: S.of(context).otherDioFailure).push(context);
    }

    if (failure is ConnectionFailure) {
      AlertRouteData(content: S.of(context).connectionFailure).push(context);
    }

    if (failure is TimeoutFailure) {
      AlertRouteData(content: S.of(context).timeoutFailure).push(context);
    }
  }

  void handleDataConvertFailure(
      BuildContext context, DataConvertFailure failure) {
    AlertRouteData(content: S.of(context).convertDataFailure).push(context);
  }

  void handleGenericFailure(BuildContext context, GenericFailure failure) {
    AlertRouteData(content: S.of(context).genericFailure).push(context);
  }

  void handlePersistentFailure(
      BuildContext context, PersistentFailure failure) {
    AlertRouteData(content: S.of(context).persistentFailure).push(context);
  }
}
