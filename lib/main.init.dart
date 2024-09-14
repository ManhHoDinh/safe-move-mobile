// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'application/services/app/search_history/search_history.dart' as p0;
import 'application/services/auth/dto/src/auth_method.dart' as p1;
import 'application/services/auth/dto/src/otp_info.dart' as p2;
import 'application/services/auth/request/src/change_my_password_request.dart'
    as p3;
import 'application/services/auth/request/src/change_password_request.dart'
    as p4;
import 'application/services/auth/request/src/change_phone_number_request.dart'
    as p5;
import 'application/services/auth/request/src/find_username_request.dart' as p6;
import 'application/services/auth/request/src/login_request.dart' as p7;
import 'application/services/auth/request/src/login_with_apple_request.dart'
    as p8;
import 'application/services/auth/request/src/login_with_google_request.dart'
    as p9;
import 'application/services/auth/request/src/login_with_kakao_request.dart'
    as p10;
import 'application/services/auth/request/src/login_with_naver_request.dart'
    as p11;
import 'application/services/auth/request/src/logout_request.dart' as p12;
import 'application/services/auth/request/src/match_user_phone_number_request.dart'
    as p13;
import 'application/services/auth/request/src/refresh_token_request.dart'
    as p14;
import 'application/services/auth/request/src/register_with_phone_number_request.dart'
    as p15;
import 'application/services/auth/request/src/send_otp_request.dart' as p16;
import 'application/services/auth/request/src/verify_otp_request.dart' as p17;
import 'application/services/auth/request/src/verify_password_request.dart'
    as p18;
import 'application/services/auth/response/src/authenticated_response.dart'
    as p19;
import 'application/services/auth/response/src/find_username_response.dart'
    as p20;
import 'application/services/auth/response/src/jwt_response.dart' as p21;
import 'application/services/auth/response/src/match_user_phone_number_response.dart'
    as p22;
import 'application/services/auth/response/src/send_otp_response.dart' as p23;
import 'application/services/auth/response/src/session_token_response.dart'
    as p24;
import 'application/services/category/dto/src/category_dto.dart' as p25;
import 'application/services/category/dto/src/category_type.dart' as p26;
import 'application/services/category/dto/src/post_category_dto.dart' as p27;
import 'application/services/category/dto/src/sub_category_dto.dart' as p28;
import 'application/services/category/request/src/get_all_category_request.dart'
    as p29;
import 'application/services/category/request/src/get_category_by_id_request.dart'
    as p30;
import 'application/services/common/dto/src/language_type.dart' as p31;
import 'application/services/common/dto/src/localized_field_value.dart' as p32;
import 'application/services/common/dto/src/post_activity_type.dart' as p33;
import 'application/services/common/dto/src/post_type.dart' as p34;
import 'application/services/common/response/src/paging_response.dart' as p35;
import 'application/services/common/response/src/post_response.dart' as p36;
import 'application/services/common/response/src/success_response.dart' as p37;
import 'application/services/file/response/src/file_response.dart' as p38;
import 'application/services/file/response/src/presigned_url_upload_response.dart'
    as p39;
import 'application/services/main_page/dto/src/main_page_type.dart' as p40;
import 'application/services/main_page/response/src/main_page_title_response.dart'
    as p41;
import 'application/services/post_comment/request/src/comment_creation_request.dart'
    as p42;
import 'application/services/post_comment/request/src/comment_update_request.dart'
    as p43;
import 'application/services/post_comment/response/src/child_comment_response.dart'
    as p44;
import 'application/services/post_comment/response/src/comment_response.dart'
    as p45;
import 'application/services/post_community/dto/src/filter_community_post.dart'
    as p46;
import 'application/services/post_community/request/src/post_create_request.dart'
    as p47;
import 'application/services/post_sgm_news/dto/src/filter_sgm_news_type.dart'
    as p48;
import 'application/services/product/response/src/product_response.dart' as p49;
import 'application/services/qa/dto/src/qa_filter_type.dart' as p50;
import 'application/services/qa/request/src/qa_create_request.dart' as p51;
import 'application/services/qa/response/src/qa_response.dart' as p52;
import 'application/services/qa/response/src/qa_user_response.dart' as p53;
import 'application/services/rating/request/src/rating_request.dart' as p54;
import 'application/services/rating/response/src/rating_response.dart' as p55;
import 'application/services/sweettracker/request/src/tracking_info_request.dart'
    as p56;
import 'application/services/sweettracker/response/src/tracking_detail_response.dart'
    as p57;
import 'application/services/sweettracker/response/src/tracking_info_response.dart'
    as p58;
import 'application/services/term_and_condition/dto/src/term_type.dart' as p59;
import 'application/services/term_and_condition/response/src/term_and_cond_response.dart'
    as p60;
import 'application/services/user/dto/src/notification_type.dart' as p61;
import 'application/services/user/dto/src/social_media_type.dart' as p62;
import 'application/services/user/dto/src/user_dto.dart' as p63;
import 'application/services/user/request/src/check_exist_phone_number_request.dart'
    as p64;
import 'application/services/user/request/src/check_exist_username_request.dart'
    as p65;
