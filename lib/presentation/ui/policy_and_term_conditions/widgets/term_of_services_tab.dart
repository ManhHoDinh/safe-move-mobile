import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_embeds.dart';
import '../../../../application/services/term_and_condition/dto/src/term_type.dart';
import '../../../../application/services/term_and_condition/term_and_condition.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../utilities/term_resolver.dart';
import '../../community_screen/widgets/post_loading_error.dart';
import '../blocs/term_and_cond_cubit.dart';

class TermOfServicesTab extends StatefulWidget {
  const TermOfServicesTab({super.key});

  @override
  State<TermOfServicesTab> createState() => _TermOfServicesTabState();
}

class _TermOfServicesTabState extends State<TermOfServicesTab> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TermAndCondCubit>(
      create: (BuildContext context) {
        return TermAndCondCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          termAndCondController: context.read<TermAndCondController>(),
          termType: TermType.TERM_OF_SERVICE,
        );
      },
      child: ColoredBox(
        color: AppColors.gray.shade100,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 40),
            child: BlocBuilder<TermAndCondCubit, TermAndCondState>(
              builder: (context, state) {
                final apiStatus = state.apiStatus;
                if (apiStatus == ApiStatus.fail) {
                  return const PostLoadingError();
                }
                if (apiStatus == ApiStatus.loading) {
                  return AppShimmer(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        height: 1000,
                        color: Colors.black,
                      ),
                    ),
                  );
                }

                final termContent = resolveTermContent(context, state.data);
                if (termContent.isEmpty) {
                  return Container();
                }
                final json = jsonDecode(termContent);
                _controller.document = Document.fromJson(json as List<dynamic>);
                return LayoutBuilder(builder: (context, constrain) {
                  return SizedBox(
                    width: constrain.maxWidth,
                    child: QuillEditor.basic(
                      configurations: QuillEditorConfigurations(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        isOnTapOutsideEnabled: false,
                        showCursor: false,
                        controller: _controller,
                        readOnly: true,
                        sharedConfigurations: QuillSharedConfigurations(
                          locale: context.watch<LocaleCubit>().state,
                        ),
                        embedBuilders: FlutterQuillEmbeds.editorBuilders(),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
