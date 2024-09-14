import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application/services/admin_post_curator/admin_post_curator.dart';
import '../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../application/services/app/app_config/app_config.dart';
import '../application/services/app/app_data/app_term_and_cond_status_service.dart';
import '../application/services/app/app_data/app_username_service.dart';
import '../application/services/app/locale_service/locale_service.dart';
import '../application/services/app/post_history/post_manager.dart';
import '../application/services/app/search_history/search_history.dart';
import '../application/services/app/token_service/refresh_token_manager.dart';
import '../application/services/app/token_service/token_service.dart';
import '../application/services/auth/auth.dart';
import '../application/services/category/category.dart';
import '../application/services/file/file.dart';
import '../application/services/main_page/main_page.dart';
import '../application/services/post_comment/post_comment.dart';
import '../application/services/post_community/post_community.dart';
import '../application/services/post_curator/post_curator.dart';
import '../application/services/post_sgm_news/post_sgm_news.dart';
import '../application/services/product/product.dart';
import '../application/services/profile_url/profile_url.dart';
import '../application/services/qa/qa.dart';
import '../application/services/rating/rating.dart';
import '../application/services/social_media/social_media.dart';
import '../application/services/stats/controller/stats_controller.dart';
import '../application/services/sweettracker/controller/controller.dart';
import '../application/services/term_and_condition/term_and_condition.dart';
import '../application/services/user/controller/controller.dart';
import '../application/services/user_address/user_address.dart';
import '../application/services/user_cart/user_cart.dart';
import '../application/services/user_favorite_category/user_favorite_category.dart';
import '../application/services/user_follow/user_follow.dart';
import '../application/services/user_order/user_order.dart';
import '../application/services/user_order_session/user_order_session.dart';
import '../application/services/user_post_reaction/user_post_reaction.dart';
import '../application/services/youtube_client_service/youtube_client_service.dart';
import '../application/services/youtube_client_service/youtube_video_controller.dart';
import '../infrastructure/interceptors/auth_interceptor/auth_interceptor.dart';
import '../infrastructure/interceptors/auth_interceptor/token_based_auth_interceptor.dart';
import '../infrastructure/interceptors/logger_interceptor/logger_interceptor.dart';
import '../infrastructure/services_impl/admin_post_curator_impl/admin_post_curator_controller.dart';
import '../infrastructure/services_impl/admin_post_curator_impl/data_source.dart';
import '../infrastructure/services_impl/admin_post_sgm_news_impl/admin_post_sgm_news_controller.dart';
import '../infrastructure/services_impl/admin_post_sgm_news_impl/data_source.dart';
import '../infrastructure/services_impl/app_config_impl/app_config_impl.dart';
import '../infrastructure/services_impl/app_data_impl/app_term_and_cond_status_service_impl.dart';
import '../infrastructure/services_impl/app_data_impl/app_username_service_impl.dart';
import '../infrastructure/services_impl/auth_impl/auth_controller_impl.dart';
import '../infrastructure/services_impl/auth_impl/data_source.dart';
import '../infrastructure/services_impl/category_impl/category_controller_impl.dart';
import '../infrastructure/services_impl/category_impl/data_source.dart';
import '../infrastructure/services_impl/file_impl/data_source.dart';
import '../infrastructure/services_impl/file_impl/file_controller_impl.dart';
import '../infrastructure/services_impl/locale_service_impl/locale_service_impl.dart';
import '../infrastructure/services_impl/main_page_impl/data_source.dart';
import '../infrastructure/services_impl/main_page_impl/main_page_controller_impl.dart';
import '../infrastructure/services_impl/post_comment_impl/data_source.dart';
import '../infrastructure/services_impl/post_comment_impl/post_comment_controller_impl.dart';
import '../infrastructure/services_impl/post_community_impl/data_source.dart';
import '../infrastructure/services_impl/post_community_impl/post_community_controller_impl.dart';
import '../infrastructure/services_impl/post_curator_impl/data_source.dart';
import '../infrastructure/services_impl/post_curator_impl/post_curator_controller_impl.dart';
import '../infrastructure/services_impl/post_service_impl/post_manager_impl.dart';
import '../infrastructure/services_impl/post_sgm_news_impl/data_source.dart';
import '../infrastructure/services_impl/post_sgm_news_impl/post_sgm_news_controller_impl.dart';
import '../infrastructure/services_impl/product_impl/data_source.dart';
import '../infrastructure/services_impl/product_impl/product_controller_impl.dart';
import '../infrastructure/services_impl/profile_url_impl/data_source.dart';
import '../infrastructure/services_impl/profile_url_impl/profile_url_controller_impl.dart';
import '../infrastructure/services_impl/qa_impl/data_source.dart';
import '../infrastructure/services_impl/qa_impl/qa_controller_impl.dart';
import '../infrastructure/services_impl/rating_impl/data_source.dart';
import '../infrastructure/services_impl/rating_impl/rating_controller_impl.dart';
import '../infrastructure/services_impl/search_history_impl/search_history_service_impl.dart';
import '../infrastructure/services_impl/social_media_impl/data_source.dart';
import '../infrastructure/services_impl/social_media_impl/social_media_controller_impl.dart';
import '../infrastructure/services_impl/stats_impl/data_source.dart';
import '../infrastructure/services_impl/stats_impl/stats_controller_impl.dart';
import '../infrastructure/services_impl/sweettracker_impl/sweettracker_controller_impl.dart';
import '../infrastructure/services_impl/term_and_cond_impl/data_source.dart';
import '../infrastructure/services_impl/term_and_cond_impl/term_and_cond_controller_impl.dart';
import '../infrastructure/services_impl/token_service_impl/refresh_token_manager_impl.dart';
import '../infrastructure/services_impl/user_address_impl/data_source.dart';
import '../infrastructure/services_impl/user_address_impl/user_address_controller_impl.dart';
import '../infrastructure/services_impl/user_cart_impl/data_source.dart';
import '../infrastructure/services_impl/user_cart_impl/user_cart_controller_impl.dart';
import '../infrastructure/services_impl/user_favorite_category_impl/data_source.dart';
import '../infrastructure/services_impl/user_favorite_category_impl/user_favorite_category_controller_impl.dart';
import '../infrastructure/services_impl/user_follow_impl/data_source.dart';
import '../infrastructure/services_impl/user_follow_impl/user_follow_controller_impl.dart';
import '../infrastructure/services_impl/user_impl/data_source.dart';
import '../infrastructure/services_impl/user_impl/user_controller_impl.dart';
import '../infrastructure/services_impl/user_order_impl/data_source.dart';
import '../infrastructure/services_impl/user_order_impl/user_order_controller_impl.dart';
import '../infrastructure/services_impl/user_order_session_impl/data_source.dart';
import '../infrastructure/services_impl/user_order_session_impl/profile_url_controller_impl.dart';
import '../infrastructure/services_impl/user_post_reaction_impl/data_source.dart';
import '../infrastructure/services_impl/user_post_reaction_impl/profile_url_controller_impl.dart';
import '../infrastructure/services_impl/youtube_client_service_impl/youtube_client_service_impl.dart';
import '../infrastructure/services_impl/youtube_client_service_impl/youtube_controller_impl.dart';
import 'base/di_service.dart';

