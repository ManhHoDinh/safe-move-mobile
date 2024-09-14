import '../../../../application/services/common/common.dart';
import '../../../../application/services/common/dto/src/post_activity_type.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

part 'associated_post_by_user_id_state.dart';

class AssociatedPostByUserIdCubit extends InfiniteLoaderCubit<
    AssociatedPostStateByUserIdState, PostResponse> {
  AssociatedPostByUserIdCubit({
    required this.userId,
    required this.initialPostType,
    required this.initialPostActivityType,
    required super.failureHandlerManager,
    required this.userController,
  }) : super(
            initialState: AssociatedPostStateByUserIdState(
                postType: initialPostType,
                postActivityType: initialPostActivityType));

  final UserController userController;
  final PostType initialPostType;
  final PostActivityType initialPostActivityType;
  final int userId;

  void updatePostActivityType(PostActivityType postActivityType) {
    emit(state.copyWith(postActivityType: postActivityType));
    reload();
  }

  void updatePostType(PostType postType) {
    emit(state.copyWith(postType: postType));
    reload();
  }

  @override
  Future<Result<Failure, PageableData<PostResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await userController.getPostsByUserId(
      size: pageSize,
      userId: userId,
      postType: state.postType,
      postActivityType: state.postActivityType,
    );

    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        final totalPages = value.totalPages ?? 0;
        final data = value.content ?? [];
        return PageableData(
          totalItems: value.totalElements ?? 0,
          totalPages: totalPages,
          data: data,
        );
      },
    );
  }
}
