import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../application/services/admin_post_curator/admin_post_curator.dart';
import '../../../../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../../../../application/services/app/post_history/post_manager.dart';
import '../../../../application/services/category/category.dart';
import '../../../../application/services/common/common.dart';
import '../../../../application/services/file/file.dart';
import '../../../../application/services/post_community/post_community.dart';
import '../../../../application/services/post_curator/post_curator.dart';
import '../../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../../application/services/user/request/request.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/logging/logging.dart';
import '../../../../utilities/result/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/snack_bar/app_snack_bar.dart';
import '../../../utilities/category_name_resolver.dart';
import '../widgets/post_language_sheet.dart';
import 'create_post_state.dart';

class CreatePostCubit extends SafeCubit<CreatePostState> {
  CreatePostCubit({
    required this.loadingManager,
    required this.failureHandlerManager,
    required this.categoryController,
    required this.fileController,
    required this.postCommunityController,
    required this.categoryType,
    required this.adminPostCuratorController,
    required this.adminPostSgmNewsController,
    required this.postCuratorController,
    required this.postSgmNewsController,
    required this.postManager,
    this.postId,
  }) : super(CreatePostState(
          categoryType: categoryType,
        )) {
    loadCategory();
    if (postId != null) {
      getPostDetails();
    } else {
      getLocalPost();
    }
  }

  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final CategoryController categoryController;
  final FileController fileController;
  final PostCommunityController postCommunityController;
  final AdminPostCuratorController adminPostCuratorController;
  final AdminPostSgmNewsController adminPostSgmNewsController;
  final PostCuratorController postCuratorController;
  final PostSgmNewsController postSgmNewsController;
  final CategoryType categoryType;
  final int? postId;
  final PostManager postManager;

  void loadCategory() async {
    emit(state.copyWith(categoryLoadingStatus: ApiStatus.loading));
    final categoryResult = await categoryController.getAllCategory(
      GetAllCategoryRequest(
        include: [categoryType],
      ),
    );
    categoryResult.handleLeft((value) {
      emit(state.copyWith(categoryLoadingStatus: ApiStatus.fail));
    });
    categoryResult.handleRight((value) {
      if (categoryType != CategoryType.store &&
          categoryType != CategoryType.sgmNews) {
        emit(state.copyWith(
            categoryLoadingStatus: ApiStatus.success, postCategories: value));
      } else {
        emit(state.copyWith(
            categoryLoadingStatus: ApiStatus.success,
            postCategories: value,
            parentCategory: value.firstOrNull));
      }
    });
  }

  Future<CategoryDTO?> getCategoryById(int id) async {
    final result = await categoryController.getCategoryById(
      GetCategoryByIdRequest(
        id: id,
      ),
    );
    result.handleLeft((value) {
      failureHandlerManager.handle(result.left);
      return;
    });
    return result.right;
  }

  void getLocalPost() async {
    emit(state.copyWith(postDetailLoadingStatus: ApiStatus.loading));

    final String? result = await postManager.loadPost(categoryType);

    final Map<String, dynamic> postMap =
        jsonDecode(result ?? '{}') as Map<String, dynamic>;
    CategoryDTO? categoryResult;

    if (categoryType != CategoryType.sgmNews &&
        postMap['parentCategory'] != null) {
      categoryResult = await getCategoryById(postMap['parentCategory'] as int);
    }
    final PostLanguage? language = postMap['language'] != null
        ? PostLanguage.values
            .firstWhere((e) => e.toString() == postMap['language'])
        : null;

    emit(state.copyWith(
      parentCategory: categoryResult,
      childCategory: postMap['childCategory'] != null
          ? categoryResult?.children
              ?.where((element) => element.id == postMap['childCategory'])
              .firstOrNull
          : null,
      language: language != null
          ? LanguageItem(
              language: language,
              label: resolveLanguageLabel(language),
            )
          : null,
      localThumbnail: postMap['thumbnail'] != null
          ? File(postMap['thumbnail'] as String)
          : null,
      createPostNameField: CreatePostNameField.pure(
        value: postMap['title'] != null ? postMap['title'] as String : '',
      ),
      contentPost: postMap['postContent'] != null
          ? Document.fromJson(
              jsonDecode(postMap['postContent'] as String) as List<dynamic>)
          : null,
      postDetailLoadingStatus: ApiStatus.success,
    ));

    logging.e(postMap);
  }