class AppDIData {
  const AppDIData({
    required this.authController,
    required this.config,
    required this.tokenService,
    required this.userController,
    required this.refreshTokenManager,
    required this.appUsernameService,
    required this.termAndCondStatusService,
    required this.categoryController,
    required this.fileController,
    required this.mainPageController,
    required this.postCommentController,
    required this.postCommunityController,
    required this.postCuratorController,
    required this.postSgmNewsController,
    required this.productController,
    required this.qaController,
    required this.ratingController,
    required this.socialMediaController,
    required this.userAddressController,
    required this.userCartController,
    required this.profileUrlController,
    required this.userFollowController,
    required this.userFavoriteCategoryController,
    required this.userOrderController,
    required this.userOrderSessionController,
    required this.userPostReactionController,
    required this.searchHistoryService,
    required this.adminPostCuratorController,
    required this.adminPostSgmNewsController,
    required this.postManager,
    required this.youtubeClientService,
    required this.localeService,
    required this.statsController,
    required this.youtubeVideoController,
    required this.sweetTrackerController,
    required this.termAndCondController,
  });

  final YoutubeClientService youtubeClientService;
  final AppConfig config;
  final AuthController authController;
  final UserController userController;
  final TokenService tokenService;
  final RefreshTokenManager refreshTokenManager;
  final AppUsernameService appUsernameService;
  final AppTermAndCondStatusService termAndCondStatusService;
  final CategoryController categoryController;
  final FileController fileController;
  final MainPageController mainPageController;
  final PostCommentController postCommentController;
  final PostCommunityController postCommunityController;
  final PostCuratorController postCuratorController;
  final PostSgmNewsController postSgmNewsController;
  final ProductController productController;
  final QAController qaController;
  final RatingController ratingController;
  final SocialMediaController socialMediaController;
  final UserAddressController userAddressController;
  final UserCartController userCartController;
  final ProfileUrlController profileUrlController;
  final UserFollowController userFollowController;
  final UserFavoriteCategoryController userFavoriteCategoryController;
  final UserOrderController userOrderController;
  final UserOrderSessionController userOrderSessionController;
  final UserPostReactionController userPostReactionController;
  final SearchHistoryService searchHistoryService;
  final AdminPostCuratorController adminPostCuratorController;
  final AdminPostSgmNewsController adminPostSgmNewsController;
  final PostManager postManager;
  final LocaleService localeService;
  final StatsController statsController;
  final YoutubeVideoController youtubeVideoController;
  final SweetTrackerController sweetTrackerController;
  final TermAndCondController termAndCondController;
}

