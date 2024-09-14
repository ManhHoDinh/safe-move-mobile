import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/services/category/category.dart';
import '../../../../application/services/user_order/user_order.dart';
import '../../../shared/base_infinite_loading/example.dart';
import '../../../shared/widgets/cart_sheet/cart_sheet.dart';
import '../../../shared/widgets/dialogs/dialogs.dart';
import '../../../shared/widgets/drop_down_bar/drop_down_bar.dart';
import '../../../shared/widgets/drop_down_bar/widgets/drop_down_sheet.dart';
import '../../../shared/widgets/image_picker_sheet/image_picker_sheet.dart';
import '../../../ui/address_managent_screen/address_management_screen.dart';
import '../../../ui/business_card_details_screen/business_card_details_screen.dart';
import '../../../ui/community_screen/widgets/community_filter_sheet.dart';
import '../../../ui/create_post_screen/create_post_screen.dart';
import '../../../ui/create_post_screen/widgets/post_language_sheet.dart';
import '../../../ui/main_screen/main_screen.dart';
import '../../../ui/payment_screen/payment_screen.dart';
import '../../../ui/splash_screen/splash_screen.dart';
import '../../../ui/store_screen/widgets/product_category_filter_sheet.dart';
import '../../../ui/term_and_cond_accept_screen/term_and_cond_accept_screen.dart';
import '../../../ui/term_and_cond_accept_screen/term_and_cond_content.dart';
import '../../../ui/user_info_supplement_screen/user_info_supplement_screen.dart';
import '../../app_nav_key/app_nav_key.dart';
import '../routes/news_branch/news_branch.dart';
import '../routes/routes.dart';

part 'routes_gen.g.dart';

@TypedGoRoute<SplashRoute>(
  path: SplashRoute.routeName,
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const routeName = '/splash';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SplashScreen.buildPage(context, state);
  }
}

@TypedGoRoute<AlertRouteData>(
  path: AlertRouteData.routeName,
)
class AlertRouteData extends GoRouteData {
  const AlertRouteData({
    this.title,
    required this.content,
    this.acceptTitle,
  });

  static const routeName = '/alert';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  final String? title;
  final String content;
  final String? acceptTitle;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AppAlertDialog.buildPage(
      context,
      key: state.pageKey,
      content: content,
      acceptTitle: acceptTitle,
      title: title,
    );
  }
}

@TypedGoRoute<ConfirmRouteData>(
  path: ConfirmRouteData.routeName,
)
class ConfirmRouteData extends GoRouteData {
  const ConfirmRouteData({
    this.title,
    required this.content,
    this.acceptTitle,
    this.rejectTitle,
  });

  static const routeName = '/confirm';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  final String? title;
  final String content;
  final String? acceptTitle;
  final String? rejectTitle;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AppConfirmDialog.buildPage(
      context,
      key: state.pageKey,
      content: content,
      acceptTitle: acceptTitle,
      title: title,
      rejectTitle: rejectTitle,
    );
  }
}

@TypedGoRoute<ImagePickerRouteData>(
  path: ImagePickerRouteData.routeName,
)
class ImagePickerRouteData extends GoRouteData {
  const ImagePickerRouteData({this.isMultiple = false});

  static const routeName = '/image-picker';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  final bool isMultiple;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ImagePickerSheet.buildPage(context,
        key: state.pageKey, isMultiple: isMultiple);
  }
}

@TypedGoRoute<DropdownSheetRouteData>(
  path: DropdownSheetRouteData.routeName,
)
class DropdownSheetRouteData extends GoRouteData {
  const DropdownSheetRouteData({this.$extra = const []});

  final List<DropDownBarData<dynamic>> $extra;

  static const routeName = '/dropdown-sheet';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return DropdownSheet.buildPage(
      context,
      key: state.pageKey,
      items: $extra,
    );
  }
}

@TypedGoRoute<TermAndCondAcceptRouteData>(
  path: TermAndCondAcceptRouteData.routeName,
  routes: [
    TypedGoRoute<TermAndPolicyContentDetailsRouteData>(
      path: TermAndPolicyContentDetailsRouteData.routeName,
    ),
  ],
)
class TermAndCondAcceptRouteData extends GoRouteData {
  const TermAndCondAcceptRouteData({this.type});

  static const routeName = '/term-and-cond-accept';

  final int? type; //0: register, 1: login miss information
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TermAndCondAcceptScreen(
      type: type,
    );
  }
}