import 'application/services/user/request/src/file_request.dart' as p66;
import 'application/services/user/request/src/notification_setting_request.dart'
    as p67;
import 'application/services/user/request/src/profile_url_request.dart' as p68;
import 'application/services/user/request/src/read_notification_request.dart'
    as p69;
import 'application/services/user/request/src/social_media_request.dart' as p70;
import 'application/services/user/request/src/supplement_user_information_request.dart'
    as p71;
import 'application/services/user/request/src/update_user_avatar_request.dart'
    as p72;
import 'application/services/user/request/src/update_user_info_request.dart'
    as p73;
import 'application/services/user/response/src/check_exist_account_response.dart'
    as p74;
import 'application/services/user/response/src/get_referred_user_response.dart'
    as p75;
import 'application/services/user/response/src/notification_response.dart'
    as p76;
import 'application/services/user/response/src/notification_setting_response.dart'
    as p77;
import 'application/services/user/response/src/profile_url_response.dart'
    as p78;
import 'application/services/user/response/src/social_media_response.dart'
    as p79;
import 'application/services/user/response/src/user_registration_status_response.dart'
    as p80;
import 'application/services/user_address/request/src/address_request.dart'
    as p81;
import 'application/services/user_address/response/src/address_response.dart'
    as p82;
import 'application/services/user_cart/request/src/cart_create_request.dart'
    as p83;
import 'application/services/user_cart/request/src/cart_delete_request.dart'
    as p84;
import 'application/services/user_cart/request/src/cart_update_request.dart'
    as p85;
import 'application/services/user_cart/response/src/cart_response.dart' as p86;
import 'application/services/user_favorite_category/request/src/favorite_category_request.dart'
    as p87;
import 'application/services/user_order/dto/src/order_status_type.dart' as p88;
import 'application/services/user_order/request/src/cancel_order_request.dart'
    as p89;
import 'application/services/user_order/request/src/confirm_order_request.dart'
    as p90;
import 'application/services/user_order/response/src/order_detail_response.dart'
    as p91;
import 'application/services/user_order/response/src/order_response.dart'
    as p92;
import 'application/services/user_order_session/request/src/order_details_session_create_request.dart'
    as p93;
import 'application/services/user_order_session/request/src/order_session_create_request.dart'
    as p94;
import 'application/services/user_order_session/response/src/order_detail_session_response.dart'
    as p95;
import 'application/services/user_order_session/response/src/order_session_response.dart'
    as p96;
import 'application/services/user_post_reaction/request/src/post_reaction_request.dart'
    as p97;
import 'application/services/youtube_client_service/play_list_item_response.dart'
    as p98;
import 'application/services/youtube_client_service/youtube_video_controller.dart'
    as p99;