class AppDIService implements DIService<AppDIData> {
  TokenService createTokenService({
    required RefreshTokenManager refreshTokenManager,
  }) {
    final tokenService = TokenService(refreshTokenManager: refreshTokenManager);
    return tokenService;
  }

  RefreshTokenManager createRefreshTokenManager({
    required Dio dio,
    required SharedPreferences sharedPreferences,
  }) {
    final AuthController authController =
        AuthControllerImpl(authDataSource: AuthDataSource(dio));
    final RefreshTokenManager refreshTokenManager = RefreshTokenManagerImpl(
      authController: authController,
      prefs: sharedPreferences,
    );
    return refreshTokenManager;
  }

  @override
  Future<AppDIData> load() async {
    // config
    const AppConfigLoader configLoader = AppConfigLoaderImpl();
    final AppConfig appConfig = (await configLoader.loadConfig()).right;

    // shared pref
    final sharedPrefs = await SharedPreferences.getInstance();

    // dio options
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
    );

    // dio options for sweettracker
    final optionsSweettracker = BaseOptions(
      baseUrl: appConfig.sweettrackerBaseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
    );

    final loggerInterceptor = LoggerInterceptor();

    final tokenServiceDio = Dio(options);
    tokenServiceDio.interceptors.addAll([
      loggerInterceptor,
    ]);

    final refreshTokenManager = createRefreshTokenManager(
      dio: tokenServiceDio,
      sharedPreferences: sharedPrefs,
    );

    final tokenService = createTokenService(
      refreshTokenManager: refreshTokenManager,
    );

    final AuthInterceptor authInterceptor = TokenBasedAuthInterceptor(
      tokenService: tokenService,
      dio: tokenServiceDio,
    );

    // dio for api
    final dio = Dio(options);
    dio.interceptors.addAll([
      authInterceptor,
      loggerInterceptor,
    ]);

    //dio for sweettracker
    final sweetTrackerDio = Dio(optionsSweettracker);
    sweetTrackerDio.interceptors.addAll([
      loggerInterceptor,
    ]);

    // sweettracker
    final SweetTrackerController sweetTrackerController =
        SweetTrackerControllerImpl(dio: sweetTrackerDio);

    // auth
    final AuthDataSource authDataSource = AuthDataSource(dio);
    final AuthController authController =
        AuthControllerImpl(authDataSource: authDataSource);

    // user
    final UserDataSource userDataSource = UserDataSource(dio);
    final UserController userController =
        UserControllerImpl(userDataSource: userDataSource);