  void getPostDetails() async {
    if (state.postDetailLoadingStatus == ApiStatus.loading) {
      return;
    }
    emit(state.copyWith(postDetailLoadingStatus: ApiStatus.loading));
    Result<Failure, PostResponse>? postResponse;

    switch (categoryType) {
      case CategoryType.community:
        postResponse =
            await postCommunityController.getCommunityPostById(id: postId!);
        break;
      case CategoryType.curator:
        postResponse =
            await postCuratorController.getCuratorPostById(id: postId!);
        break;
      case CategoryType.sgmNews:
        postResponse =
            await postSgmNewsController.getPostSgmNewsById(id: postId!);
        break;
      case CategoryType.store:
        break;
    }
    if (postResponse != null) {
      postResponse.handleLeft((value) {
        emit(state.copyWith(postDetailLoadingStatus: ApiStatus.fail));
        failureHandlerManager.handle(value);
      });
      postResponse.handleRight((value) async {
        CategoryDTO? categoryResult;
        if (categoryType != CategoryType.sgmNews) {
          categoryResult =
              await getCategoryById(value.category?.parent?.id ?? 0);
        }

        emit(state.copyWith(
          postResponse: value,
          parentCategory: categoryResult ?? CategoryDTO(id: value.category?.id),
          childCategory: categoryResult?.children
              ?.where((element) => element.id == value.category?.id)
              .firstOrNull,
          language: LanguageItem(
            language: value.language,
            label: resolveLanguageLabel(value.language ?? PostLanguage.KOREAN),
          ),
          thumbnail: value.thumbnail != null
              ? FileRequest(
                  fileKey: value.thumbnail?.fileKey ?? '',
                  previewUrl: value.thumbnail?.previewUrl ?? '')
              : null,
          createPostNameField: CreatePostNameField.dirty(
            value: value.title ?? '',
          ),
          contentPost: Document.fromJson(
              jsonDecode(value.content ?? '') as List<dynamic>),
          postDetailLoadingStatus: ApiStatus.success,
        ));
      });
    } else {
      emit(state.copyWith(postDetailLoadingStatus: ApiStatus.fail));
    }
  }

  void changeParentCategory(CategoryDTO? parentCategory) {
    if (parentCategory?.id == state.parentCategory?.id) {
      return;
    }
    CreatePostState currentState = state;
    currentState = currentState.unSetChildCategory();
    if (parentCategory == null) {
      currentState = currentState.unSetParentCategory();
    } else {
      currentState = currentState.copyWith(parentCategory: parentCategory);
    }
    emit(currentState);
  }

  void changeChildCategory(SubCategoryDTO? childCategory) {
    if (childCategory?.id == state.childCategory?.id) {
      return;
    }
    CreatePostState currentState = state;
    if (childCategory == null) {
      currentState = currentState.unSetChildCategory();
    } else {
      currentState = currentState.copyWith(childCategory: childCategory);
    }
    emit(currentState);
  }

  void onNameChanged(String value) {
    emit(
      state.copyWith(
        createPostNameField: CreatePostNameField.dirty(
          value: value,
        ),
      ),
    );
  }

  void onLocalThumbnailChanged(File? file, FileRequest? thumbnail) {
    emit(
      state.copyWithThumbnail(newThumbnail: file, thumbnail: thumbnail),
    );
  }

  void onPostContentChanged(Document contentPost) {
    emit(
      state.copyWith(contentPost: contentPost),
    );
  }

  void onPostLanguageChanged(LanguageItem? language) {
    emit(
      state.copyWith(language: language),
    );
  }

