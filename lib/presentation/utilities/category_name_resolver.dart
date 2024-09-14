import 'package:flutter/material.dart';

import '../../application/services/category/category.dart';
import '../../application/services/common/common.dart';
import '../../application/services/user/response/response.dart';

String? resolveCategoryName(BuildContext context, CategoryDTO? categoryDTO) {
  String? result;

  switch (Localizations.localeOf(context).languageCode) {
    case 'en':
      result = categoryDTO?.nameEnglish;
    case 'zh':
      result = categoryDTO?.nameChina;
    case 'ja':
      result = categoryDTO?.nameJapan;
  }
  return result ?? categoryDTO?.nameKorea;
}

String? resolvePostCategoryName(
    BuildContext context, PostCategoryDTO? postCategoryDTO) {
  String? result;

  switch (Localizations.localeOf(context).languageCode) {
    case 'en':
      result = postCategoryDTO?.nameEnglish;
    case 'zh':
      result = postCategoryDTO?.nameChina;
    case 'ja':
      result = postCategoryDTO?.nameJapan;
  }
  return result ?? postCategoryDTO?.nameKorea;
}

String? resolveSubCategoryName(
    BuildContext context, SubCategoryDTO? subCategoryDTO) {
  String? result;

  switch (Localizations.localeOf(context).languageCode) {
    case 'en':
      result = subCategoryDTO?.nameEnglish;
    case 'zh':
      result = subCategoryDTO?.nameChina;
    case 'ja':
      result = subCategoryDTO?.nameJapan;
  }
  return result ?? subCategoryDTO?.nameKorea;
}

String? resolveFieldValueName(
    BuildContext context, LocalizedFieldValue? fieldValue) {
  String? result;

  switch (Localizations.localeOf(context).languageCode) {
    case 'en':
      result = fieldValue?.en;
    case 'zh':
      result = fieldValue?.cn;
    case 'ja':
      result = fieldValue?.jp;
  }
  return result ?? fieldValue?.kr;
}

String? resolveNotificationTitle(
    BuildContext context, NotificationResponse? notificationResponse) {
  String? result;

  switch (Localizations.localeOf(context).languageCode) {
    case 'en':
      result = notificationResponse?.titleEnglish;
    case 'zh':
      result = notificationResponse?.titleChina;
    case 'ja':
      result = notificationResponse?.titleJapan;
  }
  return result ?? notificationResponse?.titleKorea;
}

String resolveLanguageLabel(PostLanguage postLanguage) {
  switch (postLanguage) {
    case PostLanguage.KOREAN:
      return 'Korean';
    case PostLanguage.ENGLISH:
      return 'English';
    case PostLanguage.CHINESE:
      return 'Chinese';
    case PostLanguage.JAPANESE:
      return 'Japanese';
  }
}
