import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../utilities/date_format.dart';

class QAItem extends StatelessWidget {
  const QAItem({
    super.key,
    this.asker,
    required this.category,
    this.question,
    this.answer,
    required this.askDate,
    this.answerDate,
    this.locked = false,
    this.loading = false,
  });

  final String? asker;
  final String category;
  final String? question;
  final String? answer;
  final bool locked;
  final DateTime askDate;
  final DateTime? answerDate;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final bool answered = answer != null;

    final List<Widget> contents = [];
    if (locked) {
      contents.add(const _QALock());
    } else {
      if (question?.isNotEmpty ?? false) {
        contents.add(_QAContent(
            loading: loading,
            contentType: _QAContentType.question,
            content: question ?? ''));
      }
      if (answer?.isNotEmpty ?? false) {
        contents.add(Padding(
          padding: const EdgeInsets.only(top: 8),
          child: _QAContent(
            contentType: _QAContentType.answer,
            content: answer ?? '',
            answerDate: answerDate,
            loading: loading,
          ),
        ));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (loading)
            Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          else
            _QAGeneralInfo(
              askDate: askDate,
              asker: asker ?? '',
              category: category,
              answered: answered,
            ),
          const SizedBox(height: 12),
          ...contents,
        ],
      ),
    );
  }
}

class _QALock extends StatelessWidget {
  const _QALock();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.svgs.appQaLock.svg(),
        const SizedBox(width: 12),
        Text(
          S.of(context).qaHidden,
          style: Styles.s15()
              .withHeight(24 / 15)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.bodyText),
        ),
      ],
    );
  }
}

class _QAGeneralInfo extends StatelessWidget {
  const _QAGeneralInfo({
    required this.askDate,
    required this.asker,
    required this.category,
    required this.answered,
  });

  final String asker;
  final DateTime askDate;
  final String category;
  final bool answered;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 200),
      style: Styles.s13()
          .withLetterSpacing(-2.5 / 100)
          .withColor(AppColors.text.bodyText),
      child: Row(
        children: [
          Text(
            S.of(context).qaCompleted,
            style: TextStyle(color: answered ? AppColors.blue.shade500 : null),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: 1,
            height: 12,
            color: AppColors.gray.shade40,
          ),
          if (category.isNotEmpty)
            Text(
              category,
            )
          else
            const SizedBox.shrink(),
          const Spacer(),
          Text(asker),
          const SizedBox(width: 16),
          Text(formatDate(askDate)),
        ],
      ),
    );
  }
}

enum _QAContentType {
  question,
  answer,
}

class _QAContent extends StatelessWidget {
  const _QAContent({
    required this.contentType,
    required this.content,
    this.answerDate,
    this.loading = false,
  });

  final _QAContentType contentType;
  final String content;
  final DateTime? answerDate;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Widget prefix = const SizedBox.shrink();
    switch (contentType) {
      case _QAContentType.question:
        prefix = Assets.svgs.qaQIcon.svg();
        break;
      case _QAContentType.answer:
        prefix = Assets.svgs.qaAIcon.svg();
        break;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (loading)
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
          )
        else
          prefix,
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (loading)
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              else
                Text(
                  content,
                  style: Styles.s15()
                      .withHeight(24 / 15)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.black),
                ),
              if (answerDate != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: loading
                      ? Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )
                      : Text(
                          formatDate(
                            answerDate ?? DateTime.now(),
                          ),
                          style: Styles.s13()
                              .withLetterSpacing(-2.5 / 100)
                              .withColor(AppColors.text.bodyText),
                        ),
                )
              else
                const SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
  }
}