  Future<PresignedUrlUploadResponse?> getS3UploadUrl(File file) async {
    final getUrlResult = await fileController.getAwsS3UploadUrl(
      fileName: file.path.split(Platform.pathSeparator).last,
    );
    if (getUrlResult.isLeft) {
      failureHandlerManager.handle(getUrlResult.left);
      return null;
    }
    return getUrlResult.right;
  }

  Future<PresignedUrlUploadResponse?> performUploadImage(File file) async {
    final result = await getS3UploadUrl(file);

    final uploadFileToS3 = await fileController.uploadFileToS3(
      uploadUrl: result?.uploadUrl ?? '',
      file: file,
    );

    uploadFileToS3.handleLeft((value) {
      failureHandlerManager.handle(uploadFileToS3.left);
      return;
    });
    return result;
  }

  Future<void> performCreatePost(File? file, String postContent,
      String contentPlainText, bool isDraft) async {
    PresignedUrlUploadResponse? upLoadImageResult;
    if (file != null) {
      upLoadImageResult = await performUploadImage(file);
    }

    switch (categoryType) {
      case CategoryType.community:
        final createPostResult =
            await postCommunityController.saveCommunityPost(
          request: PostRequest(
              language: state.language?.language ?? PostLanguage.KOREAN,
              title: state.createPostNameField.value,
              content: postContent,
              contentPlainText: contentPlainText,
              categoryId: state.childCategory?.id ?? 0,
              thumbnail: upLoadImageResult == null
                  ? null
                  : FileRequest(
                      fileKey: upLoadImageResult.fileKey ?? '',
                      previewUrl: upLoadImageResult.previewUrl ?? '',
                    ),
              isDraft: isDraft),
        );

        createPostResult.handleLeft((value) {
          failureHandlerManager.handle(value);
        });
        createPostResult.handleRight((value) {
          emit(state.copyWith(createPostFlowCompleted: true));
        });
        break;
      case CategoryType.curator:
        final createPostResult =
            await adminPostCuratorController.saveCuratorPost(
          request: PostRequest(
              language: state.language?.language ?? PostLanguage.KOREAN,
              title: state.createPostNameField.value,
              content: postContent,
              contentPlainText: contentPlainText,
              categoryId: state.childCategory?.id ?? 0,
              thumbnail: upLoadImageResult == null
                  ? null
                  : FileRequest(
                      fileKey: upLoadImageResult.fileKey ?? '',
                      previewUrl: upLoadImageResult.previewUrl ?? '',
                    ),
              isDraft: isDraft),
        );

        createPostResult.handleLeft((value) {
          failureHandlerManager.handle(value);
        });
        createPostResult.handleRight((value) {
          emit(state.copyWith(createPostFlowCompleted: true));
        });
        break;
      case CategoryType.sgmNews:
        final createPostResult =
            await adminPostSgmNewsController.saveSgmNewsPost(
          request: PostRequest(
              language: state.language?.language ?? PostLanguage.KOREAN,
              title: state.createPostNameField.value,
              content: postContent,
              contentPlainText: contentPlainText,
              categoryId: state.parentCategory?.id ?? 0,
              thumbnail: upLoadImageResult == null
                  ? null
                  : FileRequest(
                      fileKey: upLoadImageResult.fileKey ?? '',
                      previewUrl: upLoadImageResult.previewUrl ?? '',
                    ),
              isDraft: isDraft),
        );

        createPostResult.handleLeft((value) {
          failureHandlerManager.handle(value);
        });
        createPostResult.handleRight((value) {
          emit(state.copyWith(createPostFlowCompleted: true));
        });
        break;
      case CategoryType.store:
        break;
    }
  }