    // category
    final CategoryDataSource categoryDataSource = CategoryDataSource(dio);
    final CategoryController categoryController =
        CategoryControllerImpl(categoryDataSource: categoryDataSource);

    // file
    final FileDataSource fileDataSource = FileDataSource(dio);
    final FileController fileController =
        FileControllerImpl(fileDataSource: fileDataSource, dio: dio);

    // main page
    final MainPageDataSource mainPageDataSource = MainPageDataSource(dio);
    final MainPageController mainPageController =
        MainPageControllerImpl(mainPageDataSource: mainPageDataSource);

    // post comment
    final PostCommentDataSource postCommentDataSource =
        PostCommentDataSource(dio);
    final PostCommentController postCommentController =
        PostCommentControllerImpl(postCommentDataSource: postCommentDataSource);

    // post community
    final PostCommunityDataSource postCommunityDataSource =
        PostCommunityDataSource(dio);
    final PostCommunityController postCommunityController =
        PostCommunityControllerImpl(
            postCommunityDataSource: postCommunityDataSource);

    // post curator
    final PostCuratorDataSource postCuratorDataSource =
        PostCuratorDataSource(dio);
    final PostCuratorController postCuratorController =
        PostCuratorControllerImpl(postCuratorDataSource: postCuratorDataSource);

    // post sgm news
    final PostSgmNewsDataSource postSgmNewsDataSource =
        PostSgmNewsDataSource(dio);
    final PostSgmNewsController postSgmNewsController =
        PostSgmNewsControllerImpl(postSgmNewsDataSource: postSgmNewsDataSource);

    // product
    final ProductDataSource productDataSource = ProductDataSource(dio);
    final ProductController productController =
        ProductControllerImpl(productDataSource: productDataSource);

    // qa
    final QADataSource qaDataSource = QADataSource(dio);
    final QAController qaController =
        QAControllerImpl(qaDataSource: qaDataSource);

    // rating
    final RatingDataSource ratingDataSource = RatingDataSource(dio);
    final RatingController ratingController =
        RatingControllerImpl(ratingDataSource: ratingDataSource);

    // social media
    final SocialMediaDataSource socialMediaDataSource =
        SocialMediaDataSource(dio);
    final SocialMediaController socialMediaController =
        SocialMediaControllerImpl(socialMediaDataSource: socialMediaDataSource);

    // user address
    final UserAddressDataSource userAddressDataSource =
        UserAddressDataSource(dio);
    final UserAddressController userAddressController =
        UserAddressControllerImpl(userAddressDataSource: userAddressDataSource);

    // user cart
    final UserCartDataSource userCartDataSource = UserCartDataSource(dio);
    final UserCartController userCartController =
        UserCartControllerImpl(userCartDataSource: userCartDataSource);

    // user favorite category
    final UserFavoriteCategoryDataSource userFavoriteCategoryDataSource =
        UserFavoriteCategoryDataSource(dio);
    final UserFavoriteCategoryController userFavoriteCategoryController =
        UserFavoriteCategoryControllerImpl(
            userFavoriteCategoryDataSource: userFavoriteCategoryDataSource);

    // user order
    final UserOrderDataSource userOrderDataSource = UserOrderDataSource(dio);
    final UserOrderController userOrderController =
        UserOrderControllerImpl(userOrderDataSource: userOrderDataSource);

    // profile url
    final ProfileUrlDataSource profileUrlDataSource = ProfileUrlDataSource(dio);
    final ProfileUrlController profileUrlController =
        ProfileUrlControllerImpl(profileUrlDataSource: profileUrlDataSource);

    // user follow
    final UserFollowDataSource userFollowDataSource = UserFollowDataSource(dio);
    final UserFollowController userFollowController =
        UserFollowControllerImpl(userFollowDataSource: userFollowDataSource);

    // user order session
    final UserOrderSessionDataSource userOrderSessionDataSource =
        UserOrderSessionDataSource(dio);
    final UserOrderSessionController userOrderSessionController =
        UserOrderSessionControllerImpl(
            userOrderSessionDataSource: userOrderSessionDataSource);

