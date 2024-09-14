import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Korean (`ko`).
class SKo extends S {
  SKo([String locale = 'ko']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get community => '커뮤니티';

  @override
  String get forum => '게시판';

  @override
  String get store => '스토어';

  @override
  String get profile => '마이페이지';

  @override
  String get profileNavText => 'MY';

  @override
  String get news => 'NEWS';

  @override
  String get fullMenu => '전체메뉴';

  @override
  String get bestReview => 'Best Review';

  @override
  String get pressAgainToCloseApp => '앱을 닫으려면 다시 누르세요.';

  @override
  String get seeAll => '전체보기';

  @override
  String get onlineMagazine => 'ONLINE MAGAZINE';

  @override
  String get sgmNews => 'SGM NEWS';

  @override
  String get sungongMuseum => 'SUNGONG MUSEUM';

  @override
  String get communityCategory => '커뮤니티 카테고리';

  @override
  String get bulletBoardCategory => '게시판 카테고리';

  @override
  String get storeCategory => '스토어 카테고리';

  @override
  String get sungongMuseumKo => '성공뮤지엄';

  @override
  String get category => '카테고리';

  @override
  String get companyName => '주식회사 성공매니아';

  @override
  String get ceoTitle => '대표이사 : ';

  @override
  String get ceo => '오채무';

  @override
  String get emailTitle => '이메일 : ';

  @override
  String get emailValue => 'ocm@mecelljoo.kr';

  @override
  String get contactNumberTitle => '대표번호 : ';

  @override
  String get contactNumber => '070-5213-7613';

  @override
  String get businessRegistrationNumberTitle => '사업자등록번호 : ';

  @override
  String get businessRegistrationNumber => '887-87-02726';

  @override
  String get ecommerceRegistrationNumberTitle => '통신판매신고번호 : ';

  @override
  String get ecommerceRegistrationNumber => '2023-충남천안-3531';

  @override
  String get personalInfoProtectionOfficerTitle => '개인정보 보호책임자 : ';

  @override
  String get personalInfoProtectionOfficer => '오채무';

  @override
  String get officerEmailTitle => '담당자 이메일 : ';

  @override
  String get officerEmail => 'ocm@mecelljoo.kr';

  @override
  String get addressTitle => '주소 : ';

  @override
  String get addressValue => '[31156] 충청남도 천안시 서북구 불당22대로 86 (마블러스에스타워) 804호';

  @override
  String get copyrightTitle => '저작권 ';

  @override
  String get copyright => 'ⓒ 2024 성공매니아 All rights reserved.';

  @override
  String get latest => '최신순';

  @override
  String get popular => '인기순';

  @override
  String get recommended => '추천순';

  @override
  String get compose => '글쓰기';

  @override
  String get bestContents => 'Best Contents';

  @override
  String get onlineMagazineKo => '온라인 매거진';

  @override
  String get bestReviewLower => 'Best Review';

  @override
  String get selfEmployment => '자영업';

  @override
  String get sales => '영업';

  @override
  String get houseWife => '주부';

  @override
  String get officeWorkers => '직장인';

  @override
  String get inseldeomBusiness => '인셀덤 사업';

  @override
  String get allPosts => '전체글';

  @override
  String get favoritePosts => '즐겨찾기';

  @override
  String get popularPosts => '인기순';

  @override
  String get curator => '큐레이션';

  @override
  String get unit => '원';

  @override
  String commonCurrencyFormat(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return '$valueString원';
  }

  @override
  String get easyLoginSNS => 'SNS 간편 로그인';

  @override
  String get signIn => '로그인';

  @override
  String get register => '회원가입';

  @override
  String get findId => '아이디 찾기';

  @override
  String get findPassword => '비밀번호 찾기';

  @override
  String get password => '비밀번호';

  @override
  String get username => '아이디';

  @override
  String get termOfService => '성공매니아몰 이용약관';

  @override
  String get termOfServiceTitle => '개인정보 처리방침';

  @override
  String get termOfService1 => '제1조(목적)';

  @override
  String get termOfService1Content1 => '이 약관은 성공매니아 (전자상거래 사업자)가 운영하는 성공매니아 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.\n※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」';

  @override
  String get termOfService2 => '제2조(정의)';

  @override
  String get termOfService2Content1 => '① “몰”이란 성공매니아가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.';

  @override
  String get termOfService2Content2 => '② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.';

  @override
  String get termOfService2Content3 => '③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.';

  @override
  String get termOfService2Content4 => '④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.';

  @override
  String get termOfService3 => '제3조 (약관 등의 명시와 설명 및 개정)';

  @override
  String get termOfService3Content1 => '① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 성공매니아 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.';

  @override
  String get termOfService3Content2 => '② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.';

  @override
  String get termOfService3Content3 => '③ ‘③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.';

  @override
  String get termOfService3Content4 => '④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.';

  @override
  String get termOfService3Content5 => '⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.';

  @override
  String get termOfService3Content6 => '⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.';

  @override
  String get termOfService4 => '제4조(서비스의 제공 및 변경)';

  @override
  String get termOfService4Content1 => '① “몰”은 다음과 같은 업무를 수행합니다.\n1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결\n2. 구매계약이 체결된 재화 또는 용역의 배송\n3. 기타 “몰”이 정하는 업무';

  @override
  String get termOfService4Content2 => '② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.';

  @override
  String get termOfService4Content3 => '③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.';

  @override
  String get termOfService4Content4 => '④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.';

  @override
  String get termOfService5 => '제5조(서비스의 중단)';

  @override
  String get termOfService5Content1 => '① “몰”은 컴퓨터 등 정보통신설비의 보수점검.교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.';

  @override
  String get termOfService5Content2 => '② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.';

  @override
  String get termOfService5Content3 => '③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.';

  @override
  String get termOfService6 => '제6조(회원가입)';

  @override
  String get termOfService6Content1 => '① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.';

  @override
  String get termOfService6Content2 => '② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.\n1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.\n2. 등록 내용에 허위, 기재누락, 오기가 있는 경우\n3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우';

  @override
  String get termOfService6Content3 => '③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.';

  @override
  String get termOfService6Content4 => '④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.';

  @override
  String get termOfService7 => '제7조(회원 탈퇴 및 자격 상실 등)';

  @override
  String get termOfService7Content1 => '① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.';

  @override
  String get termOfService7Content2 => '② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.\n1. 가입 신청 시에 허위 내용을 등록한 경우\n2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우\n3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우\n4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우';

  @override
  String get termOfService7Content3 => '③ “몰”이 회원 자격을 제한.정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.';

  @override
  String get termOfService7Content4 => '④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.';

  @override
  String get termOfService8 => '제8조(회원에 대한 통지)';

  @override
  String get termOfService8Content1 => '① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.';

  @override
  String get termOfService8Content2 => '② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.';

  @override
  String get termOfService9 => '제9조(구매신청)';

  @override
  String get termOfService9Content1 => '① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.\n1. 재화 등의 검색 및 선택\n2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력\n3. 약관내용, 청약철회권이 제한되는 서비스, 배송료.설치비 등의 비용부담과 관련한 내용에 대한 확인\n4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)\n5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의\n6. 결제방법의 선택';

  @override
  String get termOfService9Content2 => '② “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.';

  @override
  String get termOfService10 => '제10조 (계약의 성립)';

  @override
  String get termOfService10Content1 => '① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.\n1. 신청 내용에 허위, 기재누락, 오기가 있는 경우\n2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우\n3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우';

  @override
  String get termOfService10Content2 => '② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.';

  @override
  String get termOfService10Content3 => '③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.';

  @override
  String get termOfService11 => '제11조(지급방법)';

  @override
  String get termOfService11Content1 => '“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다.\n단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.\n1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체\n2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제\n3. 온라인무통장입금\n4. 전자화폐에 의한 결제\n5. 수령 시 대금지급\n6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제\n7. “몰”과 계약을 맺었거나 “몰”이 인정 한 상품권에 의한 결제\n8. 기타 전자적 지급 방법에 의한 대금 지 급 등';

  @override
  String get termOfService12 => '제12조(수신확인통지.구매신청 변경 및 취소)';

  @override
  String get termOfService12Content1 => '① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.';

  @override
  String get termOfService12Content2 => '② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.';

  @override
  String get termOfService13 => '제13조(재화 등의 공급)';

  @override
  String get termOfService13Content1 => '① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.';

  @override
  String get termOfService13Content2 => '② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의.과실이 없음을 입증한 경우에는 그러하지 아니합니다.';

  @override
  String get termOfService14 => '제14조(환급)';

  @override
  String get termOfService14Content1 => '“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.';

  @override
  String get termOfService15 => '제15조(청약철회 등)';

  @override
  String get termOfService15Content1 => '① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.';

  @override
  String get termOfService15Content2 => '② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.\n1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)\n2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우\n3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우\n4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우';

  @override
  String get termOfService15Content3 => '③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.';

  @override
  String get termOfService15Content4 => '④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.';

  @override
  String get termOfService16 => '제16조(청약철회 등의 효과)';

  @override
  String get termOfService16Content1 => '① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.';

  @override
  String get termOfService16Content2 => '② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.';

  @override
  String get termOfService16Content3 => '③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.';

  @override
  String get termOfService16Content4 => '④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.';

  @override
  String get termOfService17 => '제17조(개인정보보호)';

  @override
  String get termOfService17Content1 => '① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.';

  @override
  String get termOfService17Content2 => '② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.';

  @override
  String get termOfService17Content3 => '③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.';

  @override
  String get termOfService17Content4 => '④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.';

  @override
  String get termOfService17Content5 => '⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.';

  @override
  String get termOfService17Content6 => '⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.';

  @override
  String get termOfService17Content7 => '⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.';

  @override
  String get termOfService17Content8 => '⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.';

  @override
  String get termOfService17Content9 => '⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.';

  @override
  String get termOfService18 => '제18조(“몰“의 의무)';

  @override
  String get termOfService18Content1 => '① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화.용역을 제공하는데 최선을 다하여야 합니다.';

  @override
  String get termOfService18Content2 => '② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.';

  @override
  String get termOfService18Content3 => '③ “몰”이 상품이나 용역에 대하여 「표시.광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.';

  @override
  String get termOfService18Content4 => '④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.';

  @override
  String get termOfService19 => '제19조(회원의 ID 및 비밀번호에 대한 의무)';

  @override
  String get termOfService19Content1 => '① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.';

  @override
  String get termOfService19Content2 => '② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.';

  @override
  String get termOfService19Content3 => '③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.';

  @override
  String get termOfService20 => '제20조(이용자의 의무)';

  @override
  String get termOfService20Content1 => '이용자는 다음 행위를 하여서는 안 됩니다.\n1. 신청 또는 변경시 허위 내용의 등록\n2. 타인의 정보 도용\n3. “몰”에 게시된 정보의 변경\n4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시\n5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해\n6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위\n7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위';

  @override
  String get termOfService21 => '제21조(연결“몰”과 피연결“몰” 간의 관계)';

  @override
  String get termOfService21Content1 => '① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.';

  @override
  String get termOfService21Content2 => '② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.';

  @override
  String get termOfService22 => '제22조(저작권의 귀속 및 이용제한)';

  @override
  String get termOfService22Content1 => '① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.';

  @override
  String get termOfService22Content2 => '② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.';

  @override
  String get termOfService22Content3 => '③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.';

  @override
  String get termOfService23 => '제23조(분쟁해결)';

  @override
  String get termOfService23Content1 => '① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.';

  @override
  String get termOfService23Content2 => '② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.';

  @override
  String get termOfService23Content3 => '③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.';

  @override
  String get termOfService24 => '제24조(재판권 및 준거법)';

  @override
  String get termOfService24Content1 => '① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.';

  @override
  String get termOfService24Content2 => '② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.';

  @override
  String get timeTakeEffect => '부 칙(시행일) 이 약관은\n2024년 3월 1일부터 시행합니다.';

  @override
  String get privacyPolicy => '성공매니아 이용약관';

  @override
  String get privacyPolicyContent => '성공매니아는 정보주체의 자유와 권리 보호를 위해 「개인정보 보호법」 및 관계 법령이 정한 바를 준수하여, 적법하게 개인정보를 처리하고 안전하게 관리하고 있습니다. 이에 「개인정보 보호법」 제30조에 따라 정보주체에게 개인정보 처리에 관한 절차 및 기준을 안내하고, 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.';

  @override
  String get privacyPolicy1 => '1. 개인정보의 처리목적';

  @override
  String get privacyPolicy1Content1 => '성공매니아는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.';

  @override
  String get privacyPolicy1Content2 => '1. 회원 가입 및 관리\n회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다.';

  @override
  String get privacyPolicy1Content3 => '2. 재화 또는 서비스 제공\n물품배송, 서비스 제공, 계약서·청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제·정산, 채권추심으로 개인정보를 처리합니다.';

  @override
  String get privacyPolicy1Content4 => '3. 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계';

  @override
  String get privacyPolicy2 => '2. 개인정보의 처리 및 보유기간';

  @override
  String get privacyPolicy2Content1 => '홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지\n다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지';

  @override
  String get privacyPolicy2Content2 => '1) 회사 내부방침에 의한 정보보유 사유 회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 oo년간 회원의 정보를 보유할 수 있습니다.';

  @override
  String get privacyPolicy2Content3 => '2) 관련 법령에 의한 정보 보유 사유 전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.';

  @override
  String get privacyPolicy2Content4 => '계약 또는 청약철회 등에 관한 기록\n보존이유 : 전자상거래등에서의소비자보호에관한법률\n보존기간 : 5년';

  @override
  String get privacyPolicy2Content5 => '대금 결제 및 재화 등의 공급에 관한 기록\n보존이유: 전자상거래등에서의소비자보호에관한법률\n보존기간 : 5년';

  @override
  String get privacyPolicy2Content6 => '소비자 불만 또는 분쟁처리에 관한 기록\n보존이유 : 전자상거래등에서의소비자보호에관한법률\n보존기간 : 3년';

  @override
  String get privacyPolicy2Content7 => '로그 기록\n보존이유 : 통신비밀보호법\n보존기간 : 3개월';

  @override
  String get privacyPolicy2Content8 => '3) 홈페이지 이용에 따른 채권·채무관계 잔존 시에는 해당 채권·채무관계 정산 시까지';

  @override
  String get privacyPolicy3 => '3. 처리하는 개인정보 항목';

  @override
  String get privacyPolicy3Content1 => '성공매니아는 회원가입, 상담, 서비스 신청 등을 위해 다음의 개인정보 항목을 처리하고 있습니다.';

  @override
  String get privacyPolicy3Content2 => '1. 회원 가입 및 관리\n이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보\n2. 서비스 신청시\n주소, 결제 정보\n・ 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다.';

  @override
  String get privacyPolicy4 => '4. 개인정보 수집방법';

  @override
  String get privacyPolicy4Content1 => '홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집';

  @override
  String get privacyPolicy5 => '5. 만 14세 미만 아동의 개인정보 처리에 관한 사항';

  @override
  String get privacyPolicy5Content1 => '① 성공매니아는 만 14세 미만 아동에 대해 개인정보를 수집할 때 법정대리인의 동의를 얻어 해당 서비스 수행에 필요한 최소한의 개인정보를 수집합니다.\n• 필수항목 : 법정 대리인의 성명, 관계, 연락처';

  @override
  String get privacyPolicy5Content2 => '② 또한, 의 관련 홍보를 위해 아동의 개인정보를 수집할 경우에는 법정대리인으로부터 별도의 동의를 얻습니다.';

  @override
  String get privacyPolicy5Content3 => '③ 성공매니아는 만 14세 미만 아동의 개인정보를 수집할 때에는 아동에게 법정대리인의 성명, 연락처와 같이 최소한의 정보를 요구할 수 있으며, 다음 중 하나의 방법으로 적법한 법정대리인이 동의하였는지를 확인합니다.\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 개인정보처리자가 그 동의 표시를 확인했음을 법정대리인의 휴대전화 문자메시지로 알리는 방법\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 신용카드·직불카드 등의 카드정보를 제공받는 방법\n• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 휴대전화 본인인증 등을 통해 본인 여부를 확인하는 방법\n• 동의 내용이 적힌 서면을 법정대리인에게 직접 발급하거나, 우편 또는 팩스를 통하여 전달하고 법정대리인이 동의 내용에 대하여 서명날인 후 제출하도록 하는 방법\n• 동의 내용이 적힌 전자우편을 발송하여 법정대리인으로부터 동의의 의사표시가 적힌 전자우편을 전송받는 방법\n• 전화를 통하여 동의 내용을 법정대리인에게 알리고 동의를 얻거나 인터넷주소 등 동의 내용을 확인할 수 있는 방법을 안내하고 재차 전화 통화를 통하여 동의를 얻는 방법\n• 그 밖에 위와 준하는 방법으로 법정대리인에게 동의 내용을 알리고 동의의 의사표시를 확인하는 방법';

  @override
  String get privacyPolicy6 => '6. 개인정보의 파기 절차 및 방법';

  @override
  String get privacyPolicy6Content1 => '① 성공매니아는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.';

  @override
  String get privacyPolicy6Content2 => '② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음 에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.';

  @override
  String get privacyPolicy6Content3 => '③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.\n1. 파기절차 성공매니아는 파기 사유가 발생한 개인정보를 선정하고, 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.\n2. 파기방법 은(는) 전자적 파일 형태로 기록·저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이 문서에 기록·저장된 개인정보는 분쇄기로 분쇄 하거나 소각하여 파기합니다.';

  @override
  String get privacyPolicy7 => '7. 정보주체와 법정대리인의 권리·의무 및 행사방법';

  @override
  String get privacyPolicy7Content1 => '① 정보주체는 에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.\n※ 만 14세 미만 아동에 관한 개인정보의 열람등 요구는 법정대리인이 직접 해야 하며, 만 14세 이상의 미성년자인 정보주체는 정보주체의 개인정보에 관하여 미성년자 본인이 권리를 행사하거나 법정대리인을 통하여 권리를 행사할 수도 있습니다.';

  @override
  String get privacyPolicy7Content2 => '② 권리 행사는 에 대해 「개인정보 보호법」 시행령 제41조 제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며, 성공매니아는 이에 대해 지체없이 조치하겠습니다.';

  @override
  String get privacyPolicy7Content3 => '③ 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수도 있습니다. 이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.';

  @override
  String get privacyPolicy7Content4 => '④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.';

  @override
  String get privacyPolicy7Content5 => '⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.';

  @override
  String get privacyPolicy7Content6 => '⑥ 성공매니아는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리 정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.';

  @override
  String get privacyPolicy8 => '8. 개인정보의 안전성 확보조치';

  @override
  String get privacyPolicy8Content1 => '성공매니아는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.\n1. 관리적 조치 : 내부관리계획 수립·시행, 전담조직 운영, 정기적 직원 교육\n2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 개인정보의 암호화, 보안프로그램 설치 및 갱신\n3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제';

  @override
  String get privacyPolicy9 => '9. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항';

  @override
  String get privacyPolicy9Content1 => '① 개인정보처리자명>은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용 정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.';

  @override
  String get privacyPolicy9Content2 => '② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.\n가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.\n나. 쿠키의 설치·운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.\n다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.';

  @override
  String get privacyPolicy10 => '10. 개인정보에 관한 민원서비스';

  @override
  String get privacyPolicy10Content1 => '성공매니아는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호책임자를 지정하고 있습니다.';

  @override
  String get privacyPolicy10Content2 => '• 개인정보보호담당자\n성명 : 정보경\n소속 : 성공매니아\n전화번호 : 010-8222-8317\n이메일 : bokyeong19@mecelljoo.kr';

  @override
  String get privacyPolicy10Content3 => '• 개인정보보호책임자\n성명 : 정보경\n소속 : 성공매니아\n전화번호 : 010-8222-8317\n이메일 : dhcoan12@naver.com';

  @override
  String get privacyPolicy10Content4 => '• 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자 혹은 담당부서로 신고하실 수 있습니다.\n• 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.\n• 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.';

  @override
  String get privacyPolicy10Content5 => '개인정보침해신고센터\n(privacy.kisa.or.kr / 국번 없이 118)';

  @override
  String get privacyPolicy10Content6 => '개인정보분쟁조정위원회\n(kopico.go.kr / 1833-6972)';

  @override
  String get privacyPolicy10Content7 => '대검찰청 사이버수사과\n(spo.go.kr / 지역번호+1301)';

  @override
  String get privacyPolicy10Content8 => '경찰청 사이버안전국\n(cyberbureau.police.go.kr / 국번없이 182)';

  @override
  String minutesAgo(String time) {
    return '$time분 전';
  }

  @override
  String hoursAgo(String time) {
    return '$time시간 전';
  }

  @override
  String totalItems(int totalItems) {
    return '총 $totalItems개';
  }

  @override
  String get notificationAlert => '공고';

  @override
  String get ok => '확인';

  @override
  String get check => '확인';

  @override
  String get comment => '댓글';

  @override
  String get viewProfile => '프로필 보기';

  @override
  String get writer => '작성자';

  @override
  String get writeReply => '답글쓰기';

  @override
  String get great => '좋아요';

  @override
  String get joinMemberShip => '회원가입';

  @override
  String get placeHolderId => '아이디';

  @override
  String get validationId => '영문, 숫자 조합 8자 이내';

  @override
  String get placeHolderPassword => '비밀번호';

  @override
  String get validationPassword => '영문, 숫자, 특수문자를 포함한 8-16자 조합';

  @override
  String get doubleCheck => '중복확인';

  @override
  String get doubleCheckFail => '이미 있는 아이디입니다. 다른 아이디를 사용해 주세요.';

  @override
  String get doubleCheckSuccess => '중복 확인 되었습니다. 사용 가능한 아이디 입니다.';

  @override
  String get placeHolderConfirmPassword => '비밀번호 확인';

  @override
  String get placeHolderName => '이름';

  @override
  String get placeHolderPhone => '전화번호';

  @override
  String get sendAuthentication => '인증번호 전송';

  @override
  String get otpNumber => '인증번호';

  @override
  String get verify => '인증하기';

  @override
  String get placeHolderReferrerPhoneNumber => '추천인 전화번호 (선택사항)';

  @override
  String get usernameExisted => '이 사용자 이름은 존재합니다.';

  @override
  String get phoneNumberExisted => '이 전화번호는 이미 사용 중입니다.';

  @override
  String get verifyOTPSuccess => 'OTP 인증 성공';

  @override
  String get empty => '이 필드는 비워둘 수 없습니다.';

  @override
  String get usernameInvalid => '영문과 숫자의 조합 6자 이상';

  @override
  String get passwordInvalid => '대문자, 소문자 영문, 숫자, 특수문자를 포함하여 8자 이상';

  @override
  String get confirmPasswordNotMatch => '비밀번호가 일치하지 않습니다';

  @override
  String get phoneInvalid => '전화번호 형식이 잘못되었습니다.';

  @override
  String get otpInvalid => '6개 숫자 가능';

  @override
  String get phoneNumberNotExisted => '이 전화번호는 애플리케이션에 존재하지 않습니다.';

  @override
  String usernameOfPhoneNumber(String phoneNumber) {
    return '$phoneNumber님의 아이디는';
  }

  @override
  String couldNotLunch(String content) {
    return '점심을 못 먹었어요 $content';
  }

  @override
  String get id => '입니다';

  @override
  String get resetPassword => '비밀번호 재설정';

  @override
  String get verifyAccountFailed => '사용자 이름이 전화번호와 일치하지 않습니다';

  @override
  String get pleaseEnterPassword => '재설정할 비밀번호를 입력해 주세요.';

  @override
  String get passwordCondition => '(영문, 숫자, 특수문자를 포함하여 8자 이상 조합)';

  @override
  String get button => '버튼';

  @override
  String resetPasswordSuccess(Object phoneNumber) {
    return '$phoneNumber님의 비밀번호가\n재설정 되었습니다.';
  }

  @override
  String get productInformation => '제품 정보';

  @override
  String get review => '후기';

  @override
  String get inquiry => '문의';

  @override
  String get purchaseReview => '구매후기';

  @override
  String get writeReview => '후기 작성';

  @override
  String get shoppingCart => '장바구니';

  @override
  String get buyNow => '바로 구매하기';

  @override
  String get temporaryStorage => '임시저장';

  @override
  String get registration => '등록';

  @override
  String get pleaseChooseCategory => '카테고리를 선택해주세요.';

  @override
  String get pleaseSelectSubCategory => '분류를 선택해주세요.';

  @override
  String get pleaseEnterSubject => '제목을 입력해주세요.';

  @override
  String get pleaseEnterYourDetails => '내용을 입력해주세요.';

  @override
  String get editPhoto => '사진 편집';

  @override
  String get notification => '알림';

  @override
  String get writeQA => '문의 작성';

  @override
  String get qaCompleted => '답변 완료';

  @override
  String get qaHidden => '비밀글 입니다.';

  @override
  String get sendWrittenReview => '후기 작성하기';

  @override
  String get productRating => '문의 구분';

  @override
  String get uploadImage => '사진 업로드';

  @override
  String get writeReviewTextBoxTitle => '리뷰 작성';

  @override
  String get writeReviewHintText => '상품의 후기를 알려주세요';

  @override
  String get takePicture => '사진촬영';

  @override
  String get pickFromGallery => '갤러리에서 사진 선택';

  @override
  String get deletePicture => '사진 삭제하기';

  @override
  String get cancel => '취소';

  @override
  String get composeQA => '상품 문의';

  @override
  String get submitQA => '문의하기';

  @override
  String get qaCategoryType => '문의 유형';

  @override
  String get qaCategoryTypePlaceHolder => '선택';

  @override
  String get qaDetails => '문의 내용';

  @override
  String get qaDetailsHintText => '문의 내용을 입력하세요';

  @override
  String get favoriteBoard => '즐겨찾기 게시판';

  @override
  String get follower => '팔로워';

  @override
  String get delete => '삭제';

  @override
  String get followManage => '팔로우 관리';

  @override
  String get referrerStatus => '추천인 현황';

  @override
  String get currentReferrer => '현재 추천인 수';

  @override
  String numberPeople(Object number) {
    return '$number명';
  }

  @override
  String get currentReferrerList => '현재 추천인 리스트';

  @override
  String get next => '다음';

  @override
  String get personalInfoTermAccept => '(필수) 개인정보 처리방침 동의';

  @override
  String get smTermAccept => '(필수) 서비스 이용약관 동의';

  @override
  String get view => '보기';

  @override
  String get agreeToTermAndCond => '약관 동의';

  @override
  String get termOfUseSMMall => '성공매니아몰 이용약관 동의';

  @override
  String get termOfUseSMMallTitle => '성공매니아몰 이용약관';

  @override
  String get successSecretOfTop1 => '상위 1% 사업가들이 알려주는\n성공 비밀';

  @override
  String get termAndCondDetails => '이용정책 및 약관';

  @override
  String cartItemAmount(int amount) {
    return '총 $amount개';
  }

  @override
  String get selectAll => '전체선택';

  @override
  String get editBusinessCard => '명함 수정하기';

  @override
  String get businessCardDetails => '명함 자세히 보기';

  @override
  String get activity => '활동';

  @override
  String get followManagement => '팔로우 관리';

  @override
  String get favoritesBulletinBoard => '즐겨찾기 게시판';

  @override
  String get curationActivities => '큐레이션 활동';

  @override
  String get communityActivities => '커뮤니티 활동';

  @override
  String get myDeliveryInformation => '나의 배송정보';

  @override
  String get checkOrderDeliveryDetails => '주문배송내역 조회';

  @override
  String get inquiryDetails => '문의내역';

  @override
  String get etc => '기타';

  @override
  String get recommenderStatus => '추천인 현황';

  @override
  String get entire => '전체';

  @override
  String get beforeDelivery => '배송전';

  @override
  String get shipping => '배송중';

  @override
  String get deliveryComplete => '배송완료';

  @override
  String get refund => '반품/환불';

  @override
  String get exchange => '교환';

  @override
  String get deliveryInquiry => '배송조회';

  @override
  String get orderDetails => '주문 상세보기';

  @override
  String numberProducts(Object number) {
    return '$number개';
  }

  @override
  String get paymentInformation => '결제 정보';

  @override
  String get totalProductAmount => '총 상품금액';

  @override
  String get deliveryFee => '배송비';

  @override
  String get totalDiscountAmount => '총 할인금액';

  @override
  String get paymentAmount => '결제금액';

  @override
  String get pointAccumulation => '포인트 적립';

  @override
  String get paymentReceipt => '결제 영수증';

  @override
  String get accumulationExpected => '적립 예정';

  @override
  String get ordererInformation => '주문자 정보';

  @override
  String get phoneNumber => '전화번호';

  @override
  String get email => '이메일';

  @override
  String get deliveryInformation => '배송 정보';

  @override
  String get orderPayment => '주문 /  결제';

  @override
  String get orderer => '주문자';

  @override
  String get changeAddress => '배송지 변경';

  @override
  String get defaultShippingAddress => '기본배송지';

  @override
  String get addShippingAddress => '배송지 추가';

  @override
  String get add => '추가하기';

  @override
  String get whatYouWrote => '작성한 글';

  @override
  String get postWithComment => '댓글 작성한 글';

  @override
  String get likedPost => '좋아요한 글';

  @override
  String get justNow => '방금';

  @override
  String get noPost => '게시물이 없습니다';

  @override
  String get exploreOurCommunity => '커뮤니티 둘러보기';

  @override
  String get exploreCurator => '큐레이션 둘러보기';

  @override
  String get myProfile => '프로필';

  @override
  String get businessCardEdit => '명함 수정';

  @override
  String get basicInformation => '기본정보';

  @override
  String get socialMedia => '소셜 미디어';

  @override
  String get linkUrl => '링크 URL';

  @override
  String get snsSelect => 'SNS 선택';

  @override
  String get addition => '추가';

  @override
  String get fileAttach => '파일첨부';

  @override
  String get list => '목록';

  @override
  String get title => '제목';

  @override
  String get imageFile => '이미지 파일';

  @override
  String get deletePhoto => '사진 삭제하기';

  @override
  String get changePhoto => '사진 변경';

  @override
  String get follow => '팔로우';

  @override
  String get following => '팔로우 중';

  @override
  String get setting => '설정';

  @override
  String get accountInformationManagement => '계정정보 관리';

  @override
  String get signInWithNaver => '네이버 연동 중';

  @override
  String get signInWithKakao => '카카오 연동 중';

  @override
  String get signInWithGoogle => '구글 연동 중';

  @override
  String get signInWithApple => '애플 연동 중';

  @override
  String get notificationSettings => '알림 설정';

  @override
  String get languageSettings => '언어 설정';

  @override
  String get korean => '한국어';

  @override
  String get usagePolicy => '이용정책';

  @override
  String get logout => '로그아웃';

  @override
  String get edit => '편집';

  @override
  String get withdrawal => '회원 탈퇴';

  @override
  String get save => '저장하기';

  @override
  String get changePassword => '비빌번호 변경';

  @override
  String get editCellPhoneNumber => '핸드폰 번호 수정';

  @override
  String get followNewPostNotification => '팔로우 새글 알람';

  @override
  String get commentAlert => '댓글 알람';

  @override
  String get likeAlert => '좋아요 알람';

  @override
  String get termAndPolicyConditions => '이용정책 및 약관';

  @override
  String get currentPassword => '현재 비밀번호';

  @override
  String get passwordToChange => '변경 할 비밀번호';

  @override
  String get change => '변경하기';

  @override
  String get changePhoneNumber => '전화번호 변경';

  @override
  String get recentSearches => '최근 검색어';

  @override
  String get clearAllHistory => '검색기록 전체 삭제';

  @override
  String get someThingWentWrong => '문제가 발생했습니다.';

  @override
  String get addThumbnail => '썸네일 추가';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get someError => '오류가 발생했습니다.';

  @override
  String get product => '상품';

  @override
  String get delivery => '배송';

  @override
  String get other => '기타';

  @override
  String get loginAndSignUp => '로그인 및 회원가입';

  @override
  String get youNeedToLoginToAccessThisContent => '이 콘텐츠에 접근하려면 로그인이 필요합니다';

  @override
  String get goToLoginPage => '로그인 페이지로 이동';

  @override
  String get pleaseLoginToViewRegisteredInformation => '이 기능은 로그인이 필요합니다. 로그인하시겠습니까?';

  @override
  String get alertProductAddedToCart => '장바구니에 추가된 제품';

  @override
  String get orderProduct => '주문상품';

  @override
  String get addressSearch => '주소 검색';

  @override
  String totalPrice(Object price, Object totalProduct) {
    return '총 $totalProduct개 $price원';
  }

  @override
  String totalPriceWithoutNumber(double price) {
    final intl.NumberFormat priceNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String priceString = priceNumberFormat.format(price);

    return '$priceString원 결제하기';
  }

  @override
  String get orderProductAgree => '주문할 상품의 상품명, 상품가격, 배송 정보를 확인하였으며,구매에 동의합니다.';

  @override
  String get addToCart => '장바구니에 추가';

  @override
  String get leaveAComment => '댓글 남기기';

  @override
  String get replyingTo => '에 응답하다: ';

  @override
  String get editingComment => '댓글 편집...';

  @override
  String get noFollowers => '팔로어가 없습니다.';

  @override
  String get noFollowings => '다음이 없습니다.';

  @override
  String get paymentFailedMessage => '결제에 실패했습니다.\n다시 시도해 주세요.';

  @override
  String get paymentSuccessMessage => '결제가 완료되었습니다.\n 주문해주셔서 감사합니다..';

  @override
  String get apply => '신청하기';

  @override
  String get noPostDisplayed => '표시된 게시물이 없습니다.';

  @override
  String get urlInvalid => '유효하지 않은 URL입니다.';

  @override
  String get copiedToClipboard => '클립보드에 복사되었습니다.';

  @override
  String get invalidEmailFormat => '잘못된 이메일 형식';

  @override
  String get areYouSureYouWantToUnregister => '탈퇴 하시겠습니까? 탈퇴 후 작성한 글은 자동 삭제 되지 않습니다. 탈퇴 후 취소가 불가합니다.';

  @override
  String get areYouSureYouWantToDelete => '정말로 삭제하시겠습니까?';

  @override
  String get inquiryCategory => '문의 구분';

  @override
  String get answerComplete => '답변완료';

  @override
  String get emptyList => '공허한';

  @override
  String get savePostSuccess => '게시물이 저장되었습니다';

  @override
  String get unconfirmed => '주문 완료';

  @override
  String get confirmed => '배송 전';

  @override
  String get delivered => '배달 완료';

  @override
  String get informationSupplement => '정보 보충';

  @override
  String get commentMyPost => '논평';

  @override
  String get followingUploadPost => '새 글';

  @override
  String get reactMyPost => '반작용';

  @override
  String get shareSuccessfully => '성공적으로 공유되었습니다';

  @override
  String get daddrs1000 => '주소를 찾을 수 없습니다.';

  @override
  String get aa1000 => '사용자를 찾을 수 없습니다.';

  @override
  String get aa1001 => '접근이 거부되었습니다.';

  @override
  String get aa1002 => '액세스 토큰이 만료되었습니다.';

  @override
  String get aa1003 => '리프레시 토큰이 만료되었습니다.';

  @override
  String get aa1004 => '세션 토큰이 만료되었습니다.';

  @override
  String get aa1005 => '토큰이 유효하지 않습니다.';

  @override
  String get aa1006 => 'Google ID 토큰이 유효하지 않습니다.';

  @override
  String get aa1007 => 'OTP를 보낼 수 없습니다.';

  @override
  String get aa1008 => 'OTP가 만료되었습니다.';

  @override
  String get aa1009 => 'OTP가 일치하지 않습니다.';

  @override
  String get aa1010 => '이 사용자에게는 인증 방법이 지원되지 않습니다.';

  @override
  String get aa1011 => 'Kakao 토큰이 유효하지 않습니다.';

  @override
  String get aa1012 => 'Naver 토큰이 유효하지 않습니다.';

  @override
  String get a1001 => '내부 서버 오류';

  @override
  String get a1002 => '잘못된 요청 데이터';

  @override
  String get a1003 => '지원되지 않는 요청 메서드';

  @override
  String get dcrt1000 => '카트를 찾을 수 없습니다.';

  @override
  String get dcrt1001 => '제품 수량은 재고 수량보다 작거나 같아야 합니다.';

  @override
  String get dc1000 => '두 번째 깊이 카테고리의 하위 카테고리를 추가할 수 없습니다.';

  @override
  String get dc1001 => '카테고리에 하위 카테고리를 추가할 수 없습니다.';

  @override
  String get dc1002 => '카테고리 유형이 올바르지 않습니다.';

  @override
  String get dc1003 => '카테고리를 삭제할 수 없습니다.';

  @override
  String get dc1004 => '카테고리 이름을 변경할 수 없습니다.';

  @override
  String get dc1005 => '카테고리를 찾을 수 없습니다.';

  @override
  String get dcmt1000 => '댓글을 찾을 수 없습니다.';

  @override
  String get dcmt1001 => '상위 댓글을 찾을 수 없습니다.';

  @override
  String get dcmt1002 => '편집 권한이 없습니다.';

  @override
  String get dcmt1003 => '숨겨진 댓글에 답글을 달 수 없습니다.';

  @override
  String get dfvrcate1000 => '즐겨찾는 카테고리는 상위 카테고리만 허용됩니다.';

  @override
  String get af1000 => '업로드된 파일 이름이 유효하지 않습니다.';

  @override
  String get af1001 => '지원되지 않는 파일 유형';

  @override
  String get af1002 => '파일 구문 분석 오류';

  @override
  String get dfile1000 => '파일을 찾을 수 없습니다.';

  @override
  String get dfl1000 => '자신을 팔로우할 수 없습니다.';

  @override
  String get dfl1001 => '자신을 언팔로우할 수 없습니다.';

  @override
  String get dl1005 => '로케일이 지원되지 않습니다.';

  @override
  String get dmp1000 => '메인 페이지를 찾을 수 없습니다.';

  @override
  String get dntf1000 => '알림을 찾을 수 없습니다.';

  @override
  String get dntfs1000 => '알림 설정을 찾을 수 없습니다.';

  @override
  String get dordd1000 => '주문 세부 정보를 찾을 수 없습니다.';

  @override
  String get aods1 => '주문 세부 세션을 찾을 수 없습니다.';

  @override
  String get dord1000 => '주문 실패';

  @override
  String get dord1001 => '주문을 찾을 수 없습니다.';

  @override
  String get dord1002 => '이 주문은 이 사용자에게 속하지 않습니다.';

  @override
  String get dord1003 => '주문은 未確認 - 確認済み 상태에서만 취소할 수 있습니다.';

  @override
  String get dord1004 => '주문은 未確認 - 確認済み - 배달 중 상태에서만 취소할 수 있습니다.';

  @override
  String get dord1005 => '관리자만 주문 상태를 다음과 같이 변경할 수 있습니다: 未確認 -> 確認済み -> 배달 중 -> 配送済み';

  @override
  String get dord1006 => '관리자만 주문 상태를 다음과 같이 환불할 수 있습니다: 취소 -> 환불';

  @override
  String get dord1007 => '환불 실패';

  @override
  String get aos1 => '주문 세션을 찾을 수 없습니다.';

  @override
  String get aos2 => '제품 수량은 재고 수량보다 작거나 같아야 합니다.';

  @override
  String get dpst1000 => '게시물을 찾을 수 없습니다.';

  @override
  String get dpst1001 => '게시물은 하위 카테고리만 허용됩니다.';

  @override
  String get dpst1002 => '게시물은 상위 카테고리만 허용됩니다.';

  @override
  String get dpst1003 => '게시물 카테고리가 일치하지 않습니다.';

  @override
  String get dpst1004 => '게시물 상위 카테고리가 필요합니다.';

  @override
  String get dprd1000 => '제품을 찾을 수 없습니다.';

  @override
  String get dpu1000 => '프로필 URL을 찾을 수 없습니다.';

  @override
  String get dqa1000 => '질문 및 답변을 찾을 수 없습니다.';

  @override
  String get dqa1001 => '다른 사람의 QnA는 삭제할 수 없습니다.';

  @override
  String get drt1000 => '평점을 찾을 수 없습니다.';

  @override
  String get drt1001 => '다른 사람의 리뷰는 삭제할 수 없습니다.';

  @override
  String get drct1000 => '반응을 찾을 수 없습니다.';

  @override
  String get dsf1000 => '배송료를 찾을 수 없습니다.';

  @override
  String get dsm1000 => '소셜 미디어를 찾을 수 없습니다.';

  @override
  String get au1000 => '사용자를 찾을 수 없습니다.';

  @override
  String get du1001 => '잘못된 이메일 형식';

  @override
  String get du1002 => '잘못된 전화 번호 형식';

  @override
  String get du1003 => '사용자 유형은 비밀번호를 허용하지 않습니다.';

  @override
  String get du1004 => '사용자가 이미 추천한 사용자가 있습니다.';

  @override
  String get du1005 => '잘못된 비밀번호';

  @override
  String get du1006 => '잘못된 비밀번호 형식';

  @override
  String get du1007 => '잘못된 사용자 이름 형식';

  @override
  String get du1008 => '중복된 사용자 이름';

  @override
  String get du1009 => '중복된 이메일';

  @override
  String get du1010 => '중복된 사용자 전화 번호';

  @override
  String get du1011 => '소셜 사용자의 이메일을 변경할 수 없습니다.';

  @override
  String get du1012 => '소셜 사용자의 전화 번호를 변경할 수 없습니다.';

  @override
  String get du1013 => '사용자가 등록을 완료하지 않았습니다.';

  @override
  String get du1014 => '사용자에게 정보 보충이 필요하지 않습니다.';

  @override
  String get du1015 => '사용자 역할이 충분하지 않습니다.';

  @override
  String get du1016 => '사용자를 찾을 수 없습니다.';

  @override
  String get du1017 => '시스템 계정을 비활성화할 수 없습니다.';

  @override
  String get sw101 => '발급된 고유키가 존재 하지 않음';

  @override
  String get sw102 => '만료된 키';

  @override
  String get sw103 => '키 사용량 초과';

  @override
  String get sw104 => '유효하지 않은 운송장 번호 혹은 택배사 코드 입력';

  @override
  String get sw105 => '동일한 운송장의 하루 요청 제한 건수 초과';

  @override
  String get sw106 => '운송장 번호 조회 에러';

  @override
  String get sw500 => '서버 에러 입니다';

  @override
  String get dtc1001 => '약관을 찾을 수 없습니다';

  @override
  String get connectionFailure => '서버에 연결할 수 없습니다. 나중에 다시 시도해주세요.';

  @override
  String get timeoutFailure => '요청 시간이 초과되었습니다.';

  @override
  String get otherDioFailure => '문제가 발생했습니다.';

  @override
  String get convertDataFailure => '데이터 변환 실패';

  @override
  String get genericFailure => '일반적인 실패';

  @override
  String get persistentFailure => '지속적인 실패';

  @override
  String get recipient => '받는 사람';

  @override
  String get address => '주소';

  @override
  String get checkAddressSearch => '주소 검색';

  @override
  String get enterDetailedAddress => '상세주소 입력';

  @override
  String get setDefaultAddress => '기본배송지 설정';

  @override
  String get longVideo => '긴 영상';

  @override
  String get shortVideo => '짧은 영상';

  @override
  String get reaction => '반응';

  @override
  String get viewDetails => '상세보기';

  @override
  String get areYouSureYouWantToCancelThisOrder => '정말 이 주문을 취소하시겠습니까?';

  @override
  String get deliveryStatus => '배송 상태';

  @override
  String get waybillNumber => '운송장 번호';

  @override
  String get productAcceptance => '상품인수';

  @override
  String get productInTransit => '상품이동중';

  @override
  String get deliveryArrived => '배송지도착';

  @override
  String get startDelivery => '배송출발';

  @override
  String get deliveryInformationHasNotBeenUpdated => '배송정보가 업데이트되지 않았습니다. 나중에 다시 시도 해주십시오';

  @override
  String get dicountInvalid => '할인 금액은 주문 금액의 30%를 초과할 수 없습니다.';

  @override
  String get payment => '지불';

  @override
  String get inquiryHistory => '문의내역';

  @override
  String get answeredInquiry => '답변됨';

  @override
  String get pending => '보류 중';

  @override
  String get small => '작은';

  @override
  String get normal => '보통의';

  @override
  String get large => '큰';

  @override
  String get huge => '거대한';

  @override
  String get content => '콘텐츠';

  @override
  String get report => '신고하기';

  @override
  String get areYouSureToReportThisPost => '해당 글을 신고하시겠습니까?';

  @override
  String get areYouSureToReportThisComment => '해당 댓글을 신고하시겠습니까?';

  @override
  String get areYouSureToReportThisUser => '해당 사용자를 신고하시겠습니까?';

  @override
  String get reportScreen => '신고된 게시물, 댓글, 프로필';

  @override
  String get reportedPost => '신고된 게시물';

  @override
  String get reportedComment => '신고된 댓글';

  @override
  String get reportedUser => '사용자 신고';

  @override
  String get areYouSureToDeleteThisPost => '이 게시물을 삭제하시겠습니까?';

  @override
  String get areYouSureToDeleteThisComment => '이 댓글을 삭제하시겠습니까?';

  @override
  String get areYouSureToDeleteThisUser => '이 사용자를 삭제하시겠습니까?';

  @override
  String get cancelOrder => '주문 취소';

  @override
  String get wouldYouLikeSendAnInquiry => '문의를 보내시겠습니까?';

  @override
  String get wouldYouLikeUploadPost => '포스트를 업로드 하시겠습니까?';

  @override
  String get wouldYouLikeUploadAReview => '후기를 업로드 하시겠습니까?';

  @override
  String get all => '모두';
}
