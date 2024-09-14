import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../application/services/category/category.dart';
import '../../../../application/services/common/common.dart';
import '../../../../application/services/user/request/request.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/base_form_input/base_form_input.dart';
import '../widgets/post_language_sheet.dart';

enum CreatePostNameFieldError {
  empty,
}

class CreatePostNameField
    extends BaseFormInput<String, CreatePostNameFieldError> {
  const CreatePostNameField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const CreatePostNameField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  CreatePostNameFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return CreatePostNameFieldError.empty;
    }
    return null;
  }
}

class CreatePostState extends Equatable {
  const CreatePostState(
      {this.parentCategory,
      this.childCategory,
      this.categoryLoadingStatus = ApiStatus.initial,
      this.postDetailLoadingStatus = ApiStatus.initial,
      this.createPostNameField = const CreatePostNameField.pure(),
      this.createPostFlowCompleted = false,
      this.postCategories,
      this.thumbnail,
      this.localThumbnail,
      this.contentPost,
      this.language,
      this.postResponse,
      required this.categoryType});

  final CategoryDTO? parentCategory;
  final SubCategoryDTO? childCategory;
  final ApiStatus categoryLoadingStatus;
  final ApiStatus postDetailLoadingStatus;

  final CreatePostNameField createPostNameField;
  final bool createPostFlowCompleted;
  final List<CategoryDTO>? postCategories;
  final FileRequest? thumbnail;
  final File? localThumbnail;
  final Document? contentPost;
  final LanguageItem? language;
  final CategoryType categoryType;
  final PostResponse? postResponse;

  bool get canCreatePost {
    if (categoryType == CategoryType.sgmNews) {
      return createPostNameField.isValid && language != null;
    } else {
      return parentCategory != null &&
          childCategory != null &&
          createPostNameField.isValid &&
          language != null;
    }
  }

  CreatePostState copyWith({
    CreatePostNameField? createPostNameField,
    CategoryDTO? parentCategory,
    SubCategoryDTO? childCategory,
    ApiStatus? categoryLoadingStatus,
    ApiStatus? postDetailLoadingStatus,
    bool? createPostFlowCompleted,
    List<CategoryDTO>? postCategories,
    FileRequest? thumbnail,
    File? localThumbnail,
    Document? contentPost,
    LanguageItem? language,
    PostResponse? postResponse,
  }) {
    return CreatePostState(
      createPostNameField: createPostNameField ?? this.createPostNameField,
      parentCategory: parentCategory ?? this.parentCategory,
      childCategory: childCategory ?? this.childCategory,
      createPostFlowCompleted:
          createPostFlowCompleted ?? this.createPostFlowCompleted,
      postCategories: postCategories ?? this.postCategories,
      categoryLoadingStatus:
          categoryLoadingStatus ?? this.categoryLoadingStatus,
      postDetailLoadingStatus:
          postDetailLoadingStatus ?? this.postDetailLoadingStatus,
      thumbnail: thumbnail ?? this.thumbnail,
      localThumbnail: localThumbnail ?? this.localThumbnail,
      contentPost: contentPost ?? this.contentPost,
      language: language ?? this.language,
      categoryType: categoryType,
      postResponse: postResponse ?? this.postResponse,
    );
  }

  CreatePostState copyWithThumbnail({
    File? newThumbnail,
    FileRequest? thumbnail,
  }) {
    return CreatePostState(
      createPostNameField: createPostNameField,
      parentCategory: parentCategory,
      childCategory: childCategory,
      createPostFlowCompleted: createPostFlowCompleted,
      postCategories: postCategories,
      categoryLoadingStatus: categoryLoadingStatus,
      postDetailLoadingStatus: postDetailLoadingStatus,
      thumbnail: thumbnail,
      localThumbnail: newThumbnail,
      contentPost: contentPost,
      language: language,
      categoryType: categoryType,
      postResponse: postResponse,
    );
  }

  CreatePostState unSetParentCategory() {
    return CreatePostState(
      categoryLoadingStatus: categoryLoadingStatus,
      postDetailLoadingStatus: postDetailLoadingStatus,
      childCategory: childCategory,
      postCategories: postCategories,
      createPostNameField: createPostNameField,
      createPostFlowCompleted: createPostFlowCompleted,
      thumbnail: thumbnail,
      localThumbnail: localThumbnail,
      contentPost: contentPost,
      language: language,
      categoryType: categoryType,
      postResponse: postResponse,
    );
  }

  CreatePostState unSetChildCategory() {
    return CreatePostState(
      categoryLoadingStatus: categoryLoadingStatus,
      postDetailLoadingStatus: postDetailLoadingStatus,
      parentCategory: parentCategory,
      postCategories: postCategories,
      createPostNameField: createPostNameField,
      createPostFlowCompleted: createPostFlowCompleted,
      thumbnail: thumbnail,
      localThumbnail: localThumbnail,
      contentPost: contentPost,
      language: language,
      categoryType: categoryType,
      postResponse: postResponse,
    );
  }

  @override
  List<Object?> get props => [
        parentCategory,
        childCategory,
        categoryLoadingStatus,
        postDetailLoadingStatus,
        createPostNameField,
        createPostFlowCompleted,
        postCategories,
        thumbnail,
        localThumbnail,
        contentPost,
        language,
        categoryType,
        postResponse,
      ];
}
