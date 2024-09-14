import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/services/user_order/user_order.dart';
import '../../../../shared/widgets/product_list_sheet/product_list_sheet.dart';
import '../../../../shared/widgets/select_image_sheet/select_image_sheet.dart';
import '../../../../ui/account_information_management_screen/account_information_management_screen.dart';
import '../../../../ui/address_managent_screen/address_management_screen.dart';
import '../../../../ui/business_card_edit_screen/business_card_edit_screen.dart';
import '../../../../ui/change_password_screen/change_password_screen.dart';
import '../../../../ui/change_phone_number_screen/change_phone_number_screen.dart';
import '../../../../ui/check_order_delivery_detail_screen/check_order_delivery_detail_screen.dart';
import '../../../../ui/community_activities_screen/community_activities_screen.dart';
import '../../../../ui/curator_activities_screen/curator_activities_screen.dart';
import '../../../../ui/delivery_status_screen/delivery_status_screen.dart';
import '../../../../ui/edit_account_information/edit_account_information.dart';
import '../../../../ui/edit_address_screen/edit_address_screen.dart';
import '../../../../ui/edit_address_screen/widgets/search_address.dart';
import '../../../../ui/favorites_bulletin_board_screen/favorites_bulletin_board_screen.dart';
import '../../../../ui/find_id_screen/find_id_screen.dart';
import '../../../../ui/follow_management_screen/follow_management_screen.dart';
import '../../../../ui/inquiry_history_screen/inquiry_history_screen.dart';
import '../../../../ui/login_screen/login_screen.dart';
import '../../../../ui/notification_setting_screen/notification_setting_screen.dart';
import '../../../../ui/order_detail_screen/old_order_detail_screen.dart';
import '../../../../ui/policy_and_term_conditions/policy_and_term_conditions.dart';
import '../../../../ui/profile_details_screen/profile_details_screen.dart';
import '../../../../ui/profile_screen/profile_screen.dart';
import '../../../../ui/referral_screen/referral_sreen.dart';
import '../../../../ui/register_screen/register_screen.dart';
import '../../../../ui/report_screen/reported-screen.dart';
import '../../../../ui/reset_password_screen/reset_password_screen.dart';
import '../../../../ui/setting_screen/setting_screen.dart';
import '../../../app_nav_key/app_nav_key.dart';

class ProfileBranchData extends StatefulShellBranchData {
  const ProfileBranchData();
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}

class ProfileLoginRouteData extends GoRouteData {
  const ProfileLoginRouteData({
    this.redirectUrl,
  });

  final String? redirectUrl;

  static const routeName = 'login';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return LoginScreen.buildPage(
      context,
      state,
      redirectUrl: redirectUrl,
    );
  }
}

class RegisterRouteData extends GoRouteData {
  const RegisterRouteData();

  static const routeName = 'register';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterScreen();
}

class FindIdRouteData extends GoRouteData {
  const FindIdRouteData();

  static const routeName = 'find-id';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FindIdScreen();
}

class ResetPasswordRouteData extends GoRouteData {
  const ResetPasswordRouteData();

  static const routeName = 'reset-password';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ResetPasswordScreen();
}

class ReferralRouteData extends GoRouteData {
  const ReferralRouteData();

  static const routeName = 'referral';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ReferralScreen();
}

class FollowManagementRouteData extends GoRouteData {
  const FollowManagementRouteData();

  static const routeName = 'follow-management';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FollowManagementScreen();
}

class FavoritesBulletinBoardRouteData extends GoRouteData {
  const FavoritesBulletinBoardRouteData();

  static const routeName = 'favorites-bulletin-board';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FavoritesBulletinBoardScreen();
}

class CheckOrderDeliveryDetailRouteData extends GoRouteData {
  const CheckOrderDeliveryDetailRouteData();

  static const routeName = 'check-order-delivery-detail';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CheckOrderDeliveryDetailScreen();
  }
}

class DeliveryStatusRouteData extends GoRouteData {
  const DeliveryStatusRouteData({
    required this.courierId,
    required this.trackingId,
    required this.$extra,
  });

  final String courierId;
  final String trackingId;
  final String $extra;

  static const routeName = 'delivery-status/:courierId/:trackingId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DeliveryStatusScreen(
      courierId: courierId,
      trackingId: trackingId,
      courierName: $extra,
    );
  }
}

