import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_embeds.dart';

import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/product_detail_cubit.dart';
import '../blocs/product_detail_state.dart';

class ProductInformationTab extends StatefulWidget {
  const ProductInformationTab({super.key});

  @override
  State<ProductInformationTab> createState() => _ProductInformationTabState();
}

class _ProductInformationTabState extends State<ProductInformationTab> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
      if (state.productResponse.description != null &&
          resolveFieldValueName(context, state.productResponse.description) !=
              null) {
        final json = jsonDecode(
            resolveFieldValueName(context, state.productResponse.description)!);
        _controller.document = Document.fromJson(json as List<dynamic>);
      }
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: LayoutBuilder(builder: (context, constrain) {
          return SizedBox(
            width: constrain.maxWidth,
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                isOnTapOutsideEnabled: false,
                showCursor: false,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                controller: _controller,
                readOnly: true,
                sharedConfigurations: QuillSharedConfigurations(
                  locale: context.read<LocaleCubit>().state,
                ),
                embedBuilders: FlutterQuillEmbeds.editorBuilders(),
              ),
            ),
          );
        }),
      );
    });
  }
}
