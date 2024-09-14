import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'locale/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
    Locale('zh')
  ];

  /// No description provided for @home.
  ///
  /// In ko, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @community.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티'**
  String get community;

  /// No description provided for @forum.
  ///
  /// In ko, this message translates to:
  /// **'게시판'**
  String get forum;

  /// No description provided for @store.
  ///
  /// In ko, this message translates to:
  /// **'스토어'**
  String get store;

  /// No description provided for @profile.
  ///
  /// In ko, this message translates to:
  /// **'마이페이지'**
  String get profile;

  /// No description provided for @profileNavText.
  ///
  /// In ko, this message translates to:
  /// **'MY'**
  String get profileNavText;

  /// No description provided for @news.
  ///
  /// In ko, this message translates to:
  /// **'NEWS'**
  String get news;

  /// No description provided for @fullMenu.
  ///
  /// In ko, this message translates to:
  /// **'전체메뉴'**
  String get fullMenu;

  /// No description provided for @bestReview.
  ///
  /// In ko, this message translates to:
  /// **'Best Review'**
  String get bestReview;

  /// No description provided for @pressAgainToCloseApp.
  ///
  /// In ko, this message translates to:
  /// **'앱을 닫으려면 다시 누르세요.'**
  String get pressAgainToCloseApp;

  /// No description provided for @seeAll.
  ///
  /// In ko, this message translates to:
  /// **'전체보기'**
  String get seeAll;

  /// No description provided for @onlineMagazine.
  ///
  /// In ko, this message translates to:
  /// **'ONLINE MAGAZINE'**
  String get onlineMagazine;

  /// No description provided for @sgmNews.
  ///
  /// In ko, this message translates to:
  /// **'SGM NEWS'**
  String get sgmNews;

  /// No description provided for @sungongMuseum.
  ///
  /// In ko, this message translates to:
  /// **'SUNGONG MUSEUM'**
  String get sungongMuseum;

  /// No description provided for @communityCategory.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티 카테고리'**
  String get communityCategory;

  /// No description provided for @bulletBoardCategory.
  ///
  /// In ko, this message translates to:
  /// **'게시판 카테고리'**
  String get bulletBoardCategory;

  /// No description provided for @storeCategory.
  ///
  /// In ko, this message translates to:
  /// **'스토어 카테고리'**
  String get storeCategory;

  /// No description provided for @sungongMuseumKo.
  ///
  /// In ko, this message translates to:
  /// **'성공뮤지엄'**
  String get sungongMuseumKo;

  /// No description provided for @category.
  ///
  /// In ko, this message translates to:
  /// **'카테고리'**
  String get category;

  /// No description provided for @companyName.
  ///
  /// In ko, this message translates to:
  /// **'주식회사 성공매니아'**
  String get companyName;

  /// No description provided for @ceoTitle.
  ///
  /// In ko, this message translates to:
  /// **'대표이사 : '**
  String get ceoTitle;

  /// No description provided for @ceo.
  ///
  /// In ko, this message translates to:
  /// **'오채무'**
  String get ceo;

  /// No description provided for @emailTitle.
  ///
  /// In ko, this message translates to:
  /// **'이메일 : '**
  String get emailTitle;

  /// No description provided for @emailValue.
  ///
  /// In ko, this message translates to:
  /// **'ocm@mecelljoo.kr'**
  String get emailValue;

  /// No description provided for @contactNumberTitle.
  ///
  /// In ko, this message translates to:
  /// **'대표번호 : '**
  String get contactNumberTitle;

  /// No description provided for @contactNumber.
  ///
  /// In ko, this message translates to:
  /// **'070-5213-7613'**
  String get contactNumber;

  /// No description provided for @businessRegistrationNumberTitle.
  ///
  /// In ko, this message translates to:
  /// **'사업자등록번호 : '**
  String get businessRegistrationNumberTitle;

  /// No description provided for @businessRegistrationNumber.
  ///
  /// In ko, this message translates to:
  /// **'887-87-02726'**
  String get businessRegistrationNumber;

  /// No description provided for @ecommerceRegistrationNumberTitle.
  ///
  /// In ko, this message translates to:
  /// **'통신판매신고번호 : '**
  String get ecommerceRegistrationNumberTitle;

  /// No description provided for @ecommerceRegistrationNumber.
  ///
  /// In ko, this message translates to:
  /// **'2023-충남천안-3531'**
  String get ecommerceRegistrationNumber;

  /// No description provided for @personalInfoProtectionOfficerTitle.
  ///
  /// In ko, this message translates to:
  /// **'개인정보 보호책임자 : '**
  String get personalInfoProtectionOfficerTitle;

  /// No description provided for @personalInfoProtectionOfficer.
  ///
  /// In ko, this message translates to:
  /// **'오채무'**
  String get personalInfoProtectionOfficer;

  /// No description provided for @officerEmailTitle.
  ///
  /// In ko, this message translates to:
  /// **'담당자 이메일 : '**
  String get officerEmailTitle;

  /// No description provided for @officerEmail.
  ///
  /// In ko, this message translates to:
  /// **'ocm@mecelljoo.kr'**
  String get officerEmail;

  /// No description provided for @addressTitle.
  ///
  /// In ko, this message translates to:
  /// **'주소 : '**
  String get addressTitle;

  /// No description provided for @addressValue.
  ///
  /// In ko, this message translates to:
  /// **'[31156] 충청남도 천안시 서북구 불당22대로 86 (마블러스에스타워) 804호'**
  String get addressValue;

  /// No description provided for @copyrightTitle.
  ///
  /// In ko, this message translates to:
  /// **'저작권 '**
  String get copyrightTitle;

  /// No description provided for @copyright.
  ///
  /// In ko, this message translates to:
  /// **'ⓒ 2024 성공매니아 All rights reserved.'**
  String get copyright;

  /// No description provided for @latest.
  ///
  /// In ko, this message translates to:
  /// **'최신순'**
  String get latest;

  /// No description provided for @popular.
  ///
  /// In ko, this message translates to:
  /// **'인기순'**
  String get popular;

  /// No description provided for @recommended.
  ///
  /// In ko, this message translates to:
  /// **'추천순'**
  String get recommended;

  /// No description provided for @compose.
  ///
  /// In ko, this message translates to:
  /// **'글쓰기'**
  String get compose;

  /// No description provided for @bestContents.
  ///
  /// In ko, this message translates to:
  /// **'Best Contents'**
  String get bestContents;

  /// No description provided for @onlineMagazineKo.
  ///
  /// In ko, this message translates to:
  /// **'온라인 매거진'**
  String get onlineMagazineKo;

  /// No description provided for @bestReviewLower.
  ///
  /// In ko, this message translates to:
  /// **'Best Review'**
  String get bestReviewLower;

  /// No description provided for @selfEmployment.
  ///
  /// In ko, this message translates to:
  /// **'자영업'**
  String get selfEmployment;

  /// No description provided for @sales.
  ///
  /// In ko, this message translates to:
  /// **'영업'**
  String get sales;

  /// No description provided for @houseWife.
  ///
  /// In ko, this message translates to:
  /// **'주부'**
  String get houseWife;

  /// No description provided for @officeWorkers.
  ///
  /// In ko, this message translates to:
  /// **'직장인'**
  String get officeWorkers;

  /// No description provided for @inseldeomBusiness.
  ///
  /// In ko, this message translates to:
  /// **'인셀덤 사업'**
  String get inseldeomBusiness;

  /// No description provided for @allPosts.
  ///
  /// In ko, this message translates to:
  /// **'전체글'**
  String get allPosts;

  /// No description provided for @favoritePosts.
  ///
  /// In ko, this message translates to:
  /// **'즐겨찾기'**
  String get favoritePosts;

  /// No description provided for @popularPosts.
  ///
  /// In ko, this message translates to:
  /// **'인기순'**
  String get popularPosts;

  /// No description provided for @curator.
  ///
  /// In ko, this message translates to:
  /// **'큐레이션'**
  String get curator;

  /// No description provided for @unit.
  ///
  /// In ko, this message translates to:
  /// **'원'**
  String get unit;

  /// No description provided for @commonCurrencyFormat.
  ///
  /// In ko, this message translates to:
  /// **'{value}원'**
  String commonCurrencyFormat(double value);

  /// No description provided for @easyLoginSNS.
  ///
  /// In ko, this message translates to:
  /// **'SNS 간편 로그인'**
  String get easyLoginSNS;

  /// No description provided for @signIn.
  ///
  /// In ko, this message translates to:
  /// **'로그인'**
  String get signIn;

  /// No description provided for @register.
  ///
  /// In ko, this message translates to:
  /// **'회원가입'**
  String get register;

  /// No description provided for @findId.
  ///
  /// In ko, this message translates to:
  /// **'아이디 찾기'**
  String get findId;

  /// No description provided for @findPassword.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호 찾기'**
  String get findPassword;

  /// No description provided for @password.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호'**
  String get password;

  /// No description provided for @username.
  ///
  /// In ko, this message translates to:
  /// **'아이디'**
  String get username;

  /// No description provided for @termOfService.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아몰 이용약관'**
  String get termOfService;

  /// No description provided for @termOfServiceTitle.
  ///
  /// In ko, this message translates to:
  /// **'개인정보 처리방침'**
  String get termOfServiceTitle;

  /// No description provided for @termOfService1.
  ///
  /// In ko, this message translates to:
  /// **'제1조(목적)'**
  String get termOfService1;

  /// No description provided for @termOfService1Content1.
  ///
  /// In ko, this message translates to:
  /// **'이 약관은 성공매니아 (전자상거래 사업자)가 운영하는 성공매니아 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.\n※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」'**
  String get termOfService1Content1;

  /// No description provided for @termOfService2.
  ///
  /// In ko, this message translates to:
  /// **'제2조(정의)'**
  String get termOfService2;

  /// No description provided for @termOfService2Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”이란 성공매니아가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.'**
  String get termOfService2Content1;

  /// No description provided for @termOfService2Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.'**
  String get termOfService2Content2;

  /// No description provided for @termOfService2Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.'**
  String get termOfService2Content3;

  /// No description provided for @termOfService2Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.'**
  String get termOfService2Content4;

  /// No description provided for @termOfService3.
  ///
  /// In ko, this message translates to:
  /// **'제3조 (약관 등의 명시와 설명 및 개정)'**
  String get termOfService3;

  /// No description provided for @termOfService3Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 성공매니아 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.'**
  String get termOfService3Content1;

  /// No description provided for @termOfService3Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.'**
  String get termOfService3Content2;

  /// No description provided for @termOfService3Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ ‘③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.'**
  String get termOfService3Content3;

  /// No description provided for @termOfService3Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.'**
  String get termOfService3Content4;

  /// No description provided for @termOfService3Content5.
  ///
  /// In ko, this message translates to:
  /// **'⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.'**
  String get termOfService3Content5;

  /// No description provided for @termOfService3Content6.
  ///
  /// In ko, this message translates to:
  /// **'⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.'**
  String get termOfService3Content6;

  /// No description provided for @termOfService4.
  ///
  /// In ko, this message translates to:
  /// **'제4조(서비스의 제공 및 변경)'**
  String get termOfService4;

  /// No description provided for @termOfService4Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 다음과 같은 업무를 수행합니다.\n1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결\n2. 구매계약이 체결된 재화 또는 용역의 배송\n3. 기타 “몰”이 정하는 업무'**
  String get termOfService4Content1;

  /// No description provided for @termOfService4Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.'**
  String get termOfService4Content2;

  /// No description provided for @termOfService4Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.'**
  String get termOfService4Content3;

  /// No description provided for @termOfService4Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.'**
  String get termOfService4Content4;

  /// No description provided for @termOfService5.
  ///
  /// In ko, this message translates to:
  /// **'제5조(서비스의 중단)'**
  String get termOfService5;

  /// No description provided for @termOfService5Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 컴퓨터 등 정보통신설비의 보수점검.교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.'**
  String get termOfService5Content1;

  /// No description provided for @termOfService5Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.'**
  String get termOfService5Content2;

  /// No description provided for @termOfService5Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.'**
  String get termOfService5Content3;

  /// No description provided for @termOfService6.
  ///
  /// In ko, this message translates to:
  /// **'제6조(회원가입)'**
  String get termOfService6;

  /// No description provided for @termOfService6Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.'**
  String get termOfService6Content1;

  /// No description provided for @termOfService6Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.\n1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.\n2. 등록 내용에 허위, 기재누락, 오기가 있는 경우\n3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우'**
  String get termOfService6Content2;

  /// No description provided for @termOfService6Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.'**
  String get termOfService6Content3;

  /// No description provided for @termOfService6Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.'**
  String get termOfService6Content4;

  /// No description provided for @termOfService7.
  ///
  /// In ko, this message translates to:
  /// **'제7조(회원 탈퇴 및 자격 상실 등)'**
  String get termOfService7;

  /// No description provided for @termOfService7Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.'**
  String get termOfService7Content1;

  /// No description provided for @termOfService7Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.\n1. 가입 신청 시에 허위 내용을 등록한 경우\n2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우\n3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우\n4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우'**
  String get termOfService7Content2;

  /// No description provided for @termOfService7Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ “몰”이 회원 자격을 제한.정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.'**
  String get termOfService7Content3;

  /// No description provided for @termOfService7Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.'**
  String get termOfService7Content4;

  /// No description provided for @termOfService8.
  ///
  /// In ko, this message translates to:
  /// **'제8조(회원에 대한 통지)'**
  String get termOfService8;

  /// No description provided for @termOfService8Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.'**
  String get termOfService8Content1;

  /// No description provided for @termOfService8Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.'**
  String get termOfService8Content2;

  /// No description provided for @termOfService9.
  ///
  /// In ko, this message translates to:
  /// **'제9조(구매신청)'**
  String get termOfService9;

  /// No description provided for @termOfService9Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.\n1. 재화 등의 검색 및 선택\n2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력\n3. 약관내용, 청약철회권이 제한되는 서비스, 배송료.설치비 등의 비용부담과 관련한 내용에 대한 확인\n4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)\n5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의\n6. 결제방법의 선택'**
  String get termOfService9Content1;

  /// No description provided for @termOfService9Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.'**
  String get termOfService9Content2;

  /// No description provided for @termOfService10.
  ///
  /// In ko, this message translates to:
  /// **'제10조 (계약의 성립)'**
  String get termOfService10;

  /// No description provided for @termOfService10Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.\n1. 신청 내용에 허위, 기재누락, 오기가 있는 경우\n2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우\n3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우'**
  String get termOfService10Content1;

  /// No description provided for @termOfService10Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.'**
  String get termOfService10Content2;

  /// No description provided for @termOfService10Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.'**
  String get termOfService10Content3;

  /// No description provided for @termOfService11.
  ///
  /// In ko, this message translates to:
  /// **'제11조(지급방법)'**
  String get termOfService11;

  /// No description provided for @termOfService11Content1.
  ///
  /// In ko, this message translates to:
  /// **'“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다.\n단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.\n1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체\n2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제\n3. 온라인무통장입금\n4. 전자화폐에 의한 결제\n5. 수령 시 대금지급\n6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제\n7. “몰”과 계약을 맺었거나 “몰”이 인정 한 상품권에 의한 결제\n8. 기타 전자적 지급 방법에 의한 대금 지 급 등'**
  String get termOfService11Content1;

  /// No description provided for @termOfService12.
  ///
  /// In ko, this message translates to:
  /// **'제12조(수신확인통지.구매신청 변경 및 취소)'**
  String get termOfService12;

  /// No description provided for @termOfService12Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.'**
  String get termOfService12Content1;

  /// No description provided for @termOfService12Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.'**
  String get termOfService12Content2;

  /// No description provided for @termOfService13.
  ///
  /// In ko, this message translates to:
  /// **'제13조(재화 등의 공급)'**
  String get termOfService13;

  /// No description provided for @termOfService13Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.'**
  String get termOfService13Content1;

  /// No description provided for @termOfService13Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의.과실이 없음을 입증한 경우에는 그러하지 아니합니다.'**
  String get termOfService13Content2;

  /// No description provided for @termOfService14.
  ///
  /// In ko, this message translates to:
  /// **'제14조(환급)'**
  String get termOfService14;

  /// No description provided for @termOfService14Content1.
  ///
  /// In ko, this message translates to:
  /// **'“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.'**
  String get termOfService14Content1;

  /// No description provided for @termOfService15.
  ///
  /// In ko, this message translates to:
  /// **'제15조(청약철회 등)'**
  String get termOfService15;

  /// No description provided for @termOfService15Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.'**
  String get termOfService15Content1;

  /// No description provided for @termOfService15Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.\n1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)\n2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우\n3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우\n4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우'**
  String get termOfService15Content2;

  /// No description provided for @termOfService15Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.'**
  String get termOfService15Content3;

  /// No description provided for @termOfService15Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.'**
  String get termOfService15Content4;

  /// No description provided for @termOfService16.
  ///
  /// In ko, this message translates to:
  /// **'제16조(청약철회 등의 효과)'**
  String get termOfService16;

  /// No description provided for @termOfService16Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.'**
  String get termOfService16Content1;

  /// No description provided for @termOfService16Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.'**
  String get termOfService16Content2;

  /// No description provided for @termOfService16Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.'**
  String get termOfService16Content3;

  /// No description provided for @termOfService16Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.'**
  String get termOfService16Content4;

  /// No description provided for @termOfService17.
  ///
  /// In ko, this message translates to:
  /// **'제17조(개인정보보호)'**
  String get termOfService17;

  /// No description provided for @termOfService17Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.'**
  String get termOfService17Content1;

  /// No description provided for @termOfService17Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.'**
  String get termOfService17Content2;

  /// No description provided for @termOfService17Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.'**
  String get termOfService17Content3;

  /// No description provided for @termOfService17Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.'**
  String get termOfService17Content4;

  /// No description provided for @termOfService17Content5.
  ///
  /// In ko, this message translates to:
  /// **'⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.'**
  String get termOfService17Content5;

  /// No description provided for @termOfService17Content6.
  ///
  /// In ko, this message translates to:
  /// **'⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.'**
  String get termOfService17Content6;

  /// No description provided for @termOfService17Content7.
  ///
  /// In ko, this message translates to:
  /// **'⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.'**
  String get termOfService17Content7;

  /// No description provided for @termOfService17Content8.
  ///
  /// In ko, this message translates to:
  /// **'⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.'**
  String get termOfService17Content8;

  /// No description provided for @termOfService17Content9.
  ///
  /// In ko, this message translates to:
  /// **'⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.'**
  String get termOfService17Content9;

  /// No description provided for @termOfService18.
  ///
  /// In ko, this message translates to:
  /// **'제18조(“몰“의 의무)'**
  String get termOfService18;

  /// No description provided for @termOfService18Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화.용역을 제공하는데 최선을 다하여야 합니다.'**
  String get termOfService18Content1;

  /// No description provided for @termOfService18Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.'**
  String get termOfService18Content2;

  /// No description provided for @termOfService18Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ “몰”이 상품이나 용역에 대하여 「표시.광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.'**
  String get termOfService18Content3;

  /// No description provided for @termOfService18Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.'**
  String get termOfService18Content4;

  /// No description provided for @termOfService19.
  ///
  /// In ko, this message translates to:
  /// **'제19조(회원의 ID 및 비밀번호에 대한 의무)'**
  String get termOfService19;

  /// No description provided for @termOfService19Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.'**
  String get termOfService19Content1;

  /// No description provided for @termOfService19Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.'**
  String get termOfService19Content2;

  /// No description provided for @termOfService19Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.'**
  String get termOfService19Content3;

  /// No description provided for @termOfService20.
  ///
  /// In ko, this message translates to:
  /// **'제20조(이용자의 의무)'**
  String get termOfService20;

  /// No description provided for @termOfService20Content1.
  ///
  /// In ko, this message translates to:
  /// **'이용자는 다음 행위를 하여서는 안 됩니다.\n1. 신청 또는 변경시 허위 내용의 등록\n2. 타인의 정보 도용\n3. “몰”에 게시된 정보의 변경\n4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시\n5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해\n6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위\n7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위'**
  String get termOfService20Content1;

  /// No description provided for @termOfService21.
  ///
  /// In ko, this message translates to:
  /// **'제21조(연결“몰”과 피연결“몰” 간의 관계)'**
  String get termOfService21;

  /// No description provided for @termOfService21Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.'**
  String get termOfService21Content1;

  /// No description provided for @termOfService21Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.'**
  String get termOfService21Content2;

  /// No description provided for @termOfService22.
  ///
  /// In ko, this message translates to:
  /// **'제22조(저작권의 귀속 및 이용제한)'**
  String get termOfService22;

  /// No description provided for @termOfService22Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.'**
  String get termOfService22Content1;

  /// No description provided for @termOfService22Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.'**
  String get termOfService22Content2;

  /// No description provided for @termOfService22Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.'**
  String get termOfService22Content3;

  /// No description provided for @termOfService23.
  ///
  /// In ko, this message translates to:
  /// **'제23조(분쟁해결)'**
  String get termOfService23;

  /// No description provided for @termOfService23Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.'**
  String get termOfService23Content1;

  /// No description provided for @termOfService23Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.'**
  String get termOfService23Content2;

  /// No description provided for @termOfService23Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.'**
  String get termOfService23Content3;

  /// No description provided for @termOfService24.
  ///
  /// In ko, this message translates to:
  /// **'제24조(재판권 및 준거법)'**
  String get termOfService24;

  /// No description provided for @termOfService24Content1.
  ///
  /// In ko, this message translates to:
  /// **'① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.'**
  String get termOfService24Content1;

  /// No description provided for @termOfService24Content2.
  ///
  /// In ko, this message translates to:
  /// **'② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.'**
  String get termOfService24Content2;

  /// No description provided for @timeTakeEffect.
  ///
  /// In ko, this message translates to:
  /// **'부 칙(시행일) 이 약관은\n2024년 3월 1일부터 시행합니다.'**
  String get timeTakeEffect;

  /// No description provided for @privacyPolicy.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아 이용약관'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyContent.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아는 정보주체의 자유와 권리 보호를 위해 「개인정보 보호법」 및 관계 법령이 정한 바를 준수하여, 적법하게 개인정보를 처리하고 안전하게 관리하고 있습니다. 이에 「개인정보 보호법」 제30조에 따라 정보주체에게 개인정보 처리에 관한 절차 및 기준을 안내하고, 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.'**
  String get privacyPolicyContent;

  /// No description provided for @privacyPolicy1.
  ///
  /// In ko, this message translates to:
  /// **'1. 개인정보의 처리목적'**
  String get privacyPolicy1;

  /// No description provided for @privacyPolicy1Content1.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.'**
  String get privacyPolicy1Content1;

  /// No description provided for @privacyPolicy1Content2.
  ///
  /// In ko, this message translates to:
  /// **'1. 회원 가입 및 관리\n회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다.'**
  String get privacyPolicy1Content2;

  /// No description provided for @privacyPolicy1Content3.
  ///
  /// In ko, this message translates to:
  /// **'2. 재화 또는 서비스 제공\n물품배송, 서비스 제공, 계약서·청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제·정산, 채권추심으로 개인정보를 처리합니다.'**
  String get privacyPolicy1Content3;

  /// No description provided for @privacyPolicy1Content4.
  ///
  /// In ko, this message translates to:
  /// **'3. 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계'**
  String get privacyPolicy1Content4;

  /// No description provided for @privacyPolicy2.
  ///
  /// In ko, this message translates to:
  /// **'2. 개인정보의 처리 및 보유기간'**
  String get privacyPolicy2;

  /// No description provided for @privacyPolicy2Content1.
  ///
  /// In ko, this message translates to:
  /// **'홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지\n다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지'**
  String get privacyPolicy2Content1;

  /// No description provided for @privacyPolicy2Content2.
  ///
  /// In ko, this message translates to:
  /// **'1) 회사 내부방침에 의한 정보보유 사유 회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 oo년간 회원의 정보를 보유할 수 있습니다.'**
  String get privacyPolicy2Content2;

  /// No description provided for @privacyPolicy2Content3.
  ///
  /// In ko, this message translates to:
  /// **'2) 관련 법령에 의한 정보 보유 사유 전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.'**
  String get privacyPolicy2Content3;

  /// No description provided for @privacyPolicy2Content4.
  ///
  /// In ko, this message translates to:
  /// **'계약 또는 청약철회 등에 관한 기록\n보존이유 : 전자상거래등에서의소비자보호에관한법률\n보존기간 : 5년'**
  String get privacyPolicy2Content4;

  /// No description provided for @privacyPolicy2Content5.
  ///
  /// In ko, this message translates to:
  /// **'대금 결제 및 재화 등의 공급에 관한 기록\n보존이유: 전자상거래등에서의소비자보호에관한법률\n보존기간 : 5년'**
  String get privacyPolicy2Content5;

  /// No description provided for @privacyPolicy2Content6.
  ///
  /// In ko, this message translates to:
  /// **'소비자 불만 또는 분쟁처리에 관한 기록\n보존이유 : 전자상거래등에서의소비자보호에관한법률\n보존기간 : 3년'**
  String get privacyPolicy2Content6;

  /// No description provided for @privacyPolicy2Content7.
  ///
  /// In ko, this message translates to:
  /// **'로그 기록\n보존이유 : 통신비밀보호법\n보존기간 : 3개월'**
  String get privacyPolicy2Content7;

  /// No description provided for @privacyPolicy2Content8.
  ///
  /// In ko, this message translates to:
  /// **'3) 홈페이지 이용에 따른 채권·채무관계 잔존 시에는 해당 채권·채무관계 정산 시까지'**
  String get privacyPolicy2Content8;

  /// No description provided for @privacyPolicy3.
  ///
  /// In ko, this message translates to:
  /// **'3. 처리하는 개인정보 항목'**
  String get privacyPolicy3;

  /// No description provided for @privacyPolicy3Content1.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아는 회원가입, 상담, 서비스 신청 등을 위해 다음의 개인정보 항목을 처리하고 있습니다.'**
  String get privacyPolicy3Content1;

  /// No description provided for @privacyPolicy3Content2.
  ///
  /// In ko, this message translates to:
  /// **'1. 회원 가입 및 관리\n이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보\n2. 서비스 신청시\n주소, 결제 정보\n・ 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다.'**
  String get privacyPolicy3Content2;

  /// No description provided for @privacyPolicy4.
  ///
  /// In ko, this message translates to:
  /// **'4. 개인정보 수집방법'**
  String get privacyPolicy4;

  /// No description provided for @privacyPolicy4Content1.
  ///
  /// In ko, this message translates to:
  /// **'홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집'**
  String get privacyPolicy4Content1;

  /// No description provided for @privacyPolicy5.
  ///
  /// In ko, this message translates to:
  /// **'5. 만 14세 미만 아동의 개인정보 처리에 관한 사항'**
  String get privacyPolicy5;

  /// No description provided for @privacyPolicy5Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 성공매니아는 만 14세 미만 아동에 대해 개인정보를 수집할 때 법정대리인의 동의를 얻어 해당 서비스 수행에 필요한 최소한의 개인정보를 수집합니다.\n• 필수항목 : 법정 대리인의 성명, 관계, 연락처'**
  String get privacyPolicy5Content1;

  /// No description provided for @privacyPolicy5Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 또한, 의 관련 홍보를 위해 아동의 개인정보를 수집할 경우에는 법정대리인으로부터 별도의 동의를 얻습니다.'**
  String get privacyPolicy5Content2;

  /// No description provided for @privacyPolicy5Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 성공매니아는 만 14세 미만 아동의 개인정보를 수집할 때에는 아동에게 법정대리인의 성명, 연락처와 같이 최소한의 정보를 요구할 수 있으며, 다음 중 하나의 방법으로 적법한 법정대리인이 동의하였는지를 확인합니다.\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 개인정보처리자가 그 동의 표시를 확인했음을 법정대리인의 휴대전화 문자메시지로 알리는 방법\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 신용카드·직불카드 등의 카드정보를 제공받는 방법\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 휴대전화 본인인증 등을 통해 본인 여부를 확인하는 방법\n• 동의 내용이 적힌 서면을 법정대리인에게 직접 발급하거나, 우편 또는 팩스를 통하여 전달하고 법정대리인이 동의 내용에 대하여 서명날인 후 제출하도록 하는 방법\n• 동의 내용이 적힌 전자우편을 발송하여 법정대리인으로부터 동의의 의사표시가 적힌 전자우편을 전송받는 방법\n• 전화를 통하여 동의 내용을 법정대리인에게 알리고 동의를 얻거나 인터넷주소 등 동의 내용을 확인할 수 있는 방법을 안내하고 재차 전화 통화를 통하여 동의를 얻는 방법\n• 그 밖에 위와 준하는 방법으로 법정대리인에게 동의 내용을 알리고 동의의 의사표시를 확인하는 방법'**
  String get privacyPolicy5Content3;

  /// No description provided for @privacyPolicy6.
  ///
  /// In ko, this message translates to:
  /// **'6. 개인정보의 파기 절차 및 방법'**
  String get privacyPolicy6;

  /// No description provided for @privacyPolicy6Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 성공매니아는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.'**
  String get privacyPolicy6Content1;

  /// No description provided for @privacyPolicy6Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음 에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.'**
  String get privacyPolicy6Content2;

  /// No description provided for @privacyPolicy6Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.\n1. 파기절차 성공매니아는 파기 사유가 발생한 개인정보를 선정하고, 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.\n2. 파기방법 은(는) 전자적 파일 형태로 기록·저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이 문서에 기록·저장된 개인정보는 분쇄기로 분쇄 하거나 소각하여 파기합니다.'**
  String get privacyPolicy6Content3;

  /// No description provided for @privacyPolicy7.
  ///
  /// In ko, this message translates to:
  /// **'7. 정보주체와 법정대리인의 권리·의무 및 행사방법'**
  String get privacyPolicy7;

  /// No description provided for @privacyPolicy7Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 정보주체는 에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.\n※ 만 14세 미만 아동에 관한 개인정보의 열람등 요구는 법정대리인이 직접 해야 하며, 만 14세 이상의 미성년자인 정보주체는 정보주체의 개인정보에 관하여 미성년자 본인이 권리를 행사하거나 법정대리인을 통하여 권리를 행사할 수도 있습니다.'**
  String get privacyPolicy7Content1;

  /// No description provided for @privacyPolicy7Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 권리 행사는 에 대해 「개인정보 보호법」 시행령 제41조 제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며, 성공매니아는 이에 대해 지체없이 조치하겠습니다.'**
  String get privacyPolicy7Content2;

  /// No description provided for @privacyPolicy7Content3.
  ///
  /// In ko, this message translates to:
  /// **'③ 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수도 있습니다. 이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.'**
  String get privacyPolicy7Content3;

  /// No description provided for @privacyPolicy7Content4.
  ///
  /// In ko, this message translates to:
  /// **'④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.'**
  String get privacyPolicy7Content4;

  /// No description provided for @privacyPolicy7Content5.
  ///
  /// In ko, this message translates to:
  /// **'⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.'**
  String get privacyPolicy7Content5;

  /// No description provided for @privacyPolicy7Content6.
  ///
  /// In ko, this message translates to:
  /// **'⑥ 성공매니아는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리 정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.'**
  String get privacyPolicy7Content6;

  /// No description provided for @privacyPolicy8.
  ///
  /// In ko, this message translates to:
  /// **'8. 개인정보의 안전성 확보조치'**
  String get privacyPolicy8;

  /// No description provided for @privacyPolicy8Content1.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.\n1. 관리적 조치 : 내부관리계획 수립·시행, 전담조직 운영, 정기적 직원 교육\n2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 개인정보의 암호화, 보안프로그램 설치 및 갱신\n3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제'**
  String get privacyPolicy8Content1;

  /// No description provided for @privacyPolicy9.
  ///
  /// In ko, this message translates to:
  /// **'9. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항'**
  String get privacyPolicy9;

  /// No description provided for @privacyPolicy9Content1.
  ///
  /// In ko, this message translates to:
  /// **'① 개인정보처리자명>은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용 정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.'**
  String get privacyPolicy9Content1;

  /// No description provided for @privacyPolicy9Content2.
  ///
  /// In ko, this message translates to:
  /// **'② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.\n가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.\n나. 쿠키의 설치·운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.\n다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.'**
  String get privacyPolicy9Content2;

  /// No description provided for @privacyPolicy10.
  ///
  /// In ko, this message translates to:
  /// **'10. 개인정보에 관한 민원서비스'**
  String get privacyPolicy10;

  /// No description provided for @privacyPolicy10Content1.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호책임자를 지정하고 있습니다.'**
  String get privacyPolicy10Content1;

  /// No description provided for @privacyPolicy10Content2.
  ///
  /// In ko, this message translates to:
  /// **'• 개인정보보호담당자\n성명 : 정보경\n소속 : 성공매니아\n전화번호 : 010-8222-8317\n이메일 : bokyeong19@mecelljoo.kr'**
  String get privacyPolicy10Content2;

  /// No description provided for @privacyPolicy10Content3.
  ///
  /// In ko, this message translates to:
  /// **'• 개인정보보호책임자\n성명 : 정보경\n소속 : 성공매니아\n전화번호 : 010-8222-8317\n이메일 : dhcoan12@naver.com'**
  String get privacyPolicy10Content3;

  /// No description provided for @privacyPolicy10Content4.
  ///
  /// In ko, this message translates to:
  /// **'• 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자 혹은 담당부서로 신고하실 수 있습니다.\n• 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.\n• 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.'**
  String get privacyPolicy10Content4;

  /// No description provided for @privacyPolicy10Content5.
  ///
  /// In ko, this message translates to:
  /// **'개인정보침해신고센터\n(privacy.kisa.or.kr / 국번 없이 118)'**
  String get privacyPolicy10Content5;

  /// No description provided for @privacyPolicy10Content6.
  ///
  /// In ko, this message translates to:
  /// **'개인정보분쟁조정위원회\n(kopico.go.kr / 1833-6972)'**
  String get privacyPolicy10Content6;

  /// No description provided for @privacyPolicy10Content7.
  ///
  /// In ko, this message translates to:
  /// **'대검찰청 사이버수사과\n(spo.go.kr / 지역번호+1301)'**
  String get privacyPolicy10Content7;

  /// No description provided for @privacyPolicy10Content8.
  ///
  /// In ko, this message translates to:
  /// **'경찰청 사이버안전국\n(cyberbureau.police.go.kr / 국번없이 182)'**
  String get privacyPolicy10Content8;

  /// No description provided for @minutesAgo.
  ///
  /// In ko, this message translates to:
  /// **'{time}분 전'**
  String minutesAgo(String time);

  /// No description provided for @hoursAgo.
  ///
  /// In ko, this message translates to:
  /// **'{time}시간 전'**
  String hoursAgo(String time);

  /// No description provided for @totalItems.
  ///
  /// In ko, this message translates to:
  /// **'총 {totalItems}개'**
  String totalItems(int totalItems);

  /// No description provided for @notificationAlert.
  ///
  /// In ko, this message translates to:
  /// **'공고'**
  String get notificationAlert;

  /// No description provided for @ok.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get ok;

  /// No description provided for @check.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get check;

  /// No description provided for @comment.
  ///
  /// In ko, this message translates to:
  /// **'댓글'**
  String get comment;

  /// No description provided for @viewProfile.
  ///
  /// In ko, this message translates to:
  /// **'프로필 보기'**
  String get viewProfile;

  /// No description provided for @writer.
  ///
  /// In ko, this message translates to:
  /// **'작성자'**
  String get writer;

  /// No description provided for @writeReply.
  ///
  /// In ko, this message translates to:
  /// **'답글쓰기'**
  String get writeReply;

  /// No description provided for @great.
  ///
  /// In ko, this message translates to:
  /// **'좋아요'**
  String get great;

  /// No description provided for @joinMemberShip.
  ///
  /// In ko, this message translates to:
  /// **'회원가입'**
  String get joinMemberShip;

  /// No description provided for @placeHolderId.
  ///
  /// In ko, this message translates to:
  /// **'아이디'**
  String get placeHolderId;

  /// No description provided for @validationId.
  ///
  /// In ko, this message translates to:
  /// **'영문, 숫자 조합 8자 이내'**
  String get validationId;

  /// No description provided for @placeHolderPassword.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호'**
  String get placeHolderPassword;

  /// No description provided for @validationPassword.
  ///
  /// In ko, this message translates to:
  /// **'영문, 숫자, 특수문자를 포함한 8-16자 조합'**
  String get validationPassword;

  /// No description provided for @doubleCheck.
  ///
  /// In ko, this message translates to:
  /// **'중복확인'**
  String get doubleCheck;

  /// No description provided for @doubleCheckFail.
  ///
  /// In ko, this message translates to:
  /// **'이미 있는 아이디입니다. 다른 아이디를 사용해 주세요.'**
  String get doubleCheckFail;

  /// No description provided for @doubleCheckSuccess.
  ///
  /// In ko, this message translates to:
  /// **'중복 확인 되었습니다. 사용 가능한 아이디 입니다.'**
  String get doubleCheckSuccess;

  /// No description provided for @placeHolderConfirmPassword.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호 확인'**
  String get placeHolderConfirmPassword;

  /// No description provided for @placeHolderName.
  ///
  /// In ko, this message translates to:
  /// **'이름'**
  String get placeHolderName;

  /// No description provided for @placeHolderPhone.
  ///
  /// In ko, this message translates to:
  /// **'전화번호'**
  String get placeHolderPhone;

  /// No description provided for @sendAuthentication.
  ///
  /// In ko, this message translates to:
  /// **'인증번호 전송'**
  String get sendAuthentication;

  /// No description provided for @otpNumber.
  ///
  /// In ko, this message translates to:
  /// **'인증번호'**
  String get otpNumber;

  /// No description provided for @verify.
  ///
  /// In ko, this message translates to:
  /// **'인증하기'**
  String get verify;

  /// No description provided for @placeHolderReferrerPhoneNumber.
  ///
  /// In ko, this message translates to:
  /// **'추천인 전화번호 (선택사항)'**
  String get placeHolderReferrerPhoneNumber;

  /// No description provided for @usernameExisted.
  ///
  /// In ko, this message translates to:
  /// **'이 사용자 이름은 존재합니다.'**
  String get usernameExisted;

  /// No description provided for @phoneNumberExisted.
  ///
  /// In ko, this message translates to:
  /// **'이 전화번호는 이미 사용 중입니다.'**
  String get phoneNumberExisted;

  /// No description provided for @verifyOTPSuccess.
  ///
  /// In ko, this message translates to:
  /// **'OTP 인증 성공'**
  String get verifyOTPSuccess;

  /// No description provided for @empty.
  ///
  /// In ko, this message translates to:
  /// **'이 필드는 비워둘 수 없습니다.'**
  String get empty;

  /// No description provided for @usernameInvalid.
  ///
  /// In ko, this message translates to:
  /// **'영문과 숫자의 조합 6자 이상'**
  String get usernameInvalid;

  /// No description provided for @passwordInvalid.
  ///
  /// In ko, this message translates to:
  /// **'대문자, 소문자 영문, 숫자, 특수문자를 포함하여 8자 이상'**
  String get passwordInvalid;

  /// No description provided for @confirmPasswordNotMatch.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호가 일치하지 않습니다'**
  String get confirmPasswordNotMatch;

  /// No description provided for @phoneInvalid.
  ///
  /// In ko, this message translates to:
  /// **'전화번호 형식이 잘못되었습니다.'**
  String get phoneInvalid;

  /// No description provided for @otpInvalid.
  ///
  /// In ko, this message translates to:
  /// **'6개 숫자 가능'**
  String get otpInvalid;

  /// No description provided for @phoneNumberNotExisted.
  ///
  /// In ko, this message translates to:
  /// **'이 전화번호는 애플리케이션에 존재하지 않습니다.'**
  String get phoneNumberNotExisted;

  /// No description provided for @usernameOfPhoneNumber.
  ///
  /// In ko, this message translates to:
  /// **'{phoneNumber}님의 아이디는'**
  String usernameOfPhoneNumber(String phoneNumber);

  /// No description provided for @couldNotLunch.
  ///
  /// In ko, this message translates to:
  /// **'점심을 못 먹었어요 {content}'**
  String couldNotLunch(String content);

  /// No description provided for @id.
  ///
  /// In ko, this message translates to:
  /// **'입니다'**
  String get id;

  /// No description provided for @resetPassword.
  ///
  /// In ko, this message translates to:
  /// **'비밀번호 재설정'**
  String get resetPassword;

  /// No description provided for @verifyAccountFailed.
  ///
  /// In ko, this message translates to:
  /// **'사용자 이름이 전화번호와 일치하지 않습니다'**
  String get verifyAccountFailed;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In ko, this message translates to:
  /// **'재설정할 비밀번호를 입력해 주세요.'**
  String get pleaseEnterPassword;

  /// No description provided for @passwordCondition.
  ///
  /// In ko, this message translates to:
  /// **'(영문, 숫자, 특수문자를 포함하여 8자 이상 조합)'**
  String get passwordCondition;

  /// No description provided for @button.
  ///
  /// In ko, this message translates to:
  /// **'버튼'**
  String get button;

  /// No description provided for @resetPasswordSuccess.
  ///
  /// In ko, this message translates to:
  /// **'{phoneNumber}님의 비밀번호가\n재설정 되었습니다.'**
  String resetPasswordSuccess(Object phoneNumber);

  /// No description provided for @productInformation.
  ///
  /// In ko, this message translates to:
  /// **'제품 정보'**
  String get productInformation;

  /// No description provided for @review.
  ///
  /// In ko, this message translates to:
  /// **'후기'**
  String get review;

  /// No description provided for @inquiry.
  ///
  /// In ko, this message translates to:
  /// **'문의'**
  String get inquiry;

  /// No description provided for @purchaseReview.
  ///
  /// In ko, this message translates to:
  /// **'구매후기'**
  String get purchaseReview;

  /// No description provided for @writeReview.
  ///
  /// In ko, this message translates to:
  /// **'후기 작성'**
  String get writeReview;

  /// No description provided for @shoppingCart.
  ///
  /// In ko, this message translates to:
  /// **'장바구니'**
  String get shoppingCart;

  /// No description provided for @buyNow.
  ///
  /// In ko, this message translates to:
  /// **'바로 구매하기'**
  String get buyNow;

  /// No description provided for @temporaryStorage.
  ///
  /// In ko, this message translates to:
  /// **'임시저장'**
  String get temporaryStorage;

  /// No description provided for @registration.
  ///
  /// In ko, this message translates to:
  /// **'등록'**
  String get registration;

  /// No description provided for @pleaseChooseCategory.
  ///
  /// In ko, this message translates to:
  /// **'카테고리를 선택해주세요.'**
  String get pleaseChooseCategory;

  /// No description provided for @pleaseSelectSubCategory.
  ///
  /// In ko, this message translates to:
  /// **'분류를 선택해주세요.'**
  String get pleaseSelectSubCategory;

  /// No description provided for @pleaseEnterSubject.
  ///
  /// In ko, this message translates to:
  /// **'제목을 입력해주세요.'**
  String get pleaseEnterSubject;

  /// No description provided for @pleaseEnterYourDetails.
  ///
  /// In ko, this message translates to:
  /// **'내용을 입력해주세요.'**
  String get pleaseEnterYourDetails;

  /// No description provided for @editPhoto.
  ///
  /// In ko, this message translates to:
  /// **'사진 편집'**
  String get editPhoto;

  /// No description provided for @notification.
  ///
  /// In ko, this message translates to:
  /// **'알림'**
  String get notification;

  /// No description provided for @writeQA.
  ///
  /// In ko, this message translates to:
  /// **'문의 작성'**
  String get writeQA;

  /// No description provided for @qaCompleted.
  ///
  /// In ko, this message translates to:
  /// **'답변 완료'**
  String get qaCompleted;

  /// No description provided for @qaHidden.
  ///
  /// In ko, this message translates to:
  /// **'비밀글 입니다.'**
  String get qaHidden;

  /// No description provided for @sendWrittenReview.
  ///
  /// In ko, this message translates to:
  /// **'후기 작성하기'**
  String get sendWrittenReview;

  /// No description provided for @productRating.
  ///
  /// In ko, this message translates to:
  /// **'문의 구분'**
  String get productRating;

  /// No description provided for @uploadImage.
  ///
  /// In ko, this message translates to:
  /// **'사진 업로드'**
  String get uploadImage;

  /// No description provided for @writeReviewTextBoxTitle.
  ///
  /// In ko, this message translates to:
  /// **'리뷰 작성'**
  String get writeReviewTextBoxTitle;

  /// No description provided for @writeReviewHintText.
  ///
  /// In ko, this message translates to:
  /// **'상품의 후기를 알려주세요'**
  String get writeReviewHintText;

  /// No description provided for @takePicture.
  ///
  /// In ko, this message translates to:
  /// **'사진촬영'**
  String get takePicture;

  /// No description provided for @pickFromGallery.
  ///
  /// In ko, this message translates to:
  /// **'갤러리에서 사진 선택'**
  String get pickFromGallery;

  /// No description provided for @deletePicture.
  ///
  /// In ko, this message translates to:
  /// **'사진 삭제하기'**
  String get deletePicture;

  /// No description provided for @cancel.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get cancel;

  /// No description provided for @composeQA.
  ///
  /// In ko, this message translates to:
  /// **'상품 문의'**
  String get composeQA;

  /// No description provided for @submitQA.
  ///
  /// In ko, this message translates to:
  /// **'문의하기'**
  String get submitQA;

  /// No description provided for @qaCategoryType.
  ///
  /// In ko, this message translates to:
  /// **'문의 유형'**
  String get qaCategoryType;

  /// No description provided for @qaCategoryTypePlaceHolder.
  ///
  /// In ko, this message translates to:
  /// **'선택'**
  String get qaCategoryTypePlaceHolder;

  /// No description provided for @qaDetails.
  ///
  /// In ko, this message translates to:
  /// **'문의 내용'**
  String get qaDetails;

  /// No description provided for @qaDetailsHintText.
  ///
  /// In ko, this message translates to:
  /// **'문의 내용을 입력하세요'**
  String get qaDetailsHintText;

  /// No description provided for @favoriteBoard.
  ///
  /// In ko, this message translates to:
  /// **'즐겨찾기 게시판'**
  String get favoriteBoard;

  /// No description provided for @follower.
  ///
  /// In ko, this message translates to:
  /// **'팔로워'**
  String get follower;

  /// No description provided for @delete.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get delete;

  /// No description provided for @followManage.
  ///
  /// In ko, this message translates to:
  /// **'팔로우 관리'**
  String get followManage;

  /// No description provided for @referrerStatus.
  ///
  /// In ko, this message translates to:
  /// **'추천인 현황'**
  String get referrerStatus;

  /// No description provided for @currentReferrer.
  ///
  /// In ko, this message translates to:
  /// **'현재 추천인 수'**
  String get currentReferrer;

  /// No description provided for @numberPeople.
  ///
  /// In ko, this message translates to:
  /// **'{number}명'**
  String numberPeople(Object number);

  /// No description provided for @currentReferrerList.
  ///
  /// In ko, this message translates to:
  /// **'현재 추천인 리스트'**
  String get currentReferrerList;

  /// No description provided for @next.
  ///
  /// In ko, this message translates to:
  /// **'다음'**
  String get next;

  /// No description provided for @personalInfoTermAccept.
  ///
  /// In ko, this message translates to:
  /// **'(필수) 개인정보 처리방침 동의'**
  String get personalInfoTermAccept;

  /// No description provided for @smTermAccept.
  ///
  /// In ko, this message translates to:
  /// **'(필수) 서비스 이용약관 동의'**
  String get smTermAccept;

  /// No description provided for @view.
  ///
  /// In ko, this message translates to:
  /// **'보기'**
  String get view;

  /// No description provided for @agreeToTermAndCond.
  ///
  /// In ko, this message translates to:
  /// **'약관 동의'**
  String get agreeToTermAndCond;

  /// No description provided for @termOfUseSMMall.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아몰 이용약관 동의'**
  String get termOfUseSMMall;

  /// No description provided for @termOfUseSMMallTitle.
  ///
  /// In ko, this message translates to:
  /// **'성공매니아몰 이용약관'**
  String get termOfUseSMMallTitle;

  /// No description provided for @successSecretOfTop1.
  ///
  /// In ko, this message translates to:
  /// **'상위 1% 사업가들이 알려주는\n성공 비밀'**
  String get successSecretOfTop1;

  /// No description provided for @termAndCondDetails.
  ///
  /// In ko, this message translates to:
  /// **'이용정책 및 약관'**
  String get termAndCondDetails;

  /// No description provided for @cartItemAmount.
  ///
  /// In ko, this message translates to:
  /// **'총 {amount}개'**
  String cartItemAmount(int amount);

  /// No description provided for @selectAll.
  ///
  /// In ko, this message translates to:
  /// **'전체선택'**
  String get selectAll;

  /// No description provided for @editBusinessCard.
  ///
  /// In ko, this message translates to:
  /// **'명함 수정하기'**
  String get editBusinessCard;

  /// No description provided for @businessCardDetails.
  ///
  /// In ko, this message translates to:
  /// **'명함 자세히 보기'**
  String get businessCardDetails;

  /// No description provided for @activity.
  ///
  /// In ko, this message translates to:
  /// **'활동'**
  String get activity;

  /// No description provided for @followManagement.
  ///
  /// In ko, this message translates to:
  /// **'팔로우 관리'**
  String get followManagement;

  /// No description provided for @favoritesBulletinBoard.
  ///
  /// In ko, this message translates to:
  /// **'즐겨찾기 게시판'**
  String get favoritesBulletinBoard;

  /// No description provided for @curationActivities.
  ///
  /// In ko, this message translates to:
  /// **'큐레이션 활동'**
  String get curationActivities;

  /// No description provided for @communityActivities.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티 활동'**
  String get communityActivities;

  /// No description provided for @myDeliveryInformation.
  ///
  /// In ko, this message translates to:
  /// **'나의 배송정보'**
  String get myDeliveryInformation;

  /// No description provided for @checkOrderDeliveryDetails.
  ///
  /// In ko, this message translates to:
  /// **'주문배송내역 조회'**
  String get checkOrderDeliveryDetails;

  /// No description provided for @inquiryDetails.
  ///
  /// In ko, this message translates to:
  /// **'문의내역'**
  String get inquiryDetails;

  /// No description provided for @etc.
  ///
  /// In ko, this message translates to:
  /// **'기타'**
  String get etc;

  /// No description provided for @recommenderStatus.
  ///
  /// In ko, this message translates to:
  /// **'추천인 현황'**
  String get recommenderStatus;

  /// No description provided for @entire.
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get entire;

  /// No description provided for @beforeDelivery.
  ///
  /// In ko, this message translates to:
  /// **'배송전'**
  String get beforeDelivery;

  /// No description provided for @shipping.
  ///
  /// In ko, this message translates to:
  /// **'배송중'**
  String get shipping;

  /// No description provided for @deliveryComplete.
  ///
  /// In ko, this message translates to:
  /// **'배송완료'**
  String get deliveryComplete;

  /// No description provided for @refund.
  ///
  /// In ko, this message translates to:
  /// **'반품/환불'**
  String get refund;

  /// No description provided for @exchange.
  ///
  /// In ko, this message translates to:
  /// **'교환'**
  String get exchange;

  /// No description provided for @deliveryInquiry.
  ///
  /// In ko, this message translates to:
  /// **'배송조회'**
  String get deliveryInquiry;

  /// No description provided for @orderDetails.
  ///
  /// In ko, this message translates to:
  /// **'주문 상세보기'**
  String get orderDetails;

  /// No description provided for @numberProducts.
  ///
  /// In ko, this message translates to:
  /// **'{number}개'**
  String numberProducts(Object number);

  /// No description provided for @paymentInformation.
  ///
  /// In ko, this message translates to:
  /// **'결제 정보'**
  String get paymentInformation;

  /// No description provided for @totalProductAmount.
  ///
  /// In ko, this message translates to:
  /// **'총 상품금액'**
  String get totalProductAmount;

  /// No description provided for @deliveryFee.
  ///
  /// In ko, this message translates to:
  /// **'배송비'**
  String get deliveryFee;

  /// No description provided for @totalDiscountAmount.
  ///
  /// In ko, this message translates to:
  /// **'총 할인금액'**
  String get totalDiscountAmount;

  /// No description provided for @paymentAmount.
  ///
  /// In ko, this message translates to:
  /// **'결제금액'**
  String get paymentAmount;

  /// No description provided for @pointAccumulation.
  ///
  /// In ko, this message translates to:
  /// **'포인트 적립'**
  String get pointAccumulation;

  /// No description provided for @paymentReceipt.
  ///
  /// In ko, this message translates to:
  /// **'결제 영수증'**
  String get paymentReceipt;

  /// No description provided for @accumulationExpected.
  ///
  /// In ko, this message translates to:
  /// **'적립 예정'**
  String get accumulationExpected;

  /// No description provided for @ordererInformation.
  ///
  /// In ko, this message translates to:
  /// **'주문자 정보'**
  String get ordererInformation;

  /// No description provided for @phoneNumber.
  ///
  /// In ko, this message translates to:
  /// **'전화번호'**
  String get phoneNumber;

  /// No description provided for @email.
  ///
  /// In ko, this message translates to:
  /// **'이메일'**
  String get email;

  /// No description provided for @deliveryInformation.
  ///
  /// In ko, this message translates to:
  /// **'배송 정보'**
  String get deliveryInformation;

  /// No description provided for @orderPayment.
  ///
  /// In ko, this message translates to:
  /// **'주문 /  결제'**
  String get orderPayment;

  /// No description provided for @orderer.
  ///
  /// In ko, this message translates to:
  /// **'주문자'**
  String get orderer;

  /// No description provided for @changeAddress.
  ///
  /// In ko, this message translates to:
  /// **'배송지 변경'**
  String get changeAddress;

  /// No description provided for @defaultShippingAddress.
  ///
  /// In ko, this message translates to:
  /// **'기본배송지'**
  String get defaultShippingAddress;

  /// No description provided for @addShippingAddress.
  ///
  /// In ko, this message translates to:
  /// **'배송지 추가'**
  String get addShippingAddress;

  /// No description provided for @add.
  ///
  /// In ko, this message translates to:
  /// **'추가하기'**
  String get add;

  /// No description provided for @whatYouWrote.
  ///
  /// In ko, this message translates to:
  /// **'작성한 글'**
  String get whatYouWrote;

  /// No description provided for @postWithComment.
  ///
  /// In ko, this message translates to:
  /// **'댓글 작성한 글'**
  String get postWithComment;

  /// No description provided for @likedPost.
  ///
  /// In ko, this message translates to:
  /// **'좋아요한 글'**
  String get likedPost;

  /// No description provided for @justNow.
  ///
  /// In ko, this message translates to:
  /// **'방금'**
  String get justNow;

  /// No description provided for @noPost.
  ///
  /// In ko, this message translates to:
  /// **'게시물이 없습니다'**
  String get noPost;

  /// No description provided for @exploreOurCommunity.
  ///
  /// In ko, this message translates to:
  /// **'커뮤니티 둘러보기'**
  String get exploreOurCommunity;

  /// No description provided for @exploreCurator.
  ///
  /// In ko, this message translates to:
  /// **'큐레이션 둘러보기'**
  String get exploreCurator;

  /// No description provided for @myProfile.
  ///
  /// In ko, this message translates to:
  /// **'프로필'**
  String get myProfile;

  /// No description provided for @businessCardEdit.
  ///
  /// In ko, this message translates to:
  /// **'명함 수정'**
  String get businessCardEdit;

  /// No description provided for @basicInformation.
  ///
  /// In ko, this message translates to:
  /// **'기본정보'**
  String get basicInformation;

  /// No description provided for @socialMedia.
  ///
  /// In ko, this message translates to:
  /// **'소셜 미디어'**
  String get socialMedia;

  /// No description provided for @linkUrl.
  ///
  /// In ko, this message translates to:
  /// **'링크 URL'**
  String get linkUrl;

  /// No description provided for @snsSelect.
  ///
  /// In ko, this message translates to:
  /// **'SNS 선택'**
  String get snsSelect;

  /// No description provided for @addition.
  ///
  /// In ko, this message translates to:
  /// **'추가'**
  String get addition;

  /// No description provided for @fileAttach.
  ///
  /// In ko, this message translates to:
  /// **'파일첨부'**
  String get fileAttach;

  /// No description provided for @list.
  ///
  /// In ko, this message translates to:
  /// **'목록'**
  String get list;

  /// No description provided for @title.
  ///
  /// In ko, this message translates to:
  /// **'제목'**
  String get title;

  /// No description provided for @imageFile.
  ///
  /// In ko, this message translates to:
  /// **'이미지 파일'**
  String get imageFile;

  /// No description provided for @deletePhoto.
  ///
  /// In ko, this message translates to:
  /// **'사진 삭제하기'**
  String get deletePhoto;

  /// No description provided for @changePhoto.
  ///
  /// In ko, this message translates to:
  /// **'사진 변경'**
  String get changePhoto;

  /// No description provided for @follow.
  ///
  /// In ko, this message translates to:
  /// **'팔로우'**
  String get follow;

  /// No description provided for @following.
  ///
  /// In ko, this message translates to:
  /// **'팔로우 중'**
  String get following;

  /// No description provided for @setting.
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get setting;

  /// No description provided for @accountInformationManagement.
  ///
  /// In ko, this message translates to:
  /// **'계정정보 관리'**
  String get accountInformationManagement;

  /// No description provided for @signInWithNaver.
  ///
  /// In ko, this message translates to:
  /// **'네이버 연동 중'**
  String get signInWithNaver;

  /// No description provided for @signInWithKakao.
  ///
  /// In ko, this message translates to:
  /// **'카카오 연동 중'**
  String get signInWithKakao;

  /// No description provided for @signInWithGoogle.
  ///
  /// In ko, this message translates to:
  /// **'구글 연동 중'**
  String get signInWithGoogle;

  /// No description provided for @signInWithApple.
  ///
  /// In ko, this message translates to:
  /// **'애플 연동 중'**
  String get signInWithApple;

  /// No description provided for @notificationSettings.
  ///
  /// In ko, this message translates to:
  /// **'알림 설정'**
  String get notificationSettings;

  /// No description provided for @languageSettings.
  ///
  /// In ko, this message translates to:
  /// **'언어 설정'**
  String get languageSettings;

  /// No description provided for @korean.
  ///
  /// In ko, this message translates to:
  /// **'한국어'**
  String get korean;

  /// No description provided for @usagePolicy.
  ///
  /// In ko, this message translates to:
  /// **'이용정책'**
  String get usagePolicy;

  /// No description provided for @logout.
  ///
  /// In ko, this message translates to:
  /// **'로그아웃'**
  String get logout;

  /// No description provided for @edit.
  ///
  /// In ko, this message translates to:
  /// **'편집'**
  String get edit;

  /// No description provided for @withdrawal.
  ///
  /// In ko, this message translates to:
  /// **'회원 탈퇴'**
  String get withdrawal;

  /// No description provided for @save.
  ///
  /// In ko, this message translates to:
  /// **'저장하기'**
  String get save;

  /// No description provided for @changePassword.
  ///
  /// In ko, this message translates to:
  /// **'비빌번호 변경'**
  String get changePassword;

  /// No description provided for @editCellPhoneNumber.
  ///
  /// In ko, this message translates to:
  /// **'핸드폰 번호 수정'**
  String get editCellPhoneNumber;

  /// No description provided for @followNewPostNotification.
  ///
  /// In ko, this message translates to:
  /// **'팔로우 새글 알람'**
  String get followNewPostNotification;

  /// No description provided for @commentAlert.
  ///
  /// In ko, this message translates to:
  /// **'댓글 알람'**
  String get commentAlert;

  /// No description provided for @likeAlert.
  ///
  /// In ko, this message translates to:
  /// **'좋아요 알람'**
  String get likeAlert;

  /// No description provided for @termAndPolicyConditions.
  ///
  /// In ko, this message translates to:
  /// **'이용정책 및 약관'**
  String get termAndPolicyConditions;

  /// No description provided for @currentPassword.
  ///
  /// In ko, this message translates to:
  /// **'현재 비밀번호'**
  String get currentPassword;

  /// No description provided for @passwordToChange.
  ///
  /// In ko, this message translates to:
  /// **'변경 할 비밀번호'**
  String get passwordToChange;

  /// No description provided for @change.
  ///
  /// In ko, this message translates to:
  /// **'변경하기'**
  String get change;

  /// No description provided for @changePhoneNumber.
  ///
  /// In ko, this message translates to:
  /// **'전화번호 변경'**
  String get changePhoneNumber;

  /// No description provided for @recentSearches.
  ///
  /// In ko, this message translates to:
  /// **'최근 검색어'**
  String get recentSearches;

  /// No description provided for @clearAllHistory.
  ///
  /// In ko, this message translates to:
  /// **'검색기록 전체 삭제'**
  String get clearAllHistory;

  /// No description provided for @someThingWentWrong.
  ///
  /// In ko, this message translates to:
  /// **'문제가 발생했습니다.'**
  String get someThingWentWrong;

  /// No description provided for @addThumbnail.
  ///
  /// In ko, this message translates to:
  /// **'썸네일 추가'**
  String get addThumbnail;

  /// No description provided for @selectLanguage.
  ///
  /// In ko, this message translates to:
  /// **'언어 선택'**
  String get selectLanguage;

  /// No description provided for @someError.
  ///
  /// In ko, this message translates to:
  /// **'오류가 발생했습니다.'**
  String get someError;

  /// No description provided for @product.
  ///
  /// In ko, this message translates to:
  /// **'상품'**
  String get product;

  /// No description provided for @delivery.
  ///
  /// In ko, this message translates to:
  /// **'배송'**
  String get delivery;

  /// No description provided for @other.
  ///
  /// In ko, this message translates to:
  /// **'기타'**
  String get other;

  /// No description provided for @loginAndSignUp.
  ///
  /// In ko, this message translates to:
  /// **'로그인 및 회원가입'**
  String get loginAndSignUp;

  /// No description provided for @youNeedToLoginToAccessThisContent.
  ///
  /// In ko, this message translates to:
  /// **'이 콘텐츠에 접근하려면 로그인이 필요합니다'**
  String get youNeedToLoginToAccessThisContent;

  /// No description provided for @goToLoginPage.
  ///
  /// In ko, this message translates to:
  /// **'로그인 페이지로 이동'**
  String get goToLoginPage;

  /// No description provided for @pleaseLoginToViewRegisteredInformation.
  ///
  /// In ko, this message translates to:
  /// **'이 기능은 로그인이 필요합니다. 로그인하시겠습니까?'**
  String get pleaseLoginToViewRegisteredInformation;

  /// No description provided for @alertProductAddedToCart.
  ///
  /// In ko, this message translates to:
  /// **'장바구니에 추가된 제품'**
  String get alertProductAddedToCart;

  /// No description provided for @orderProduct.
  ///
  /// In ko, this message translates to:
  /// **'주문상품'**
  String get orderProduct;

  /// No description provided for @addressSearch.
  ///
  /// In ko, this message translates to:
  /// **'주소 검색'**
  String get addressSearch;

  /// No description provided for @totalPrice.
  ///
  /// In ko, this message translates to:
  /// **'총 {totalProduct}개 {price}원'**
  String totalPrice(Object price, Object totalProduct);

  /// No description provided for @totalPriceWithoutNumber.
  ///
  /// In ko, this message translates to:
  /// **'{price}원 결제하기'**
  String totalPriceWithoutNumber(double price);

  /// No description provided for @orderProductAgree.
  ///
  /// In ko, this message translates to:
  /// **'주문할 상품의 상품명, 상품가격, 배송 정보를 확인하였으며,구매에 동의합니다.'**
  String get orderProductAgree;

  /// No description provided for @addToCart.
  ///
  /// In ko, this message translates to:
  /// **'장바구니에 추가'**
  String get addToCart;

  /// No description provided for @leaveAComment.
  ///
  /// In ko, this message translates to:
  /// **'댓글 남기기'**
  String get leaveAComment;

  /// No description provided for @replyingTo.
  ///
  /// In ko, this message translates to:
  /// **'에 응답하다: '**
  String get replyingTo;

  /// No description provided for @editingComment.
  ///
  /// In ko, this message translates to:
  /// **'댓글 편집...'**
  String get editingComment;

  /// No description provided for @noFollowers.
  ///
  /// In ko, this message translates to:
  /// **'팔로어가 없습니다.'**
  String get noFollowers;

  /// No description provided for @noFollowings.
  ///
  /// In ko, this message translates to:
  /// **'다음이 없습니다.'**
  String get noFollowings;

  /// No description provided for @paymentFailedMessage.
  ///
  /// In ko, this message translates to:
  /// **'결제에 실패했습니다.\n다시 시도해 주세요.'**
  String get paymentFailedMessage;

  /// No description provided for @paymentSuccessMessage.
  ///
  /// In ko, this message translates to:
  /// **'결제가 완료되었습니다.\n 주문해주셔서 감사합니다..'**
  String get paymentSuccessMessage;

  /// No description provided for @apply.
  ///
  /// In ko, this message translates to:
  /// **'신청하기'**
  String get apply;

  /// No description provided for @noPostDisplayed.
  ///
  /// In ko, this message translates to:
  /// **'표시된 게시물이 없습니다.'**
  String get noPostDisplayed;

  /// No description provided for @urlInvalid.
  ///
  /// In ko, this message translates to:
  /// **'유효하지 않은 URL입니다.'**
  String get urlInvalid;

  /// No description provided for @copiedToClipboard.
  ///
  /// In ko, this message translates to:
  /// **'클립보드에 복사되었습니다.'**
  String get copiedToClipboard;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 이메일 형식'**
  String get invalidEmailFormat;

  /// No description provided for @areYouSureYouWantToUnregister.
  ///
  /// In ko, this message translates to:
  /// **'탈퇴 하시겠습니까? 탈퇴 후 작성한 글은 자동 삭제 되지 않습니다. 탈퇴 후 취소가 불가합니다.'**
  String get areYouSureYouWantToUnregister;

  /// No description provided for @areYouSureYouWantToDelete.
  ///
  /// In ko, this message translates to:
  /// **'정말로 삭제하시겠습니까?'**
  String get areYouSureYouWantToDelete;

  /// No description provided for @inquiryCategory.
  ///
  /// In ko, this message translates to:
  /// **'문의 구분'**
  String get inquiryCategory;

  /// No description provided for @answerComplete.
  ///
  /// In ko, this message translates to:
  /// **'답변완료'**
  String get answerComplete;

  /// No description provided for @emptyList.
  ///
  /// In ko, this message translates to:
  /// **'공허한'**
  String get emptyList;

  /// No description provided for @savePostSuccess.
  ///
  /// In ko, this message translates to:
  /// **'게시물이 저장되었습니다'**
  String get savePostSuccess;

  /// No description provided for @unconfirmed.
  ///
  /// In ko, this message translates to:
  /// **'주문 완료'**
  String get unconfirmed;

  /// No description provided for @confirmed.
  ///
  /// In ko, this message translates to:
  /// **'배송 전'**
  String get confirmed;

  /// No description provided for @delivered.
  ///
  /// In ko, this message translates to:
  /// **'배달 완료'**
  String get delivered;

  /// No description provided for @informationSupplement.
  ///
  /// In ko, this message translates to:
  /// **'정보 보충'**
  String get informationSupplement;

  /// No description provided for @commentMyPost.
  ///
  /// In ko, this message translates to:
  /// **'논평'**
  String get commentMyPost;

  /// No description provided for @followingUploadPost.
  ///
  /// In ko, this message translates to:
  /// **'새 글'**
  String get followingUploadPost;

  /// No description provided for @reactMyPost.
  ///
  /// In ko, this message translates to:
  /// **'반작용'**
  String get reactMyPost;

  /// No description provided for @shareSuccessfully.
  ///
  /// In ko, this message translates to:
  /// **'성공적으로 공유되었습니다'**
  String get shareSuccessfully;

  /// No description provided for @daddrs1000.
  ///
  /// In ko, this message translates to:
  /// **'주소를 찾을 수 없습니다.'**
  String get daddrs1000;

  /// No description provided for @aa1000.
  ///
  /// In ko, this message translates to:
  /// **'사용자를 찾을 수 없습니다.'**
  String get aa1000;

  /// No description provided for @aa1001.
  ///
  /// In ko, this message translates to:
  /// **'접근이 거부되었습니다.'**
  String get aa1001;

  /// No description provided for @aa1002.
  ///
  /// In ko, this message translates to:
  /// **'액세스 토큰이 만료되었습니다.'**
  String get aa1002;

  /// No description provided for @aa1003.
  ///
  /// In ko, this message translates to:
  /// **'리프레시 토큰이 만료되었습니다.'**
  String get aa1003;

  /// No description provided for @aa1004.
  ///
  /// In ko, this message translates to:
  /// **'세션 토큰이 만료되었습니다.'**
  String get aa1004;

  /// No description provided for @aa1005.
  ///
  /// In ko, this message translates to:
  /// **'토큰이 유효하지 않습니다.'**
  String get aa1005;

  /// No description provided for @aa1006.
  ///
  /// In ko, this message translates to:
  /// **'Google ID 토큰이 유효하지 않습니다.'**
  String get aa1006;

  /// No description provided for @aa1007.
  ///
  /// In ko, this message translates to:
  /// **'OTP를 보낼 수 없습니다.'**
  String get aa1007;

  /// No description provided for @aa1008.
  ///
  /// In ko, this message translates to:
  /// **'OTP가 만료되었습니다.'**
  String get aa1008;

  /// No description provided for @aa1009.
  ///
  /// In ko, this message translates to:
  /// **'OTP가 일치하지 않습니다.'**
  String get aa1009;

  /// No description provided for @aa1010.
  ///
  /// In ko, this message translates to:
  /// **'이 사용자에게는 인증 방법이 지원되지 않습니다.'**
  String get aa1010;

  /// No description provided for @aa1011.
  ///
  /// In ko, this message translates to:
  /// **'Kakao 토큰이 유효하지 않습니다.'**
  String get aa1011;

  /// No description provided for @aa1012.
  ///
  /// In ko, this message translates to:
  /// **'Naver 토큰이 유효하지 않습니다.'**
  String get aa1012;

  /// No description provided for @a1001.
  ///
  /// In ko, this message translates to:
  /// **'내부 서버 오류'**
  String get a1001;

  /// No description provided for @a1002.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 요청 데이터'**
  String get a1002;

  /// No description provided for @a1003.
  ///
  /// In ko, this message translates to:
  /// **'지원되지 않는 요청 메서드'**
  String get a1003;

  /// No description provided for @dcrt1000.
  ///
  /// In ko, this message translates to:
  /// **'카트를 찾을 수 없습니다.'**
  String get dcrt1000;

  /// No description provided for @dcrt1001.
  ///
  /// In ko, this message translates to:
  /// **'제품 수량은 재고 수량보다 작거나 같아야 합니다.'**
  String get dcrt1001;

  /// No description provided for @dc1000.
  ///
  /// In ko, this message translates to:
  /// **'두 번째 깊이 카테고리의 하위 카테고리를 추가할 수 없습니다.'**
  String get dc1000;

  /// No description provided for @dc1001.
  ///
  /// In ko, this message translates to:
  /// **'카테고리에 하위 카테고리를 추가할 수 없습니다.'**
  String get dc1001;

  /// No description provided for @dc1002.
  ///
  /// In ko, this message translates to:
  /// **'카테고리 유형이 올바르지 않습니다.'**
  String get dc1002;

  /// No description provided for @dc1003.
  ///
  /// In ko, this message translates to:
  /// **'카테고리를 삭제할 수 없습니다.'**
  String get dc1003;

  /// No description provided for @dc1004.
  ///
  /// In ko, this message translates to:
  /// **'카테고리 이름을 변경할 수 없습니다.'**
  String get dc1004;

  /// No description provided for @dc1005.
  ///
  /// In ko, this message translates to:
  /// **'카테고리를 찾을 수 없습니다.'**
  String get dc1005;

  /// No description provided for @dcmt1000.
  ///
  /// In ko, this message translates to:
  /// **'댓글을 찾을 수 없습니다.'**
  String get dcmt1000;

  /// No description provided for @dcmt1001.
  ///
  /// In ko, this message translates to:
  /// **'상위 댓글을 찾을 수 없습니다.'**
  String get dcmt1001;

  /// No description provided for @dcmt1002.
  ///
  /// In ko, this message translates to:
  /// **'편집 권한이 없습니다.'**
  String get dcmt1002;

  /// No description provided for @dcmt1003.
  ///
  /// In ko, this message translates to:
  /// **'숨겨진 댓글에 답글을 달 수 없습니다.'**
  String get dcmt1003;

  /// No description provided for @dfvrcate1000.
  ///
  /// In ko, this message translates to:
  /// **'즐겨찾는 카테고리는 상위 카테고리만 허용됩니다.'**
  String get dfvrcate1000;

  /// No description provided for @af1000.
  ///
  /// In ko, this message translates to:
  /// **'업로드된 파일 이름이 유효하지 않습니다.'**
  String get af1000;

  /// No description provided for @af1001.
  ///
  /// In ko, this message translates to:
  /// **'지원되지 않는 파일 유형'**
  String get af1001;

  /// No description provided for @af1002.
  ///
  /// In ko, this message translates to:
  /// **'파일 구문 분석 오류'**
  String get af1002;

  /// No description provided for @dfile1000.
  ///
  /// In ko, this message translates to:
  /// **'파일을 찾을 수 없습니다.'**
  String get dfile1000;

  /// No description provided for @dfl1000.
  ///
  /// In ko, this message translates to:
  /// **'자신을 팔로우할 수 없습니다.'**
  String get dfl1000;

  /// No description provided for @dfl1001.
  ///
  /// In ko, this message translates to:
  /// **'자신을 언팔로우할 수 없습니다.'**
  String get dfl1001;

  /// No description provided for @dl1005.
  ///
  /// In ko, this message translates to:
  /// **'로케일이 지원되지 않습니다.'**
  String get dl1005;

  /// No description provided for @dmp1000.
  ///
  /// In ko, this message translates to:
  /// **'메인 페이지를 찾을 수 없습니다.'**
  String get dmp1000;

  /// No description provided for @dntf1000.
  ///
  /// In ko, this message translates to:
  /// **'알림을 찾을 수 없습니다.'**
  String get dntf1000;

  /// No description provided for @dntfs1000.
  ///
  /// In ko, this message translates to:
  /// **'알림 설정을 찾을 수 없습니다.'**
  String get dntfs1000;

  /// No description provided for @dordd1000.
  ///
  /// In ko, this message translates to:
  /// **'주문 세부 정보를 찾을 수 없습니다.'**
  String get dordd1000;

  /// No description provided for @aods1.
  ///
  /// In ko, this message translates to:
  /// **'주문 세부 세션을 찾을 수 없습니다.'**
  String get aods1;

  /// No description provided for @dord1000.
  ///
  /// In ko, this message translates to:
  /// **'주문 실패'**
  String get dord1000;

  /// No description provided for @dord1001.
  ///
  /// In ko, this message translates to:
  /// **'주문을 찾을 수 없습니다.'**
  String get dord1001;

  /// No description provided for @dord1002.
  ///
  /// In ko, this message translates to:
  /// **'이 주문은 이 사용자에게 속하지 않습니다.'**
  String get dord1002;

  /// No description provided for @dord1003.
  ///
  /// In ko, this message translates to:
  /// **'주문은 未確認 - 確認済み 상태에서만 취소할 수 있습니다.'**
  String get dord1003;

  /// No description provided for @dord1004.
  ///
  /// In ko, this message translates to:
  /// **'주문은 未確認 - 確認済み - 배달 중 상태에서만 취소할 수 있습니다.'**
  String get dord1004;

  /// No description provided for @dord1005.
  ///
  /// In ko, this message translates to:
  /// **'관리자만 주문 상태를 다음과 같이 변경할 수 있습니다: 未確認 -> 確認済み -> 배달 중 -> 配送済み'**
  String get dord1005;

  /// No description provided for @dord1006.
  ///
  /// In ko, this message translates to:
  /// **'관리자만 주문 상태를 다음과 같이 환불할 수 있습니다: 취소 -> 환불'**
  String get dord1006;

  /// No description provided for @dord1007.
  ///
  /// In ko, this message translates to:
  /// **'환불 실패'**
  String get dord1007;

  /// No description provided for @aos1.
  ///
  /// In ko, this message translates to:
  /// **'주문 세션을 찾을 수 없습니다.'**
  String get aos1;

  /// No description provided for @aos2.
  ///
  /// In ko, this message translates to:
  /// **'제품 수량은 재고 수량보다 작거나 같아야 합니다.'**
  String get aos2;

  /// No description provided for @dpst1000.
  ///
  /// In ko, this message translates to:
  /// **'게시물을 찾을 수 없습니다.'**
  String get dpst1000;

  /// No description provided for @dpst1001.
  ///
  /// In ko, this message translates to:
  /// **'게시물은 하위 카테고리만 허용됩니다.'**
  String get dpst1001;

  /// No description provided for @dpst1002.
  ///
  /// In ko, this message translates to:
  /// **'게시물은 상위 카테고리만 허용됩니다.'**
  String get dpst1002;

  /// No description provided for @dpst1003.
  ///
  /// In ko, this message translates to:
  /// **'게시물 카테고리가 일치하지 않습니다.'**
  String get dpst1003;

  /// No description provided for @dpst1004.
  ///
  /// In ko, this message translates to:
  /// **'게시물 상위 카테고리가 필요합니다.'**
  String get dpst1004;

  /// No description provided for @dprd1000.
  ///
  /// In ko, this message translates to:
  /// **'제품을 찾을 수 없습니다.'**
  String get dprd1000;

  /// No description provided for @dpu1000.
  ///
  /// In ko, this message translates to:
  /// **'프로필 URL을 찾을 수 없습니다.'**
  String get dpu1000;

  /// No description provided for @dqa1000.
  ///
  /// In ko, this message translates to:
  /// **'질문 및 답변을 찾을 수 없습니다.'**
  String get dqa1000;

  /// No description provided for @dqa1001.
  ///
  /// In ko, this message translates to:
  /// **'다른 사람의 QnA는 삭제할 수 없습니다.'**
  String get dqa1001;

  /// No description provided for @drt1000.
  ///
  /// In ko, this message translates to:
  /// **'평점을 찾을 수 없습니다.'**
  String get drt1000;

  /// No description provided for @drt1001.
  ///
  /// In ko, this message translates to:
  /// **'다른 사람의 리뷰는 삭제할 수 없습니다.'**
  String get drt1001;

  /// No description provided for @drct1000.
  ///
  /// In ko, this message translates to:
  /// **'반응을 찾을 수 없습니다.'**
  String get drct1000;

  /// No description provided for @dsf1000.
  ///
  /// In ko, this message translates to:
  /// **'배송료를 찾을 수 없습니다.'**
  String get dsf1000;

  /// No description provided for @dsm1000.
  ///
  /// In ko, this message translates to:
  /// **'소셜 미디어를 찾을 수 없습니다.'**
  String get dsm1000;

  /// No description provided for @au1000.
  ///
  /// In ko, this message translates to:
  /// **'사용자를 찾을 수 없습니다.'**
  String get au1000;

  /// No description provided for @du1001.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 이메일 형식'**
  String get du1001;

  /// No description provided for @du1002.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 전화 번호 형식'**
  String get du1002;

  /// No description provided for @du1003.
  ///
  /// In ko, this message translates to:
  /// **'사용자 유형은 비밀번호를 허용하지 않습니다.'**
  String get du1003;

  /// No description provided for @du1004.
  ///
  /// In ko, this message translates to:
  /// **'사용자가 이미 추천한 사용자가 있습니다.'**
  String get du1004;

  /// No description provided for @du1005.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 비밀번호'**
  String get du1005;

  /// No description provided for @du1006.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 비밀번호 형식'**
  String get du1006;

  /// No description provided for @du1007.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 사용자 이름 형식'**
  String get du1007;

  /// No description provided for @du1008.
  ///
  /// In ko, this message translates to:
  /// **'중복된 사용자 이름'**
  String get du1008;

  /// No description provided for @du1009.
  ///
  /// In ko, this message translates to:
  /// **'중복된 이메일'**
  String get du1009;

  /// No description provided for @du1010.
  ///
  /// In ko, this message translates to:
  /// **'중복된 사용자 전화 번호'**
  String get du1010;

  /// No description provided for @du1011.
  ///
  /// In ko, this message translates to:
  /// **'소셜 사용자의 이메일을 변경할 수 없습니다.'**
  String get du1011;

  /// No description provided for @du1012.
  ///
  /// In ko, this message translates to:
  /// **'소셜 사용자의 전화 번호를 변경할 수 없습니다.'**
  String get du1012;

  /// No description provided for @du1013.
  ///
  /// In ko, this message translates to:
  /// **'사용자가 등록을 완료하지 않았습니다.'**
  String get du1013;

  /// No description provided for @du1014.
  ///
  /// In ko, this message translates to:
  /// **'사용자에게 정보 보충이 필요하지 않습니다.'**
  String get du1014;

  /// No description provided for @du1015.
  ///
  /// In ko, this message translates to:
  /// **'사용자 역할이 충분하지 않습니다.'**
  String get du1015;

  /// No description provided for @du1016.
  ///
  /// In ko, this message translates to:
  /// **'사용자를 찾을 수 없습니다.'**
  String get du1016;

  /// No description provided for @du1017.
  ///
  /// In ko, this message translates to:
  /// **'시스템 계정을 비활성화할 수 없습니다.'**
  String get du1017;

  /// No description provided for @sw101.
  ///
  /// In ko, this message translates to:
  /// **'발급된 고유키가 존재 하지 않음'**
  String get sw101;

  /// No description provided for @sw102.
  ///
  /// In ko, this message translates to:
  /// **'만료된 키'**
  String get sw102;

  /// No description provided for @sw103.
  ///
  /// In ko, this message translates to:
  /// **'키 사용량 초과'**
  String get sw103;

  /// No description provided for @sw104.
  ///
  /// In ko, this message translates to:
  /// **'유효하지 않은 운송장 번호 혹은 택배사 코드 입력'**
  String get sw104;

  /// No description provided for @sw105.
  ///
  /// In ko, this message translates to:
  /// **'동일한 운송장의 하루 요청 제한 건수 초과'**
  String get sw105;

  /// No description provided for @sw106.
  ///
  /// In ko, this message translates to:
  /// **'운송장 번호 조회 에러'**
  String get sw106;

  /// No description provided for @sw500.
  ///
  /// In ko, this message translates to:
  /// **'서버 에러 입니다'**
  String get sw500;

  /// No description provided for @dtc1001.
  ///
  /// In ko, this message translates to:
  /// **'약관을 찾을 수 없습니다'**
  String get dtc1001;

  /// No description provided for @connectionFailure.
  ///
  /// In ko, this message translates to:
  /// **'서버에 연결할 수 없습니다. 나중에 다시 시도해주세요.'**
  String get connectionFailure;

  /// No description provided for @timeoutFailure.
  ///
  /// In ko, this message translates to:
  /// **'요청 시간이 초과되었습니다.'**
  String get timeoutFailure;

  /// No description provided for @otherDioFailure.
  ///
  /// In ko, this message translates to:
  /// **'문제가 발생했습니다.'**
  String get otherDioFailure;

  /// No description provided for @convertDataFailure.
  ///
  /// In ko, this message translates to:
  /// **'데이터 변환 실패'**
  String get convertDataFailure;

  /// No description provided for @genericFailure.
  ///
  /// In ko, this message translates to:
  /// **'일반적인 실패'**
  String get genericFailure;

  /// No description provided for @persistentFailure.
  ///
  /// In ko, this message translates to:
  /// **'지속적인 실패'**
  String get persistentFailure;

  /// No description provided for @recipient.
  ///
  /// In ko, this message translates to:
  /// **'받는 사람'**
  String get recipient;

  /// No description provided for @address.
  ///
  /// In ko, this message translates to:
  /// **'주소'**
  String get address;

  /// No description provided for @checkAddressSearch.
  ///
  /// In ko, this message translates to:
  /// **'주소 검색'**
  String get checkAddressSearch;

  /// No description provided for @enterDetailedAddress.
  ///
  /// In ko, this message translates to:
  /// **'상세주소 입력'**
  String get enterDetailedAddress;

  /// No description provided for @setDefaultAddress.
  ///
  /// In ko, this message translates to:
  /// **'기본배송지 설정'**
  String get setDefaultAddress;

  /// No description provided for @longVideo.
  ///
  /// In ko, this message translates to:
  /// **'긴 영상'**
  String get longVideo;

  /// No description provided for @shortVideo.
  ///
  /// In ko, this message translates to:
  /// **'짧은 영상'**
  String get shortVideo;

  /// No description provided for @reaction.
  ///
  /// In ko, this message translates to:
  /// **'반응'**
  String get reaction;

  /// No description provided for @viewDetails.
  ///
  /// In ko, this message translates to:
  /// **'상세보기'**
  String get viewDetails;

  /// No description provided for @areYouSureYouWantToCancelThisOrder.
  ///
  /// In ko, this message translates to:
  /// **'정말 이 주문을 취소하시겠습니까?'**
  String get areYouSureYouWantToCancelThisOrder;

  /// No description provided for @deliveryStatus.
  ///
  /// In ko, this message translates to:
  /// **'배송 상태'**
  String get deliveryStatus;

  /// No description provided for @waybillNumber.
  ///
  /// In ko, this message translates to:
  /// **'운송장 번호'**
  String get waybillNumber;

  /// No description provided for @productAcceptance.
  ///
  /// In ko, this message translates to:
  /// **'상품인수'**
  String get productAcceptance;

  /// No description provided for @productInTransit.
  ///
  /// In ko, this message translates to:
  /// **'상품이동중'**
  String get productInTransit;

  /// No description provided for @deliveryArrived.
  ///
  /// In ko, this message translates to:
  /// **'배송지도착'**
  String get deliveryArrived;

  /// No description provided for @startDelivery.
  ///
  /// In ko, this message translates to:
  /// **'배송출발'**
  String get startDelivery;

  /// No description provided for @deliveryInformationHasNotBeenUpdated.
  ///
  /// In ko, this message translates to:
  /// **'배송정보가 업데이트되지 않았습니다. 나중에 다시 시도 해주십시오'**
  String get deliveryInformationHasNotBeenUpdated;

  /// No description provided for @dicountInvalid.
  ///
  /// In ko, this message translates to:
  /// **'할인 금액은 주문 금액의 30%를 초과할 수 없습니다.'**
  String get dicountInvalid;

  /// No description provided for @payment.
  ///
  /// In ko, this message translates to:
  /// **'지불'**
  String get payment;

  /// No description provided for @inquiryHistory.
  ///
  /// In ko, this message translates to:
  /// **'문의내역'**
  String get inquiryHistory;

  /// No description provided for @answeredInquiry.
  ///
  /// In ko, this message translates to:
  /// **'답변됨'**
  String get answeredInquiry;

  /// No description provided for @pending.
  ///
  /// In ko, this message translates to:
  /// **'보류 중'**
  String get pending;

  /// No description provided for @small.
  ///
  /// In ko, this message translates to:
  /// **'작은'**
  String get small;

  /// No description provided for @normal.
  ///
  /// In ko, this message translates to:
  /// **'보통의'**
  String get normal;

  /// No description provided for @large.
  ///
  /// In ko, this message translates to:
  /// **'큰'**
  String get large;

  /// No description provided for @huge.
  ///
  /// In ko, this message translates to:
  /// **'거대한'**
  String get huge;

  /// No description provided for @content.
  ///
  /// In ko, this message translates to:
  /// **'콘텐츠'**
  String get content;

  /// No description provided for @report.
  ///
  /// In ko, this message translates to:
  /// **'신고하기'**
  String get report;

  /// No description provided for @areYouSureToReportThisPost.
  ///
  /// In ko, this message translates to:
  /// **'해당 글을 신고하시겠습니까?'**
  String get areYouSureToReportThisPost;

  /// No description provided for @areYouSureToReportThisComment.
  ///
  /// In ko, this message translates to:
  /// **'해당 댓글을 신고하시겠습니까?'**
  String get areYouSureToReportThisComment;

  /// No description provided for @areYouSureToReportThisUser.
  ///
  /// In ko, this message translates to:
  /// **'해당 사용자를 신고하시겠습니까?'**
  String get areYouSureToReportThisUser;

  /// No description provided for @reportScreen.
  ///
  /// In ko, this message translates to:
  /// **'신고된 게시물, 댓글, 프로필'**
  String get reportScreen;

  /// No description provided for @reportedPost.
  ///
  /// In ko, this message translates to:
  /// **'신고된 게시물'**
  String get reportedPost;

  /// No description provided for @reportedComment.
  ///
  /// In ko, this message translates to:
  /// **'신고된 댓글'**
  String get reportedComment;

  /// No description provided for @reportedUser.
  ///
  /// In ko, this message translates to:
  /// **'사용자 신고'**
  String get reportedUser;

  /// No description provided for @areYouSureToDeleteThisPost.
  ///
  /// In ko, this message translates to:
  /// **'이 게시물을 삭제하시겠습니까?'**
  String get areYouSureToDeleteThisPost;

  /// No description provided for @areYouSureToDeleteThisComment.
  ///
  /// In ko, this message translates to:
  /// **'이 댓글을 삭제하시겠습니까?'**
  String get areYouSureToDeleteThisComment;

  /// No description provided for @areYouSureToDeleteThisUser.
  ///
  /// In ko, this message translates to:
  /// **'이 사용자를 삭제하시겠습니까?'**
  String get areYouSureToDeleteThisUser;

  /// No description provided for @cancelOrder.
  ///
  /// In ko, this message translates to:
  /// **'주문 취소'**
  String get cancelOrder;

  /// No description provided for @wouldYouLikeSendAnInquiry.
  ///
  /// In ko, this message translates to:
  /// **'문의를 보내시겠습니까?'**
  String get wouldYouLikeSendAnInquiry;

  /// No description provided for @wouldYouLikeUploadPost.
  ///
  /// In ko, this message translates to:
  /// **'포스트를 업로드 하시겠습니까?'**
  String get wouldYouLikeUploadPost;

  /// No description provided for @wouldYouLikeUploadAReview.
  ///
  /// In ko, this message translates to:
  /// **'후기를 업로드 하시겠습니까?'**
  String get wouldYouLikeUploadAReview;

  /// No description provided for @all.
  ///
  /// In ko, this message translates to:
  /// **'모두'**
  String get all;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja', 'ko', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SEn();
    case 'ja': return SJa();
    case 'ko': return SKo();
    case 'zh': return SZh();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
