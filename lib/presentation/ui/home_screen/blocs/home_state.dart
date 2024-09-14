import '../../../../application/services/common/common.dart';
import '../../../../application/services/main_page/response/src/main_page_title_response.dart';

class HomeState {
  const HomeState({
    this.mainResponse = const [],
    this.bestContentResponse = const [],
    this.onlineMagazineResponse = const [],
    this.bestReviewResponse = const [],
    this.sgmNewsResponse = const [],
    this.mainPageTitleResponse,
    this.loadingMain = false,
    this.loadingBestContent = false,
    this.loadingOnlineMagazine = false,
    this.loadingBestReview = false,
    this.loadingSgmNews = false,
    this.loadingMainTitle = false,
  });

  final List<PostResponse> mainResponse;
  final List<PostResponse> bestContentResponse;
  final List<PostResponse> onlineMagazineResponse;
  final List<PostResponse> bestReviewResponse;
  final List<PostResponse> sgmNewsResponse;
  final MainPageTitleResponse? mainPageTitleResponse;

  final bool loadingMain;
  final bool loadingBestContent;
  final bool loadingOnlineMagazine;
  final bool loadingBestReview;
  final bool loadingSgmNews;
  final bool loadingMainTitle;

  HomeState copyWith({
    List<PostResponse>? mainResponse,
    List<PostResponse>? bestContentResponse,
    List<PostResponse>? onlineMagazineResponse,
    List<PostResponse>? bestReviewResponse,
    List<PostResponse>? sgmNewsResponse,
    MainPageTitleResponse? mainPageTitleResponse,
    bool? loadingMain,
    bool? loadingBestContent,
    bool? loadingOnlineMagazine,
    bool? loadingBestReview,
    bool? loadingSgmNews,
    bool? loadingMainTitle,
  }) {
    return HomeState(
      mainResponse: mainResponse ?? this.mainResponse,
      bestContentResponse: bestContentResponse ?? this.bestContentResponse,
      onlineMagazineResponse:
          onlineMagazineResponse ?? this.onlineMagazineResponse,
      bestReviewResponse: bestReviewResponse ?? this.bestReviewResponse,
      sgmNewsResponse: sgmNewsResponse ?? this.sgmNewsResponse,
      mainPageTitleResponse:
          mainPageTitleResponse ?? this.mainPageTitleResponse,
      loadingMain: loadingMain ?? this.loadingMain,
      loadingBestContent: loadingBestContent ?? this.loadingBestContent,
      loadingOnlineMagazine:
          loadingOnlineMagazine ?? this.loadingOnlineMagazine,
      loadingBestReview: loadingBestReview ?? this.loadingBestReview,
      loadingSgmNews: loadingSgmNews ?? this.loadingSgmNews,
      loadingMainTitle: loadingMainTitle ?? this.loadingMainTitle,
    );
  }
}