void initializeMappers() {
  p0.SearchHistoryMapper.ensureInitialized();
  p0.SearchEntryMapper.ensureInitialized();
  p1.AuthMethodMapper.ensureInitialized();
  p2.OTPInfoMapper.ensureInitialized();
  p3.ChangeMyPasswordRequestMapper.ensureInitialized();
  p4.ChangePasswordRequestMapper.ensureInitialized();
  p5.ChangePhoneNumberRequestMapper.ensureInitialized();
  p6.FindUsernameRequestMapper.ensureInitialized();
  p7.LoginRequestMapper.ensureInitialized();
  p8.LoginWithAppleRequestMapper.ensureInitialized();
  p9.LoginWithGoogleRequestMapper.ensureInitialized();
  p10.LoginWithKakaoRequestMapper.ensureInitialized();
  p11.LoginWithNaverRequestMapper.ensureInitialized();
  p12.LogoutRequestMapper.ensureInitialized();
  p13.MatchUserPhoneNumberRequestMapper.ensureInitialized();
  p14.RefreshTokenRequestMapper.ensureInitialized();
  p15.RegisterWithPhoneNumberRequestMapper.ensureInitialized();
  p16.SendOTPRequestMapper.ensureInitialized();
  p17.VerifyOTPRequestMapper.ensureInitialized();
  p18.VerifyPasswordRequestMapper.ensureInitialized();
  p19.AuthenticatedResponseMapper.ensureInitialized();
  p20.FindUsernameResponseMapper.ensureInitialized();
  p21.JwtResponseMapper.ensureInitialized();
  p22.MatchUserPhoneNumberResponseMapper.ensureInitialized();
  p23.SendOTPResponseMapper.ensureInitialized();
  p24.SessionTokenResponseMapper.ensureInitialized();
  p25.CategoryDTOMapper.ensureInitialized();
  p26.CategoryTypeMapper.ensureInitialized();
  p27.PostCategoryDTOMapper.ensureInitialized();
  p28.SubCategoryDTOMapper.ensureInitialized();
  p29.GetAllCategoryRequestMapper.ensureInitialized();
  p30.GetCategoryByIdRequestMapper.ensureInitialized();
  p31.PostLanguageMapper.ensureInitialized();
  p32.LocalizedFieldValueMapper.ensureInitialized();
  p33.PostActivityTypeMapper.ensureInitialized();
  p34.PostTypeMapper.ensureInitialized();
  p35.PagingResponseMapper.ensureInitialized();
  p36.PostResponseMapper.ensureInitialized();
  p37.SuccessResponseMapper.ensureInitialized();
  p38.FileResponseMapper.ensureInitialized();
  p39.PresignedUrlUploadResponseMapper.ensureInitialized();
  p40.MainPageTypeMapper.ensureInitialized();
  p41.MainPageTitleResponseMapper.ensureInitialized();
  p42.CommentCreationRequestMapper.ensureInitialized();
  p43.CommentUpdateRequestMapper.ensureInitialized();
  p44.ChildCommentResponseMapper.ensureInitialized();
  p45.CommentResponseMapper.ensureInitialized();
  p46.FilterCommunityPostMapper.ensureInitialized();
  p47.PostRequestMapper.ensureInitialized();
  p48.FilterSgmNewsTypeMapper.ensureInitialized();
  p49.ProductResponseMapper.ensureInitialized();
  p50.QAFilterTypeMapper.ensureInitialized();
  p51.QACreateRequestMapper.ensureInitialized();
  p51.QATypeMapper.ensureInitialized();
  p52.QAResponseMapper.ensureInitialized();
  p53.QAUserResponseMapper.ensureInitialized();
  p54.RatingRequestMapper.ensureInitialized();
  p55.RatingResponseMapper.ensureInitialized();
  p56.TrackingInfoRequestMapper.ensureInitialized();
  p57.TrackingDetailResponseMapper.ensureInitialized();
  p58.TrackingInfoResponseMapper.ensureInitialized();
  p59.TermTypeMapper.ensureInitialized();
  p60.TermAndCondResponseMapper.ensureInitialized();
  p61.NotificationTypeMapper.ensureInitialized();
  p62.SocialMediaTypeMapper.ensureInitialized();
  p63.UserDTOMapper.ensureInitialized();
  p63.UserDetailDTOMapper.ensureInitialized();
  p63.RoleMapper.ensureInitialized();
  p63.AccountTypeMapper.ensureInitialized();
  p64.CheckExistPhoneNumberRequestMapper.ensureInitialized();
  p65.CheckExistUsernameRequestMapper.ensureInitialized();
  p66.FileRequestMapper.ensureInitialized();
  p67.NotificationSettingRequestMapper.ensureInitialized();
  p68.ProfileUrlRequestMapper.ensureInitialized();
  p69.ReadNotificationRequestMapper.ensureInitialized();
  p70.SocialMediaRequestMapper.ensureInitialized();
  p71.SupplementUserInformationRequestMapper.ensureInitialized();
  p72.UpdateUserAvatarRequestMapper.ensureInitialized();
  p73.UpdateUserInfoRequestMapper.ensureInitialized();
  p74.CheckAccountExistedResponseMapper.ensureInitialized();
  p75.GetReferredUserResponseMapper.ensureInitialized();
  p76.NotificationResponseMapper.ensureInitialized();
  p77.NotificationSettingResponseMapper.ensureInitialized();
  p78.ProfileUrlResponseMapper.ensureInitialized();
  p79.SocialMediaResponseMapper.ensureInitialized();
  p80.UserRegistrationStatusResponseMapper.ensureInitialized();
  p81.AddressRequestMapper.ensureInitialized();
  p82.AddressResponseMapper.ensureInitialized();
  p83.CartCreateRequestMapper.ensureInitialized();
  p84.CartDeleteRequestMapper.ensureInitialized();
  p85.CartUpdateRequestMapper.ensureInitialized();
  p86.CartResponseMapper.ensureInitialized();
  p87.FavoriteCategoryRequestMapper.ensureInitialized();
  p88.OrderStatusTypeMapper.ensureInitialized();
  p89.CancelOrderRequestMapper.ensureInitialized();
  p90.ConfirmOrderRequestMapper.ensureInitialized();
  p91.OrderDetailResponseMapper.ensureInitialized();
  p92.OrderResponseMapper.ensureInitialized();
  p93.OrderDetailsSessionCreateRequestMapper.ensureInitialized();
  p94.OrderSessionCreateRequestMapper.ensureInitialized();
  p95.OrderDetailSessionResponseMapper.ensureInitialized();
  p96.OrderSessionResponseMapper.ensureInitialized();
  p96.SessionStatusMapper.ensureInitialized();
  p97.PostReactionRequestMapper.ensureInitialized();
  p98.PlayListItemMapper.ensureInitialized();
  p98.YoutubePageContentMapper.ensureInitialized();
  p98.YoutubeSnippetMapper.ensureInitialized();
  p98.YoutubeResourceIdMapper.ensureInitialized();
  p98.YoutubeThumbnailCollectionMapper.ensureInitialized();
  p98.YoutubeThumbnailMapper.ensureInitialized();
  p98.YoutubePageInfoMapper.ensureInitialized();
  p99.YoutubeResponseMapper.ensureInitialized();
  p99.ReactionRequestMapper.ensureInitialized();
  p99.YoutubeVideoTypeMapper.ensureInitialized();
  p99.YoutubeVideoSortMapper.ensureInitialized();
}
