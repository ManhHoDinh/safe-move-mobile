import 'package:meta/meta.dart';

import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_comment/post_comment.dart';
import '../../../../application/services/post_community/post_community.dart';
import '../../../../application/services/post_curator/post_curator.dart';
import '../../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'reported_user_state.dart';

class ReportedUserCubit
    extends InfiniteLoaderCubit<ReportedUserState, UserDTO> {
  ReportedUserCubit({
    required this.userController,
    required this.loadingManager,
    required super.failureHandlerManager,
  }) : super(
          initialState: const ReportedUserState(),
        );

  final UserController userController;
  final LoadingManager loadingManager;

  @override
  Future<Result<Failure, PageableData<UserDTO>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    var result =
        await userController.getReportedUsers(size: pageSize, page: page);

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