class TermAndPolicyContentDetailsRouteData extends GoRouteData {
  const TermAndPolicyContentDetailsRouteData({required this.type});

  final TermAndCondType type;

  static const routeName = 'term-and-cond-accept-content';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TermAndPolicyContentScreen(type: type);
  }
}

@TypedGoRoute<CreatePostRouteData>(
  path: CreatePostRouteData.routeName,
)
class CreatePostRouteData extends GoRouteData {
  const CreatePostRouteData({
    required this.categoryType,
  });

  final CategoryType categoryType;

  static const routeName = '/create-post/:categoryType';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreatePostScreen(categoryType: categoryType);
  }
}

@TypedGoRoute<PaymentRouteData>(
  path: PaymentRouteData.routeName,
)
class PaymentRouteData extends GoRouteData {
  const PaymentRouteData({
    required this.amount,
    required this.orderSessionId,
  });

  final double amount;
  final int orderSessionId;

  static const routeName = '/payment';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PaymentScreen(
      amount: amount,
      orderSessionId: orderSessionId,
    );
  }
}

@TypedGoRoute<EditPostRouteData>(
  path: EditPostRouteData.routeName,
)
class EditPostRouteData extends GoRouteData {
  const EditPostRouteData({
    required this.categoryType,
    required this.postId,
  });

  final int postId;
  final CategoryType categoryType;

  static const routeName = '/edit-post/:postId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreatePostScreen(categoryType: categoryType, postId: postId);
  }
}

@TypedGoRoute<BusinessCardDetailsRouteData>(
  path: BusinessCardDetailsRouteData.routeName,
)
class BusinessCardDetailsRouteData extends GoRouteData {
  const BusinessCardDetailsRouteData(this.userId);

  final int userId;

  static const routeName = '/business-card-details/:userId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BusinessCardDetailsScreen(userId: userId);
  }
}

class UserInfoSupplementRouteData extends GoRouteData {
  const UserInfoSupplementRouteData();

  static const routeName = 'user-info-supplement';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserInfoSupplementScreen();
  }
}

