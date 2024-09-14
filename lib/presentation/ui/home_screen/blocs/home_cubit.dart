import 'dart:async';

import '../../../../application/services/common/common.dart';
import '../../../../application/services/main_page/dto/dto.dart';
import '../../../../application/services/main_page/main_page.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import 'home_state.dart';

class HomeCubit extends SafeCubit<HomeState> {
  HomeCubit({
    required this.mainPageController,
  }) : super(const HomeState()) {
    _fetchData();
  }

  final MainPageController mainPageController;

  Future<Result<Failure, List<PostResponse>>> _getPostsMainPage(
      MainPageType mainPageType) async {
    final result =
        await mainPageController.getPostsInMainPage(mainPageType: mainPageType);

    return result;
  }

  Future<void> _getMainPost() async {
    emit(state.copyWith(loadingMain: true));

    final result = await _getPostsMainPage(MainPageType.MAIN);

    result.handleLeft((failure) {
      emit(state.copyWith(loadingMain: false));
      return;
    });

    emit(state.copyWith(mainResponse: result.right, loadingMain: false));
  }

  Future<void> _getBestContentPost() async {
    emit(state.copyWith(loadingBestContent: true));

    final result = await _getPostsMainPage(MainPageType.BEST_CONTENT);
    result.handleLeft((failure) {
      emit(state.copyWith(loadingBestContent: false));
      return;
    });

    emit(state.copyWith(
        bestContentResponse: result.right, loadingBestContent: false));
  }

  Future<void> _getOnlineMagazinePost() async {
    emit(state.copyWith(loadingOnlineMagazine: true));

    final result = await _getPostsMainPage(MainPageType.ONLINE_MAGAZINE);
    result.handleLeft((failure) {
      emit(state.copyWith(loadingOnlineMagazine: false));
      return;
    });

    emit(state.copyWith(
        onlineMagazineResponse: result.right, loadingOnlineMagazine: false));
  }

  Future<void> _getBestReviewPost() async {
    emit(state.copyWith(loadingBestReview: true));

    final result = await _getPostsMainPage(MainPageType.BEST_REVIEW);
    result.handleLeft((failure) {
      emit(state.copyWith(loadingBestReview: false));
      return;
    });

    emit(state.copyWith(
        bestReviewResponse: result.right, loadingBestReview: false));
  }

  Future<void> _getSgmNewsPost() async {
    emit(state.copyWith(loadingSgmNews: true));

    final result = await _getPostsMainPage(MainPageType.SGM_NEWS);
    result.handleLeft((failure) {
      emit(state.copyWith(loadingSgmNews: false));
      return;
    });

    emit(state.copyWith(sgmNewsResponse: result.right, loadingSgmNews: false));
  }

  Future<void> _getMainPageTitles() async {
    emit(state.copyWith(loadingMainTitle: true));

    final result = await mainPageController.getMainPageTitles();
    result.handleLeft((failure) {
      emit(state.copyWith(loadingMainTitle: false));
      return;
    });

    emit(state.copyWith(
        mainPageTitleResponse: result.right, loadingMainTitle: false));
  }

  Future<void> _fetchData() async {
    await Future.wait([
      _getMainPageTitles(),
      _getMainPost(),
      _getBestContentPost(),
      _getOnlineMagazinePost(),
      _getBestReviewPost(),
      _getSgmNewsPost(),
    ]);
  }

  void reload() {
    _fetchData();
  }
}