  Future<void> performEditPost(File? file, String postContent,
      String contentPlainText, FileRequest? thumbnail, bool isDraft) async {
    PresignedUrlUploadResponse? upLoadImageResult;
    if (file != null && thumbnail == null) {
      upLoadImageResult = await performUploadImage(file);
    }

    switch (categoryType) {
      case CategoryType.community:
        final createPostResult =
            await postCommunityController.updateCommunityPost(
          id: postId ?? 0,
          request: PostRequest(
              language: state.language?.language ?? PostLanguage.KOREAN,
              title: state.createPostNameField.value,
              content: postContent,
              contentPlainText: contentPlainText,
              categoryId: state.childCategory?.id ?? 0,
              thumbnail: thumbnail ??
                  (upLoadImageResult == null
                      ? null
                      : FileRequest(
                          fileKey: upLoadImageResult.fileKey ?? '',
                          previewUrl: upLoadImageResult.previewUrl ?? '',
                        )),
              isDraft: isDraft),
        );

        createPostResult.handleLeft((value) {
          failureHandlerManager.handle(value);
        });
        createPostResult.handleRight((value) {
          emit(state.copyWith(createPostFlowCompleted: true));
        });
        break;
      case CategoryType.curator:
        final createPostResult =
            await adminPostCuratorController.updateCuratorPost(
          id: postId ?? 0,
          request: PostRequest(
              language: state.language?.language ?? PostLanguage.KOREAN,
              title: state.createPostNameField.value,
              content: postContent,
              contentPlainText: contentPlainText,
              categoryId: state.childCategory?.id ?? 0,
              thumbnail: thumbnail ??
                  (upLoadImageResult == null
                      ? null
                      : FileRequest(
                          fileKey: upLoadImageResult.fileKey ?? '',
                          previewUrl: upLoadImageResult.previewUrl ?? '',
                        )),
              isDraft: isDraft),
        );

        createPostResult.handleLeft((value) {
          failureHandlerManager.handle(value);
        });
        createPostResult.handleRight((value) {
          emit(state.copyWith(createPostFlowCompleted: true));
        });
        break;
      case CategoryType.sgmNews:
        final createPostResult =
            await adminPostSgmNewsController.updateSgmNewsPost(
          id: postId ?? 0,
          request: PostRequest(
              language: state.language?.language ?? PostLanguage.KOREAN,
              title: state.createPostNameField.value,
              content: postContent,
              contentPlainText: contentPlainText,
              categoryId: state.parentCategory?.id ?? 0,
              thumbnail: thumbnail ??
                  (upLoadImageResult == null
                      ? null
                      : FileRequest(
                          fileKey: upLoadImageResult.fileKey ?? '',
                          previewUrl: upLoadImageResult.previewUrl ?? '',
                        )),
              isDraft: isDraft),
        );

        createPostResult.handleLeft((value) {
          failureHandlerManager.handle(value);
        });
        createPostResult.handleRight((value) {
          emit(state.copyWith(createPostFlowCompleted: true));
        });
        break;
      case CategoryType.store:
        break;
    }
  }

  Future<String> onUploadImageQuill(File file) async {
    final upLoadImageFuture = performUploadImage(file);
    final upLoadImageResult =
        await loadingManager.startLoading(future: upLoadImageFuture);
    return upLoadImageResult?.previewUrl ?? '';
  }

  void onCreatePost(
      String postContent, String contentPlainText,  {required bool isDraft}) async {
    loadingManager.startLoading(
        future: performCreatePost(
            state.localThumbnail, postContent, contentPlainText, isDraft));
    postManager.removePost(categoryType);
  }

  void onUpdatePost(
      String postContent, String contentPlainText, {required bool isDraft}) async {
    loadingManager.startLoading(
        future: performEditPost(state.localThumbnail, postContent,
            contentPlainText, state.thumbnail, isDraft));
    postManager.removePost(categoryType);
  }

  void onSavePostToLocalStorage(
      String postContent, BuildContext context) async {
    await postManager.savePost(state, categoryType, postContent);
    if (context.mounted) {
      final AppSnackBar snackBar =
          AppSnackBar(title: S.of(context).savePostSuccess);
      snackBar.showSnackBar(context);
    }
  }
}