    // user post reaction
    final UserPostReactionDataSource userPostReactionDataSource =
        UserPostReactionDataSource(dio);
    final UserPostReactionController userPostReactionController =
        UserPostReactionControllerImpl(
            userPostReactionDataSource: userPostReactionDataSource);

    // app
    final AppUsernameService appUsernameService =
        AppUsernameServiceImpl(preferences: sharedPrefs);
    final AppTermAndCondStatusService termAndCondStatusService =
        AppTermAndCondStatusServiceImpl(sharedPrefs);
    final SearchHistoryService searchHistoryService =
        SearchHistoryServiceImpl(prefs: sharedPrefs);
    final PostManager postManager = PostManagerImpl(prefs: sharedPrefs);

    //admin post curator
    final AdminPostCuratorDataSource adminPostCuratorDataSource =
        AdminPostCuratorDataSource(dio);
    final AdminPostCuratorController adminPostCuratorController =
        AdminPostCuratorControllerImpl(
            adminPostCuratorDataSource: adminPostCuratorDataSource);

    //admin post sgm news
    final AdminPostSgmNewsDataSource adminPostSgmNewsDataSource =
        AdminPostSgmNewsDataSource(dio);
    final AdminPostSgmNewsController adminPostSgmNewsController =
        AdminPostSgmNewsControllerImpl(
            adminPostSgmNewsDataSource: adminPostSgmNewsDataSource);

    // term and condition
    final TermAndCondDataSource termAndCondDataSource =
        TermAndCondDataSource(dio);
    final TermAndCondController termAndCondController =
        TermAndCondControllerImpl(termAndCondDataSource: termAndCondDataSource);

    // dio for youtube client
    final Dio externalYoutubeDio = Dio(options);
    externalYoutubeDio.interceptors.addAll([
      loggerInterceptor,
    ]);
    final YoutubeDataSource youtubeDataSource =
        YoutubeDataSource(externalYoutubeDio);
    final YoutubeClientService youtubeClientService = YoutubeClientServiceImpl(
      youtubeDataSource: youtubeDataSource,
      apiKey: appConfig.youtubeApiKey,
      channelPlayListId: appConfig.youtubePlayListId,
    );

    final YoutubeControllerDataSource youtubeControllerDataSource =
        YoutubeControllerDataSource(dio);
    final YoutubeVideoController youtubeVideoController =
        YoutubeVideoControllerImpl(dataSource: youtubeControllerDataSource);

    // locale service
    final LocaleService localeService =
        LocaleServiceImpl(sharedPreferences: sharedPrefs);

    // stats
    final StatsDataSource statsDataSource = StatsDataSource(dio);
    final StatsController statsController =
        StatsControllerImpl(statsDataSource: statsDataSource);

    // result
    return AppDIData(
        localeService: localeService,
        youtubeClientService: youtubeClientService,
        refreshTokenManager: refreshTokenManager,
        authController: authController,
        config: appConfig,
        tokenService: tokenService,
        fileController: fileController,
        userController: userController,
        categoryController: categoryController,
        appUsernameService: appUsernameService,
        termAndCondStatusService: termAndCondStatusService,
        mainPageController: mainPageController,
        postCommentController: postCommentController,
        postCommunityController: postCommunityController,
        postCuratorController: postCuratorController,
        postSgmNewsController: postSgmNewsController,
        productController: productController,
        qaController: qaController,
        ratingController: ratingController,
        socialMediaController: socialMediaController,
        userAddressController: userAddressController,
        userCartController: userCartController,
        profileUrlController: profileUrlController,
        userFollowController: userFollowController,
        userFavoriteCategoryController: userFavoriteCategoryController,
        userOrderController: userOrderController,
        userOrderSessionController: userOrderSessionController,
        userPostReactionController: userPostReactionController,
        searchHistoryService: searchHistoryService,
        adminPostCuratorController: adminPostCuratorController,
        adminPostSgmNewsController: adminPostSgmNewsController,
        postManager: postManager,
        statsController: statsController,
        youtubeVideoController: youtubeVideoController,
        sweetTrackerController: sweetTrackerController,
        termAndCondController: termAndCondController);
  }
}