@TypedShellRoute<MainShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRouteData>(
      path: HomeRouteData.routeName,
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<DrawerRouteData>(
          path: DrawerRouteData.routeName,
        ),
        TypedGoRoute<NotificationRouteData>(
          path: NotificationRouteData.routeName,
        ),
        TypedGoRoute<HomeLoginRouteData>(
          path: HomeLoginRouteData.routeName,
        ),
      ],
    ),
    TypedGoRoute<CommunityRouteData>(
      path: CommunityRouteData.routeName,
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CommunityCategoriesRouteData>(
          path: CommunityCategoriesRouteData.routeName,
        ),
        TypedGoRoute<PostLanguageRouteData>(
          path: PostLanguageRouteData.routeName,
        ),
        TypedGoRoute<CommunityPostDetailRouteData>(
          path: CommunityPostDetailRouteData.routeName,
        ),
      ],
    ),
    TypedGoRoute<CuratorRouteData>(
      path: CuratorRouteData.routeName,
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CuratorPostDetailRouteData>(
          path: CuratorPostDetailRouteData.routeName,
        ),
      ],
    ),
    TypedGoRoute<NewsRouteData>(
      path: NewsRouteData.routeName,
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<NewsPostDetailRouteData>(
          path: NewsPostDetailRouteData.routeName,
        ),
        TypedGoRoute<YoutubePostDetailRouteData>(
          path: YoutubePostDetailRouteData.routeName,
        ),
      ],
    ),
    TypedGoRoute<StoreRouteData>(
      path: StoreRouteData.routeName,
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PaymentSuccessRouteData>(
          path: PaymentSuccessRouteData.routeName,
        ),
        TypedGoRoute<PaymentFailedRouteData>(
          path: PaymentFailedRouteData.routeName,
        ),
        TypedGoRoute<CartRouteData>(
          path: CartRouteData.routeName,
        ),
        TypedGoRoute<NewOrderDetailsRouteData>(
          path: NewOrderDetailsRouteData.routeName,
        ),
        TypedGoRoute<ProductCategoriesRouteData>(
          path: ProductCategoriesRouteData.routeName,
        ),
        TypedGoRoute<ProductDetailsRouteData>(
          path: ProductDetailsRouteData.routeName,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<CartSheetRouteData>(
              path: CartSheetRouteData.routeName,
            ),
            TypedGoRoute<ComposeReviewRouteData>(
              path: ComposeReviewRouteData.routeName,
            ),
            TypedGoRoute<ComposeQARouteData>(
              path: ComposeQARouteData.routeName,
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<ProfileRouteData>(
      path: ProfileRouteData.routeName,
      routes: [
        TypedGoRoute<UserInfoSupplementRouteData>(
          path: UserInfoSupplementRouteData.routeName,
        ),
        TypedGoRoute<InquiryHistoryRouteData>(
          path: InquiryHistoryRouteData.routeName,
        ),
        TypedGoRoute<AddressAddRouteData>(path: AddressAddRouteData.routeName),
        TypedGoRoute<SearchAddressRouteData>(
          path: SearchAddressRouteData.routeName,
        ),
        TypedGoRoute<AddressEditRouteData>(
            path: AddressEditRouteData.routeName),
        TypedGoRoute<AddressRouteData>(
          path: AddressRouteData.routeName,
        ),
        TypedGoRoute<ProfileLoginRouteData>(
            path: ProfileLoginRouteData.routeName,
            routes: [
              TypedGoRoute<RegisterRouteData>(
                  path: RegisterRouteData.routeName),
              TypedGoRoute<FindIdRouteData>(path: FindIdRouteData.routeName),
              TypedGoRoute<ResetPasswordRouteData>(
                  path: ResetPasswordRouteData.routeName),
            ]),
        TypedGoRoute<FollowManagementRouteData>(
            path: FollowManagementRouteData.routeName),
        TypedGoRoute<ReferralRouteData>(
          path: ReferralRouteData.routeName,
        ),
        TypedGoRoute<FavoritesBulletinBoardRouteData>(
            path: FavoritesBulletinBoardRouteData.routeName),
        TypedGoRoute<CheckOrderDeliveryDetailRouteData>(
            path: CheckOrderDeliveryDetailRouteData.routeName,
            routes: [
              TypedGoRoute<OldOrderDetailsRouteData>(
                  path: OldOrderDetailsRouteData.routeName),
              TypedGoRoute<ProductListSheetRouteData>(
                path: ProductListSheetRouteData.routeName,
              ),
              TypedGoRoute<DeliveryStatusRouteData>(
                path: DeliveryStatusRouteData.routeName,
              ),
            ]),
        TypedGoRoute<CommunityActivitiesRouteData>(
            path: CommunityActivitiesRouteData.routeName),
        TypedGoRoute<ReportedRouteData>(path: ReportedRouteData.routeName),
        TypedGoRoute<BusinessCardEditRouteData>(
          path: BusinessCardEditRouteData.routeName,
          routes: [
            TypedGoRoute<SelectImageRouteData>(
                path: SelectImageRouteData.routeName)
          ],
        ),
        TypedGoRoute<CuratorActivitiesRouteData>(
            path: CuratorActivitiesRouteData.routeName),
        TypedGoRoute<ProfileDetailsRouteData>(
            path: ProfileDetailsRouteData.routeName),
        TypedGoRoute<SettingRouteData>(
          path: SettingRouteData.routeName,
          routes: [
            TypedGoRoute<AccountInformationManagementRouteData>(
                path: AccountInformationManagementRouteData.routeName,
                routes: [
                  TypedGoRoute<EditAccountInformationRouteData>(
                      path: EditAccountInformationRouteData.routeName,
                      routes: [
                        TypedGoRoute<ChangePhoneNumberRouteData>(
                            path: ChangePhoneNumberRouteData.routeName),
                        TypedGoRoute<ChangePasswordRouteData>(
                            path: ChangePasswordRouteData.routeName)
                      ])
                ]),
            TypedGoRoute<NotificationSettingRouteData>(
                path: NotificationSettingRouteData.routeName),
            TypedGoRoute<PolicyAndTermConditionsRouteData>(
                path: PolicyAndTermConditionsRouteData.routeName),
          ],
        )
      ],
    ),
  ],
)
class MainShellRouteData extends ShellRouteData {
  const MainShellRouteData();

  @override
  Page<void> pageBuilder(
      BuildContext context, GoRouterState state, Widget navigator) {
    return MainScreen.buildPage(context, state, navigator);
  }
}

@TypedGoRoute<TestLoadingRouteData>(
  path: TestLoadingRouteData.routeName,
)
class TestLoadingRouteData extends GoRouteData {
  const TestLoadingRouteData();

  static const routeName = '/test-infinite-loading';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TestInfiniteLoadingScreen();
  }
}