class OldOrderDetailsRouteData extends GoRouteData {
  const OldOrderDetailsRouteData({
    required this.orderId,
  });

  final int orderId;

  static const routeName = 'old-order-details/:orderId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OldOrderDetailScreen(
      id: orderId,
    );
  }
}

class ProductListSheetRouteData extends GoRouteData {
  const ProductListSheetRouteData({
    required this.$extra,
  });

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;
  final List<OrderDetailResponse> $extra;

  static const routeName = 'product-list-sheet';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ProductListSheet.buildPage(
      context,
      key: state.pageKey,
      productList: $extra,
    );
  }
}

class AddressRouteData extends GoRouteData {
  const AddressRouteData({
    this.addressId,
    required this.addressType,
  });

  final int? addressId;
  final AddressType addressType;

  static const routeName = 'address';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddressManagementScreen(
      type: addressType,
      initialAddressId: addressId,
    );
  }
}

class AddressAddRouteData extends GoRouteData {
  const AddressAddRouteData();

  static const routeName = 'address-add';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditAddressScreen(type: AddressScreenOperation.add);
  }
}

class InquiryHistoryRouteData extends GoRouteData {
  const InquiryHistoryRouteData();

  static const routeName = 'inquiry-history';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InquiryHistoryScreen();
  }
}

class AddressEditRouteData extends GoRouteData {
  const AddressEditRouteData({
    required this.addressId,
  });

  final int addressId;

  static const routeName = 'address-edit/:addressId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EditAddressScreen(
      type: AddressScreenOperation.edit,
      id: addressId,
    );
  }
}

class SearchAddressRouteData extends GoRouteData {
  const SearchAddressRouteData();

  static const routeName = 'search-address';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchAddress();
  }
}

class CommunityActivitiesRouteData extends GoRouteData {
  const CommunityActivitiesRouteData();

  static const routeName = 'community-activities';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CommunityActivitiesScreen();
  }
}

class ReportedRouteData extends GoRouteData {
  const ReportedRouteData();

  static const routeName = 'reported';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReportedScreen();
  }
}


class BusinessCardEditRouteData extends GoRouteData {
  const BusinessCardEditRouteData();

  static const routeName = 'business-card-edit';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BusinessCardEditScreen();
  }
}

class SelectImageRouteData extends GoRouteData {
  const SelectImageRouteData();

  static const routeName = 'select-image';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SelectPhotoSheet.buildPage(
      context,
      key: state.pageKey,
    );
  }
}

class CuratorActivitiesRouteData extends GoRouteData {
  const CuratorActivitiesRouteData();

  static const routeName = 'curator-activities';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CuratorActivitiesScreen();
  }
}

class ProfileDetailsRouteData extends GoRouteData {
  const ProfileDetailsRouteData({required this.userId});

  final int userId;
  static const routeName = ':userId/details';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfileDetailsScreen(userId: userId);
  }
}

class SettingRouteData extends GoRouteData {
  const SettingRouteData();

  static const routeName = 'setting';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingScreen();
  }
}

class AccountInformationManagementRouteData extends GoRouteData {
  const AccountInformationManagementRouteData();

  static const routeName = 'account-information-management';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountInfoManagementScreen();
  }
}

class EditAccountInformationRouteData extends GoRouteData {
  const EditAccountInformationRouteData();

  static const routeName = 'edit';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditAccountInfoScreen();
  }
}

class NotificationSettingRouteData extends GoRouteData {
  const NotificationSettingRouteData();

  static const routeName = 'notification-setting';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationSettingScreen();
  }
}

class PolicyAndTermConditionsRouteData extends GoRouteData {
  const PolicyAndTermConditionsRouteData();

  static const routeName = 'policy-and-term-conditions';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PolicyAndTermConditionsScreen();
  }
}

class ChangePhoneNumberRouteData extends GoRouteData {
  const ChangePhoneNumberRouteData();

  static const routeName = 'change-phone-number';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChangePhoneNumberScreen();
  }
}

class ChangePasswordRouteData extends GoRouteData {
  const ChangePasswordRouteData();

  static const routeName = 'change-password';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChangePasswordScreen();
  }
}
