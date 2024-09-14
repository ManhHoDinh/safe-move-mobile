// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_gen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $alertRouteData,
      $confirmRouteData,
      $imagePickerRouteData,
      $dropdownSheetRouteData,
      $termAndCondAcceptRouteData,
      $createPostRouteData,
      $paymentRouteData,
      $editPostRouteData,
      $businessCardDetailsRouteData,
      $mainShellRouteData,
      $testLoadingRouteData,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $alertRouteData => GoRouteData.$route(
      path: '/alert',
      parentNavigatorKey: AlertRouteData.$parentNavigatorKey,
      factory: $AlertRouteDataExtension._fromState,
    );

extension $AlertRouteDataExtension on AlertRouteData {
  static AlertRouteData _fromState(GoRouterState state) => AlertRouteData(
        title: state.uri.queryParameters['title'],
        content: state.uri.queryParameters['content']!,
        acceptTitle: state.uri.queryParameters['accept-title'],
      );

  String get location => GoRouteData.$location(
        '/alert',
        queryParams: {
          if (title != null) 'title': title,
          'content': content,
          if (acceptTitle != null) 'accept-title': acceptTitle,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $confirmRouteData => GoRouteData.$route(
      path: '/confirm',
      parentNavigatorKey: ConfirmRouteData.$parentNavigatorKey,
      factory: $ConfirmRouteDataExtension._fromState,
    );

extension $ConfirmRouteDataExtension on ConfirmRouteData {
  static ConfirmRouteData _fromState(GoRouterState state) => ConfirmRouteData(
        title: state.uri.queryParameters['title'],
        content: state.uri.queryParameters['content']!,
        acceptTitle: state.uri.queryParameters['accept-title'],
        rejectTitle: state.uri.queryParameters['reject-title'],
      );

  String get location => GoRouteData.$location(
        '/confirm',
        queryParams: {
          if (title != null) 'title': title,
          'content': content,
          if (acceptTitle != null) 'accept-title': acceptTitle,
          if (rejectTitle != null) 'reject-title': rejectTitle,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $imagePickerRouteData => GoRouteData.$route(
      path: '/image-picker',
      parentNavigatorKey: ImagePickerRouteData.$parentNavigatorKey,
      factory: $ImagePickerRouteDataExtension._fromState,
    );

extension $ImagePickerRouteDataExtension on ImagePickerRouteData {
  static ImagePickerRouteData _fromState(GoRouterState state) =>
      ImagePickerRouteData(
        isMultiple: _$convertMapValue(
                'is-multiple', state.uri.queryParameters, _$boolConverter) ??
            false,
      );

  String get location => GoRouteData.$location(
        '/image-picker',
        queryParams: {
          if (isMultiple != false) 'is-multiple': isMultiple.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $dropdownSheetRouteData => GoRouteData.$route(
      path: '/dropdown-sheet',
      parentNavigatorKey: DropdownSheetRouteData.$parentNavigatorKey,
      factory: $DropdownSheetRouteDataExtension._fromState,
    );

extension $DropdownSheetRouteDataExtension on DropdownSheetRouteData {
  static DropdownSheetRouteData _fromState(GoRouterState state) =>
      DropdownSheetRouteData(
        $extra: state.extra as List<DropDownBarData<dynamic>>,
      );

  String get location => GoRouteData.$location(
        '/dropdown-sheet',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $termAndCondAcceptRouteData => GoRouteData.$route(
      path: '/term-and-cond-accept',
      factory: $TermAndCondAcceptRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'term-and-cond-accept-content',
          factory: $TermAndPolicyContentDetailsRouteDataExtension._fromState,
        ),
      ],
    );

extension $TermAndCondAcceptRouteDataExtension on TermAndCondAcceptRouteData {
  static TermAndCondAcceptRouteData _fromState(GoRouterState state) {
    // Assuming you have logic to extract the type from the state
    // You'll need to replace `null` with actual extraction logic.
    final int? type = null; // Extract the type from state if needed
    return TermAndCondAcceptRouteData(type: type);
  }

  String get location => GoRouteData.$location(
        TermAndCondAcceptRouteData.routeName,
      );

  void go(BuildContext context) => context.go(location, extra: this);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);

  void replace(BuildContext context) => context.replace(location, extra: this);
}

extension $TermAndPolicyContentDetailsRouteDataExtension
    on TermAndPolicyContentDetailsRouteData {
  static TermAndPolicyContentDetailsRouteData _fromState(GoRouterState state) =>
      TermAndPolicyContentDetailsRouteData(
        type: _$TermAndCondTypeEnumMap
            ._$fromName(state.uri.queryParameters['type']!),
      );

  String get location => GoRouteData.$location(
        '/term-and-cond-accept/term-and-cond-accept-content',
        queryParams: {
          'type': _$TermAndCondTypeEnumMap[type],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$TermAndCondTypeEnumMap = {
  TermAndCondType.policy: 'policy',
  TermAndCondType.term: 'term',
  TermAndCondType.mail: 'mail'
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $createPostRouteData => GoRouteData.$route(
      path: '/create-post/:categoryType',
      parentNavigatorKey: CreatePostRouteData.$parentNavigatorKey,
      factory: $CreatePostRouteDataExtension._fromState,
    );

extension $CreatePostRouteDataExtension on CreatePostRouteData {
  static CreatePostRouteData _fromState(GoRouterState state) =>
      CreatePostRouteData(
        categoryType: _$CategoryTypeEnumMap
            ._$fromName(state.pathParameters['categoryType']!),
      );

  String get location => GoRouteData.$location(
        '/create-post/${Uri.encodeComponent(_$CategoryTypeEnumMap[categoryType]!)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$CategoryTypeEnumMap = {
  CategoryType.community: 'community',
  CategoryType.curator: 'curator',
  CategoryType.sgmNews: 'sgm-news',
  CategoryType.store: 'store',
};

RouteBase get $paymentRouteData => GoRouteData.$route(
      path: '/payment',
      parentNavigatorKey: PaymentRouteData.$parentNavigatorKey,
      factory: $PaymentRouteDataExtension._fromState,
    );

extension $PaymentRouteDataExtension on PaymentRouteData {
  static PaymentRouteData _fromState(GoRouterState state) => PaymentRouteData(
        amount: double.parse(state.uri.queryParameters['amount']!),
        orderSessionId:
            int.parse(state.uri.queryParameters['order-session-id']!),
      );

  String get location => GoRouteData.$location(
        '/payment',
        queryParams: {
          'amount': amount.toString(),
          'order-session-id': orderSessionId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editPostRouteData => GoRouteData.$route(
      path: '/edit-post/:postId',
      parentNavigatorKey: EditPostRouteData.$parentNavigatorKey,
      factory: $EditPostRouteDataExtension._fromState,
    );

extension $EditPostRouteDataExtension on EditPostRouteData {
  static EditPostRouteData _fromState(GoRouterState state) => EditPostRouteData(
        postId: int.parse(state.pathParameters['postId']!),
        categoryType: _$CategoryTypeEnumMap
            ._$fromName(state.uri.queryParameters['category-type']!),
      );

  String get location => GoRouteData.$location(
        '/edit-post/${Uri.encodeComponent(postId.toString())}',
        queryParams: {
          'category-type': _$CategoryTypeEnumMap[categoryType],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $businessCardDetailsRouteData => GoRouteData.$route(
      path: '/business-card-details/:userId',
      parentNavigatorKey: BusinessCardDetailsRouteData.$parentNavigatorKey,
      factory: $BusinessCardDetailsRouteDataExtension._fromState,
    );

extension $BusinessCardDetailsRouteDataExtension
    on BusinessCardDetailsRouteData {
  static BusinessCardDetailsRouteData _fromState(GoRouterState state) =>
      BusinessCardDetailsRouteData(
        int.parse(state.pathParameters['userId']!),
      );

  String get location => GoRouteData.$location(
        '/business-card-details/${Uri.encodeComponent(userId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainShellRouteData => ShellRouteData.$route(
      factory: $MainShellRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/home',
          factory: $HomeRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'drawer',
              parentNavigatorKey: DrawerRouteData.$parentNavigatorKey,
              factory: $DrawerRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'notification',
              parentNavigatorKey: NotificationRouteData.$parentNavigatorKey,
              factory: $NotificationRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'login',
              parentNavigatorKey: HomeLoginRouteData.$parentNavigatorKey,
              factory: $HomeLoginRouteDataExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/community',
          factory: $CommunityRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'categories',
              parentNavigatorKey:
                  CommunityCategoriesRouteData.$parentNavigatorKey,
              factory: $CommunityCategoriesRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'languages',
              parentNavigatorKey: PostLanguageRouteData.$parentNavigatorKey,
              factory: $PostLanguageRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'detail/:postId',
              parentNavigatorKey:
                  CommunityPostDetailRouteData.$parentNavigatorKey,
              factory: $CommunityPostDetailRouteDataExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/curator',
          factory: $CuratorRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail/:postId',
              parentNavigatorKey:
                  CuratorPostDetailRouteData.$parentNavigatorKey,
              factory: $CuratorPostDetailRouteDataExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/news',
          factory: $NewsRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail/:postId',
              parentNavigatorKey: NewsPostDetailRouteData.$parentNavigatorKey,
              factory: $NewsPostDetailRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'youtube/:postId',
              parentNavigatorKey:
                  YoutubePostDetailRouteData.$parentNavigatorKey,
              factory: $YoutubePostDetailRouteDataExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/store',
          factory: $StoreRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'payment-success',
              parentNavigatorKey: PaymentSuccessRouteData.$parentNavigatorKey,
              factory: $PaymentSuccessRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'payment-failed',
              parentNavigatorKey: PaymentFailedRouteData.$parentNavigatorKey,
              factory: $PaymentFailedRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'cart',
              parentNavigatorKey: CartRouteData.$parentNavigatorKey,
              factory: $CartRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'new-order',
              parentNavigatorKey: NewOrderDetailsRouteData.$parentNavigatorKey,
              factory: $NewOrderDetailsRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'categories',
              parentNavigatorKey:
                  ProductCategoriesRouteData.$parentNavigatorKey,
              factory: $ProductCategoriesRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':productId',
              parentNavigatorKey: ProductDetailsRouteData.$parentNavigatorKey,
              factory: $ProductDetailsRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'cart-sheet',
                  parentNavigatorKey: CartSheetRouteData.$parentNavigatorKey,
                  factory: $CartSheetRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'review',
                  parentNavigatorKey:
                      ComposeReviewRouteData.$parentNavigatorKey,
                  factory: $ComposeReviewRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'qa',
                  parentNavigatorKey: ComposeQARouteData.$parentNavigatorKey,
                  factory: $ComposeQARouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/profile',
          factory: $ProfileRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'user-info-supplement',
              parentNavigatorKey:
                  UserInfoSupplementRouteData.$parentNavigatorKey,
              factory: $UserInfoSupplementRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'inquiry-history',
              parentNavigatorKey: InquiryHistoryRouteData.$parentNavigatorKey,
              factory: $InquiryHistoryRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'address-add',
              parentNavigatorKey: AddressAddRouteData.$parentNavigatorKey,
              factory: $AddressAddRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'search-address',
              parentNavigatorKey: SearchAddressRouteData.$parentNavigatorKey,
              factory: $SearchAddressRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'address-edit/:addressId',
              parentNavigatorKey: AddressEditRouteData.$parentNavigatorKey,
              factory: $AddressEditRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'address',
              parentNavigatorKey: AddressRouteData.$parentNavigatorKey,
              factory: $AddressRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'login',
              parentNavigatorKey: ProfileLoginRouteData.$parentNavigatorKey,
              factory: $ProfileLoginRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'register',
                  parentNavigatorKey: RegisterRouteData.$parentNavigatorKey,
                  factory: $RegisterRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'find-id',
                  parentNavigatorKey: FindIdRouteData.$parentNavigatorKey,
                  factory: $FindIdRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'reset-password',
                  parentNavigatorKey:
                      ResetPasswordRouteData.$parentNavigatorKey,
                  factory: $ResetPasswordRouteDataExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'follow-management',
              parentNavigatorKey: FollowManagementRouteData.$parentNavigatorKey,
              factory: $FollowManagementRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'referral',
              parentNavigatorKey: ReferralRouteData.$parentNavigatorKey,
              factory: $ReferralRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'favorites-bulletin-board',
              parentNavigatorKey:
                  FavoritesBulletinBoardRouteData.$parentNavigatorKey,
              factory: $FavoritesBulletinBoardRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'check-order-delivery-detail',
              parentNavigatorKey:
                  CheckOrderDeliveryDetailRouteData.$parentNavigatorKey,
              factory: $CheckOrderDeliveryDetailRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'old-order-details/:orderId',
                  parentNavigatorKey:
                      OldOrderDetailsRouteData.$parentNavigatorKey,
                  factory: $OldOrderDetailsRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'product-list-sheet',
                  parentNavigatorKey:
                      ProductListSheetRouteData.$parentNavigatorKey,
                  factory: $ProductListSheetRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'delivery-status/:courierId/:trackingId',
                  parentNavigatorKey:
                      DeliveryStatusRouteData.$parentNavigatorKey,
                  factory: $DeliveryStatusRouteDataExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'community-activities',
              parentNavigatorKey:
                  CommunityActivitiesRouteData.$parentNavigatorKey,
              factory: $CommunityActivitiesRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'reported',
              parentNavigatorKey: ReportedRouteData.$parentNavigatorKey,
              factory: $ReportedRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'business-card-edit',
              parentNavigatorKey: BusinessCardEditRouteData.$parentNavigatorKey,
              factory: $BusinessCardEditRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'select-image',
                  parentNavigatorKey: SelectImageRouteData.$parentNavigatorKey,
                  factory: $SelectImageRouteDataExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'curator-activities',
              parentNavigatorKey:
                  CuratorActivitiesRouteData.$parentNavigatorKey,
              factory: $CuratorActivitiesRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':userId/details',
              parentNavigatorKey: ProfileDetailsRouteData.$parentNavigatorKey,
              factory: $ProfileDetailsRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'setting',
              parentNavigatorKey: SettingRouteData.$parentNavigatorKey,
              factory: $SettingRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'account-information-management',
                  parentNavigatorKey:
                      AccountInformationManagementRouteData.$parentNavigatorKey,
                  factory: $AccountInformationManagementRouteDataExtension
                      ._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'edit',
                      parentNavigatorKey:
                          EditAccountInformationRouteData.$parentNavigatorKey,
                      factory:
                          $EditAccountInformationRouteDataExtension._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: 'change-phone-number',
                          parentNavigatorKey:
                              ChangePhoneNumberRouteData.$parentNavigatorKey,
                          factory:
                              $ChangePhoneNumberRouteDataExtension._fromState,
                        ),
                        GoRouteData.$route(
                          path: 'change-password',
                          parentNavigatorKey:
                              ChangePasswordRouteData.$parentNavigatorKey,
                          factory: $ChangePasswordRouteDataExtension._fromState,
                        ),
                      ],
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'notification-setting',
                  parentNavigatorKey:
                      NotificationSettingRouteData.$parentNavigatorKey,
                  factory: $NotificationSettingRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'policy-and-term-conditions',
                  parentNavigatorKey:
                      PolicyAndTermConditionsRouteData.$parentNavigatorKey,
                  factory:
                      $PolicyAndTermConditionsRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DrawerRouteDataExtension on DrawerRouteData {
  static DrawerRouteData _fromState(GoRouterState state) =>
      const DrawerRouteData();

  String get location => GoRouteData.$location(
        '/home/drawer',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationRouteDataExtension on NotificationRouteData {
  static NotificationRouteData _fromState(GoRouterState state) =>
      const NotificationRouteData();

  String get location => GoRouteData.$location(
        '/home/notification',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeLoginRouteDataExtension on HomeLoginRouteData {
  static HomeLoginRouteData _fromState(GoRouterState state) =>
      HomeLoginRouteData(
        redirectUrl: state.uri.queryParameters['redirect-url'],
      );

  String get location => GoRouteData.$location(
        '/home/login',
        queryParams: {
          if (redirectUrl != null) 'redirect-url': redirectUrl,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CommunityRouteDataExtension on CommunityRouteData {
  static CommunityRouteData _fromState(GoRouterState state) =>
      CommunityRouteData(
        preSelectedChildId: _$convertMapValue(
            'pre-selected-child-id', state.uri.queryParameters, int.parse),
        preSelectedParentId: _$convertMapValue(
            'pre-selected-parent-id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/community',
        queryParams: {
          if (preSelectedChildId != null)
            'pre-selected-child-id': preSelectedChildId!.toString(),
          if (preSelectedParentId != null)
            'pre-selected-parent-id': preSelectedParentId!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CommunityCategoriesRouteDataExtension
    on CommunityCategoriesRouteData {
  static CommunityCategoriesRouteData _fromState(GoRouterState state) =>
      CommunityCategoriesRouteData(
        $extra: state.extra as List<CommunityCategoryItem>,
      );

  String get location => GoRouteData.$location(
        '/community/categories',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $PostLanguageRouteDataExtension on PostLanguageRouteData {
  static PostLanguageRouteData _fromState(GoRouterState state) =>
      PostLanguageRouteData(
        $extra: state.extra as List<LanguageItem>,
      );

  String get location => GoRouteData.$location(
        '/community/languages',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $CommunityPostDetailRouteDataExtension
    on CommunityPostDetailRouteData {
  static CommunityPostDetailRouteData _fromState(GoRouterState state) =>
      CommunityPostDetailRouteData(
        postId: int.parse(state.pathParameters['postId']!),
      );

  String get location => GoRouteData.$location(
        '/community/detail/${Uri.encodeComponent(postId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CuratorRouteDataExtension on CuratorRouteData {
  static CuratorRouteData _fromState(GoRouterState state) => CuratorRouteData(
        preSelectedParentId: _$convertMapValue(
            'pre-selected-parent-id', state.uri.queryParameters, int.parse),
        preSelectedChildId: _$convertMapValue(
            'pre-selected-child-id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/curator',
        queryParams: {
          if (preSelectedParentId != null)
            'pre-selected-parent-id': preSelectedParentId!.toString(),
          if (preSelectedChildId != null)
            'pre-selected-child-id': preSelectedChildId!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CuratorPostDetailRouteDataExtension on CuratorPostDetailRouteData {
  static CuratorPostDetailRouteData _fromState(GoRouterState state) =>
      CuratorPostDetailRouteData(
        postId: int.parse(state.pathParameters['postId']!),
      );

  String get location => GoRouteData.$location(
        '/curator/detail/${Uri.encodeComponent(postId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewsRouteDataExtension on NewsRouteData {
  static NewsRouteData _fromState(GoRouterState state) => const NewsRouteData();

  String get location => GoRouteData.$location(
        '/news',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewsPostDetailRouteDataExtension on NewsPostDetailRouteData {
  static NewsPostDetailRouteData _fromState(GoRouterState state) =>
      NewsPostDetailRouteData(
        postId: int.parse(state.pathParameters['postId']!),
      );

  String get location => GoRouteData.$location(
        '/news/detail/${Uri.encodeComponent(postId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $YoutubePostDetailRouteDataExtension on YoutubePostDetailRouteData {
  static YoutubePostDetailRouteData _fromState(GoRouterState state) =>
      YoutubePostDetailRouteData(
        postId: int.parse(state.pathParameters['postId']!),
      );

  String get location => GoRouteData.$location(
        '/news/youtube/${Uri.encodeComponent(postId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StoreRouteDataExtension on StoreRouteData {
  static StoreRouteData _fromState(GoRouterState state) =>
      const StoreRouteData();

  String get location => GoRouteData.$location(
        '/store',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PaymentSuccessRouteDataExtension on PaymentSuccessRouteData {
  static PaymentSuccessRouteData _fromState(GoRouterState state) =>
      const PaymentSuccessRouteData();

  String get location => GoRouteData.$location(
        '/store/payment-success',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PaymentFailedRouteDataExtension on PaymentFailedRouteData {
  static PaymentFailedRouteData _fromState(GoRouterState state) =>
      const PaymentFailedRouteData();

  String get location => GoRouteData.$location(
        '/store/payment-failed',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CartRouteDataExtension on CartRouteData {
  static CartRouteData _fromState(GoRouterState state) => const CartRouteData();

  String get location => GoRouteData.$location(
        '/store/cart',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewOrderDetailsRouteDataExtension on NewOrderDetailsRouteData {
  static NewOrderDetailsRouteData _fromState(GoRouterState state) =>
      const NewOrderDetailsRouteData();

  String get location => GoRouteData.$location(
        '/store/new-order',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductCategoriesRouteDataExtension on ProductCategoriesRouteData {
  static ProductCategoriesRouteData _fromState(GoRouterState state) =>
      ProductCategoriesRouteData(
        $extra: state.extra as List<ProductCategoryItem>,
      );

  String get location => GoRouteData.$location(
        '/store/categories',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $ProductDetailsRouteDataExtension on ProductDetailsRouteData {
  static ProductDetailsRouteData _fromState(GoRouterState state) =>
      ProductDetailsRouteData(
        productId: int.parse(state.pathParameters['productId']!),
      );

  String get location => GoRouteData.$location(
        '/store/${Uri.encodeComponent(productId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CartSheetRouteDataExtension on CartSheetRouteData {
  static CartSheetRouteData _fromState(GoRouterState state) =>
      CartSheetRouteData(
        productId: int.parse(state.pathParameters['productId']!),
        $extra: state.extra as CartSheetItem,
      );

  String get location => GoRouteData.$location(
        '/store/${Uri.encodeComponent(productId.toString())}/cart-sheet',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $ComposeReviewRouteDataExtension on ComposeReviewRouteData {
  static ComposeReviewRouteData _fromState(GoRouterState state) =>
      ComposeReviewRouteData(
        productId: int.parse(state.pathParameters['productId']!),
      );

  String get location => GoRouteData.$location(
        '/store/${Uri.encodeComponent(productId.toString())}/review',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ComposeQARouteDataExtension on ComposeQARouteData {
  static ComposeQARouteData _fromState(GoRouterState state) =>
      ComposeQARouteData(
        productId: int.parse(state.pathParameters['productId']!),
      );

  String get location => GoRouteData.$location(
        '/store/${Uri.encodeComponent(productId.toString())}/qa',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteDataExtension on ProfileRouteData {
  static ProfileRouteData _fromState(GoRouterState state) =>
      const ProfileRouteData();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UserInfoSupplementRouteDataExtension on UserInfoSupplementRouteData {
  static UserInfoSupplementRouteData _fromState(GoRouterState state) =>
      const UserInfoSupplementRouteData();

  String get location => GoRouteData.$location(
        '/profile/user-info-supplement',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $InquiryHistoryRouteDataExtension on InquiryHistoryRouteData {
  static InquiryHistoryRouteData _fromState(GoRouterState state) =>
      const InquiryHistoryRouteData();

  String get location => GoRouteData.$location(
        '/profile/inquiry-history',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddressAddRouteDataExtension on AddressAddRouteData {
  static AddressAddRouteData _fromState(GoRouterState state) =>
      const AddressAddRouteData();

  String get location => GoRouteData.$location(
        '/profile/address-add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchAddressRouteDataExtension on SearchAddressRouteData {
  static SearchAddressRouteData _fromState(GoRouterState state) =>
      const SearchAddressRouteData();

  String get location => GoRouteData.$location(
        '/profile/search-address',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddressEditRouteDataExtension on AddressEditRouteData {
  static AddressEditRouteData _fromState(GoRouterState state) =>
      AddressEditRouteData(
        addressId: int.parse(state.pathParameters['addressId']!),
      );

  String get location => GoRouteData.$location(
        '/profile/address-edit/${Uri.encodeComponent(addressId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddressRouteDataExtension on AddressRouteData {
  static AddressRouteData _fromState(GoRouterState state) => AddressRouteData(
        addressId: _$convertMapValue(
            'address-id', state.uri.queryParameters, int.parse),
        addressType: _$AddressTypeEnumMap
            ._$fromName(state.uri.queryParameters['address-type']!),
      );

  String get location => GoRouteData.$location(
        '/profile/address',
        queryParams: {
          if (addressId != null) 'address-id': addressId!.toString(),
          'address-type': _$AddressTypeEnumMap[addressType],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$AddressTypeEnumMap = {
  AddressType.management: 'management',
  AddressType.selection: 'selection',
};

extension $ProfileLoginRouteDataExtension on ProfileLoginRouteData {
  static ProfileLoginRouteData _fromState(GoRouterState state) =>
      ProfileLoginRouteData(
        redirectUrl: state.uri.queryParameters['redirect-url'],
      );

  String get location => GoRouteData.$location(
        '/profile/login',
        queryParams: {
          if (redirectUrl != null) 'redirect-url': redirectUrl,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterRouteDataExtension on RegisterRouteData {
  static RegisterRouteData _fromState(GoRouterState state) =>
      const RegisterRouteData();

  String get location => GoRouteData.$location(
        '/profile/login/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FindIdRouteDataExtension on FindIdRouteData {
  static FindIdRouteData _fromState(GoRouterState state) =>
      const FindIdRouteData();

  String get location => GoRouteData.$location(
        '/profile/login/find-id',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ResetPasswordRouteDataExtension on ResetPasswordRouteData {
  static ResetPasswordRouteData _fromState(GoRouterState state) =>
      const ResetPasswordRouteData();

  String get location => GoRouteData.$location(
        '/profile/login/reset-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FollowManagementRouteDataExtension on FollowManagementRouteData {
  static FollowManagementRouteData _fromState(GoRouterState state) =>
      const FollowManagementRouteData();

  String get location => GoRouteData.$location(
        '/profile/follow-management',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReferralRouteDataExtension on ReferralRouteData {
  static ReferralRouteData _fromState(GoRouterState state) =>
      const ReferralRouteData();

  String get location => GoRouteData.$location(
        '/profile/referral',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FavoritesBulletinBoardRouteDataExtension
    on FavoritesBulletinBoardRouteData {
  static FavoritesBulletinBoardRouteData _fromState(GoRouterState state) =>
      const FavoritesBulletinBoardRouteData();

  String get location => GoRouteData.$location(
        '/profile/favorites-bulletin-board',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CheckOrderDeliveryDetailRouteDataExtension
    on CheckOrderDeliveryDetailRouteData {
  static CheckOrderDeliveryDetailRouteData _fromState(GoRouterState state) =>
      const CheckOrderDeliveryDetailRouteData();

  String get location => GoRouteData.$location(
        '/profile/check-order-delivery-detail',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $OldOrderDetailsRouteDataExtension on OldOrderDetailsRouteData {
  static OldOrderDetailsRouteData _fromState(GoRouterState state) =>
      OldOrderDetailsRouteData(
        orderId: int.parse(state.pathParameters['orderId']!),
      );

  String get location => GoRouteData.$location(
        '/profile/check-order-delivery-detail/old-order-details/${Uri.encodeComponent(orderId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductListSheetRouteDataExtension on ProductListSheetRouteData {
  static ProductListSheetRouteData _fromState(GoRouterState state) =>
      ProductListSheetRouteData(
        $extra: state.extra as List<OrderDetailResponse>,
      );

  String get location => GoRouteData.$location(
        '/profile/check-order-delivery-detail/product-list-sheet',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $DeliveryStatusRouteDataExtension on DeliveryStatusRouteData {
  static DeliveryStatusRouteData _fromState(GoRouterState state) =>
      DeliveryStatusRouteData(
        courierId: state.pathParameters['courierId']!,
        trackingId: state.pathParameters['trackingId']!,
        $extra: state.extra as String,
      );

  String get location => GoRouteData.$location(
        '/profile/check-order-delivery-detail/delivery-status/${Uri.encodeComponent(courierId)}/${Uri.encodeComponent(trackingId)}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $CommunityActivitiesRouteDataExtension
    on CommunityActivitiesRouteData {
  static CommunityActivitiesRouteData _fromState(GoRouterState state) =>
      const CommunityActivitiesRouteData();

  String get location => GoRouteData.$location(
        '/profile/community-activities',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReportedRouteDataExtension on ReportedRouteData {
  static ReportedRouteData _fromState(GoRouterState state) =>
      const ReportedRouteData();

  String get location => GoRouteData.$location(
        '/profile/reported',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BusinessCardEditRouteDataExtension on BusinessCardEditRouteData {
  static BusinessCardEditRouteData _fromState(GoRouterState state) =>
      const BusinessCardEditRouteData();

  String get location => GoRouteData.$location(
        '/profile/business-card-edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SelectImageRouteDataExtension on SelectImageRouteData {
  static SelectImageRouteData _fromState(GoRouterState state) =>
      const SelectImageRouteData();

  String get location => GoRouteData.$location(
        '/profile/business-card-edit/select-image',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CuratorActivitiesRouteDataExtension on CuratorActivitiesRouteData {
  static CuratorActivitiesRouteData _fromState(GoRouterState state) =>
      const CuratorActivitiesRouteData();

  String get location => GoRouteData.$location(
        '/profile/curator-activities',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileDetailsRouteDataExtension on ProfileDetailsRouteData {
  static ProfileDetailsRouteData _fromState(GoRouterState state) =>
      ProfileDetailsRouteData(
        userId: int.parse(state.pathParameters['userId']!),
      );

  String get location => GoRouteData.$location(
        '/profile/${Uri.encodeComponent(userId.toString())}/details',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingRouteDataExtension on SettingRouteData {
  static SettingRouteData _fromState(GoRouterState state) =>
      const SettingRouteData();

  String get location => GoRouteData.$location(
        '/profile/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountInformationManagementRouteDataExtension
    on AccountInformationManagementRouteData {
  static AccountInformationManagementRouteData _fromState(
          GoRouterState state) =>
      const AccountInformationManagementRouteData();

  String get location => GoRouteData.$location(
        '/profile/setting/account-information-management',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditAccountInformationRouteDataExtension
    on EditAccountInformationRouteData {
  static EditAccountInformationRouteData _fromState(GoRouterState state) =>
      const EditAccountInformationRouteData();

  String get location => GoRouteData.$location(
        '/profile/setting/account-information-management/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChangePhoneNumberRouteDataExtension on ChangePhoneNumberRouteData {
  static ChangePhoneNumberRouteData _fromState(GoRouterState state) =>
      const ChangePhoneNumberRouteData();

  String get location => GoRouteData.$location(
        '/profile/setting/account-information-management/edit/change-phone-number',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChangePasswordRouteDataExtension on ChangePasswordRouteData {
  static ChangePasswordRouteData _fromState(GoRouterState state) =>
      const ChangePasswordRouteData();

  String get location => GoRouteData.$location(
        '/profile/setting/account-information-management/edit/change-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationSettingRouteDataExtension
    on NotificationSettingRouteData {
  static NotificationSettingRouteData _fromState(GoRouterState state) =>
      const NotificationSettingRouteData();

  String get location => GoRouteData.$location(
        '/profile/setting/notification-setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PolicyAndTermConditionsRouteDataExtension
    on PolicyAndTermConditionsRouteData {
  static PolicyAndTermConditionsRouteData _fromState(GoRouterState state) =>
      const PolicyAndTermConditionsRouteData();

  String get location => GoRouteData.$location(
        '/profile/setting/policy-and-term-conditions',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $testLoadingRouteData => GoRouteData.$route(
      path: '/test-infinite-loading',
      factory: $TestLoadingRouteDataExtension._fromState,
    );

extension $TestLoadingRouteDataExtension on TestLoadingRouteData {
  static TestLoadingRouteData _fromState(GoRouterState state) =>
      const TestLoadingRouteData();

  String get location => GoRouteData.$location(
        '/test-infinite-loading',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
