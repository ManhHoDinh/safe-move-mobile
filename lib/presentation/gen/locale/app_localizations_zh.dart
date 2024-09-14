import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class SZh extends S {
  SZh([String locale = 'zh']) : super(locale);

  @override
  String get home => '首页';

  @override
  String get community => '社区';

  @override
  String get forum => '论坛';

  @override
  String get store => '商店';

  @override
  String get profile => '个人资料';

  @override
  String get profileNavText => 'MY';

  @override
  String get news => 'NEWS';

  @override
  String get fullMenu => '全部菜单';

  @override
  String get bestReview => 'Best Review';

  @override
  String get pressAgainToCloseApp => '再次点击即可关闭应用程序';

  @override
  String get seeAll => '查看全部';

  @override
  String get onlineMagazine => 'ONLINE MAGAZINE';

  @override
  String get sgmNews => 'SGM NEWS';

  @override
  String get sungongMuseum => 'SUNGONG MUSEUM';

  @override
  String get communityCategory => '社区类别';

  @override
  String get bulletBoardCategory => '公告板类别';

  @override
  String get storeCategory => '商店类别';

  @override
  String get sungongMuseumKo => '成功博物馆';

  @override
  String get category => '分类';

  @override
  String get companyName => '成功狂热有限公司';

  @override
  String get ceoTitle => '首席执行官 : ';

  @override
  String get ceo => '吴债务';

  @override
  String get emailTitle => '电子邮件 : ';

  @override
  String get emailValue => 'ocm@mecelljoo.kr';

  @override
  String get contactNumberTitle => '联系电话 : ';

  @override
  String get contactNumber => '070-5213-7613';

  @override
  String get businessRegistrationNumberTitle => '营业执照号码 : ';

  @override
  String get businessRegistrationNumber => '887-87-02726';

  @override
  String get ecommerceRegistrationNumberTitle => '通讯销售登记号 : ';

  @override
  String get ecommerceRegistrationNumber => '2023-忠南天安-3531';

  @override
  String get personalInfoProtectionOfficerTitle => '个人信息保护负责人 : ';

  @override
  String get personalInfoProtectionOfficer => '吴债务';

  @override
  String get officerEmailTitle => '负责人邮箱 : ';

  @override
  String get officerEmail => 'ocm@mecelljoo.kr';

  @override
  String get addressTitle => '地址 : ';

  @override
  String get addressValue => '[31156] 韩国忠清南道天安市西北区不当22大道86 (Marvelous S塔) 804号';

  @override
  String get copyrightTitle => '版权 ';

  @override
  String get copyright => 'ⓒ 2024 成功狂热 All rights reserved.';

  @override
  String get latest => '最新';

  @override
  String get popular => '热门';

  @override
  String get recommended => '推荐';

  @override
  String get compose => '撰写';

  @override
  String get bestContents => 'Best Contents';

  @override
  String get onlineMagazineKo => '在线杂志';

  @override
  String get bestReviewLower => 'Best Review';

  @override
  String get selfEmployment => '自雇';

  @override
  String get sales => '销售';

  @override
  String get houseWife => '家庭主妇';

  @override
  String get officeWorkers => '上班族';

  @override
  String get inseldeomBusiness => 'Inseldeom 业务';

  @override
  String get allPosts => '全部帖子';

  @override
  String get favoritePosts => '收藏帖子';

  @override
  String get popularPosts => '热门帖子';

  @override
  String get curator => '策展人';

  @override
  String get unit => '원';

  @override
  String commonCurrencyFormat(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return '$valueString원';
  }

  @override
  String get easyLoginSNS => 'SNS简易登录';

  @override
  String get signIn => '登录';

  @override
  String get register => '注册';

  @override
  String get findId => '找回ID';

  @override
  String get findPassword => '找回密码';

  @override
  String get password => '密码';

  @override
  String get username => '用户名';

  @override
  String get termOfService => '成功迷商城使用条款';

  @override
  String get termOfServiceTitle => '服务条款';

  @override
  String get termOfService1 => '第1条（目的）';

  @override
  String get termOfService1Content1 => '本协议旨在规定在使用由Success Mania（以下简称“商城”）经营的Success Mania网上商城（以下简称“商城”）提供的与互联网相关的服务（以下简称“服务”）时，商城和用户的权利、义务和责任。\n※「对于使用PC通信、无线等进行的电子商务，除不违反其性质外，也适用本协议。」';

  @override
  String get termOfService2 => '第2条（定义）';

  @override
  String get termOfService2Content1 => '① “商城”是指Success Mania为了向用户提供商品或服务（以下简称“商品等”）而使用计算机等信息通信设备设置的可以交易商品等的虚拟营业场所，并且也指经营网络商城的经营者。';

  @override
  String get termOfService2Content2 => '② “用户”是指连接到“商城”，根据本协议获得“商城”提供的服务的会员和非会员。';

  @override
  String get termOfService2Content3 => '③ ‘会员’是指在“商城”注册成为会员，并持续享受“商城”提供的服务的人。';

  @override
  String get termOfService2Content4 => '④ ‘非会员’是指未注册会员但使用“商城”提供的服务的人。';

  @override
  String get termOfService3 => '第3条（条款的声明和解释及修订）';

  @override
  String get termOfService3Content1 => '① “商城”应将本协议的内容、商号及代表人姓名、营业所地址（包括消费者投诉处理地址）、电话号码、传真号码、电子邮件地址、经营者登记号、电子商务销售登记号、个人信息保护负责人等用户能够轻易了解的方式在成功迷网络商城的初始服务画面（正面）上张贴。但是，条款的内容可以通过连接画面进行查看。';

  @override
  String get termOfService3Content2 => '② “商城”应在用户同意本协议之前提供单独的连接屏幕或弹出屏幕等，以便用户能够确认或拒绝重要内容，例如退货，送货责任，退款条件等。';

  @override
  String get termOfService3Content3 => '③ “商城”可以在不违反与电子商务相关的法律的情况下修改本协议。';

  @override
  String get termOfService3Content4 => '④ 当商城修改协议时，将在适用日期之前至少7天在商城的初始屏幕上与适用日期一起通知用户。 但是，在修改协议内容对用户不利的情况下，商城将提前至少30天公告。 在这种情况下，商城将清楚地比较修改前后的内容，以便用户易于理解。';

  @override
  String get termOfService3Content5 => '⑤ 商城修改协议后，该修改协议仅适用于签订日期之后的合同，并且已经签订的合同将继续适用于修改前的条款。 但是，如果已经签订合同的用户在公告期内通过发送通知书表示希望适用修改后的协议条款并获得商城同意，则适用修改后的协议条款。';

  @override
  String get termOfService3Content6 => '⑥本协议未规定的事项以及本协议的解释应遵循电子商务等有关消费者保护的法律，关于条款的规定等。';

  @override
  String get termOfService4 => '第4条（服务的提供和更改）';

  @override
  String get termOfService4Content1 => '① “商城”将执行以下业务。\n1. 提供商品或服务的信息和订购合同的签订。\n2. 提供订购合同的商品或服务的交付。\n3. “商城”规定的其他业务。';

  @override
  String get termOfService4Content2 => '②在商品或服务缺货或技术规格变更等情况下，“商城”可以更改将来签订的合同的商品或服务的内容。 在这种情况下，应立即公告变更后的商品或服务的内容和提供日期。';

  @override
  String get termOfService4Content3 => '③ 如果商城因技术问题等原因修改提供给用户签约的服务的内容，则应向用户通知。';

  @override
  String get termOfService4Content4 => '④在前款情况下，商城应赔偿用户因此而遭受的损失。 但是，商城证明没有故意或过失的情况除外。';

  @override
  String get termOfService5 => '第5条（服务中断）';

  @override
  String get termOfService5Content1 => '① 如果出现计算机等信息通信设备的维护检修，更换和故障，通信中断等原因，“商城”可以暂时中断服务的提供。';

  @override
  String get termOfService5Content2 => '② 如果商城暂时中断服务的提供导致用户或第三方遭受损失，商城应予以赔偿。 但是，商城证明没有故意或过失的情况除外。';

  @override
  String get termOfService5Content3 => '③ 如果由于业务变更，业务放弃，公司合并等原因无法提供服务，则商城将按照第8条的规定通知用户，并按照商城最初提供的条件向消费者赔偿。 但是，如果商城未通知赔偿标准等，则应以商城通用的货币价值向用户提供里程或积分等等值的实物或现金。';

  @override
  String get termOfService6 => '第6条（会员注册）';

  @override
  String get termOfService6Content1 => '① 用户应根据商城指定的注册表格填写会员信息，并通过同意本协议表示同意进行会员注册。';

  @override
  String get termOfService6Content2 => '② 除非符合下列各项规定，否则“商城”不得注册以下人员作为会员，但是，未成年人与商城签订合同时未经法定代理人同意的情况下，商城应通知未成年人或法定代理人可以取消合同。\n1. 在注册时提供虚假信息，遗漏信息或错误信息的情况\n2. 未成年人购买受青少年保护法禁止的商品或服务，例如香烟，酒精等\n3. 商城认为注册会员会对商城的技术产生显着影响的情况';

  @override
  String get termOfService6Content3 => '③ 会员注册协议成立的时点为“商城”接受会员的接收确认通知的时间。';

  @override
  String get termOfService6Content4 => '④ 如果会员注册时提供的信息发生变化，会员应在合理期限内通过商城的会员信息修改等方式通知商城变更信息。';

  @override
  String get termOfService7 => '第7条（会员退出和资格丧失等）';

  @override
  String get termOfService7Content1 => '① 会员可以随时要求“商城”退出，并且“商城”将立即处理会员退出。';

  @override
  String get termOfService7Content2 => '② 如果会员出现以下情况，则商城可以限制或暂停会员资格。\n1. 在注册时提供虚假信息，遗漏信息或错误信息的情况\n2. 未能按时支付商城购买的商品等的价格，以及与商城使用相关的其他义务\n3. 干扰其他人使用商城或盗用其他人的信息等，威胁电子商务秩序\n4. 使用商城违反法律或本协议禁止或违反公共秩序和良俗的行为';

  @override
  String get termOfService7Content3 => '③ 商城限制或暂停会员资格后，如果同样的行为再次发生两次或在30天内没有改正，商城可以取消会员资格。';

  @override
  String get termOfService7Content4 => '④ 如果商城取消会员资格，则会员注册将被注销。 在此情况下，商城将通知会员并在注销会员注册前至少给予30天的时间进行说明。';

  @override
  String get termOfService8 => '第8条（对会员的通知）';

  @override
  String get termOfService8Content1 => '① 如果商城需要向会员通知，则可以通过商城与会员事先约定的电子邮件地址发送通知。';

  @override
  String get termOfService8Content2 => '② 对于向多名会员发送通知的情况，商城可以通过在商城公告板上发布一周或以上的时间来代替单独通知。 但是，对于与会员的交易有重大影响的事项，应进行个别通知。';

  @override
  String get termOfService9 => '第9条（购买申请）';

  @override
  String get termOfService9Content1 => '① “商城”用户通过以下方式或类似方式向“商城”申请购买，商城应提供以下内容以使用户轻松理解。\n1. 商品搜索和选择\n2. 收货人的姓名，地址，电话号码，电子邮件地址（或移动电话号码）等的输入\n3. 关于确认内务，约束撤销权的服务，运费，安装费等费用的确认\n4. 同意本协议并确认或拒绝以上第3.号的事项的标志（例如，鼠标单击）\n5. 关于商品的购买申请和与此相关的确认或商城确认\n6. 选择支付方式';

  @override
  String get termOfService9Content2 => '② 如果“商城”需要向第三方提供购买者的个人信息，以提供购买者的同意为前提，并且在注册时不事先获得全面同意。 在这种情况下，“商城”应明确告知购买者提供的个人信息项目，提供方，提供方的个人信息使用目的及持有和使用期限等。 但是，根据《信息网络使用促进及信息保护法》第25条第1款规定的个人信息处理委托等相关法律规定的情况下，应按照规定执行。';

  @override
  String get termOfService10 => '第10条（合同的成立）';

  @override
  String get termOfService10Content1 => '① “商城”可以拒绝接受符合第9条的购买申请，如果符合以下各项情况，但是，如果未成年人与商城签订合同未经法定代理人同意，则商城应通知未成年人或法定代理人可以取消合同。\n1. 提供虚假信息，遗漏信息或错误信息的情况\n2. 未成年人购买受青少年保护法禁止的商品或服务，例如香烟，酒精等\n3. 商城认为接受购买申请会对商城的技术产生显着影响的情况';

  @override
  String get termOfService10Content2 => '② 会员接收确认通知的时间为“商城”接受接收确认通知的时间。';

  @override
  String get termOfService10Content3 => '③ 商城的接受意向表示应包括有关确认购买申请的确认以及与此相关的信息，例如确认或取消购买申请。';

  @override
  String get termOfService11 => '第11条（付款方式';

  @override
  String get termOfService11Content1 => '在购买的商品或服务的支付方式可以采用以下任一方式。但是，“商城”不得对用户的支付方式进行任何名义的额外收费。\n1. 手机银行、网上银行、邮件银行等各种账户转账\n2. 预付卡、储蓄卡、信用卡等各种卡支付\n3. 线上无银行账户支付\n4. 电子货币支付\n5. 收到商品时支付\n6. 通过“商城”发放的积分支付\n7. 与“商城”签订合同或者“商城”认可的商品券支付\n8. 其他电子支付方式支付等';

  @override
  String get termOfService12 => '第12条（收件确认通知、购买申请变更及取消）';

  @override
  String get termOfService12Content1 => '“商城”在用户有购买申请时发送收件确认通知给用户。';

  @override
  String get termOfService12Content2 => '用户收到收件确认通知后，如有意愿不一致等情况，可以在收到收件确认通知后立即要求购买申请变更及取消，“商城”应在发货前用户有请求的情况下立即处理。但是，已经支付款项的情况下，适用第15条的约定。';

  @override
  String get termOfService13 => '第13条（商品等的供应）';

  @override
  String get termOfService13Content1 => '“商城”在与用户的商品等的供应时间方面，除另有约定外，自用户下订单之日起7日内可进行商品等的配送，以便用户可以收到商品。但是，“商城”已经收到商品等的全部或部分款项的情况下，自收到全部或部分款项之日起3个工作日内进行处理。此时，“商城”应采取适当措施，以便用户可以确认商品等的供应过程和进展。';

  @override
  String get termOfService13Content2 => '“商城”应明示用户购买的商品的配送方式、承担配送费用的方、各种配送方式的配送时间等。如果“商城”超过约定的配送时间，应当对由此导致的用户损失进行赔偿。但是，“商城”可以证明没有故意或过失的情况下，不适用该规定。';

  @override
  String get termOfService14 => '第14条（退款）';

  @override
  String get termOfService14Content1 => '当“商城”由于缺货等原因无法交付购买申请的商品时，应立即通知用户并在事先收到商品的款项的情况下，自收到款项之日起3个工作日内退款或者采取退款所需的措施。';

  @override
  String get termOfService15 => '第15条（退约权等）';

  @override
  String get termOfService15Content1 => '与“商城”签订商品等购买合同的用户，自收到根据“电子商务等的消费者保护法”第13条第2款的合同内容的书面文件之日起（对于延迟收到商品等的情况，指收到商品等或商品等的供应已开始的日期）起7日内可以行使退约权。但是，关于退约权等，“电子商务等的消费者保护法”另有规定的情况下，适用该法规定。';

  @override
  String get termOfService15Content2 => '用户收到商品后，符合以下各项1的情况下，不得退货和换货。\n1. 因用户责任而导致商品等灭失或损坏（但是，为了确认商品等内容而损坏包装等情况下可以行使退约权）\n2. 用户使用或部分消费导致商品等价值大幅降低的情况\n3. 时间的推移导致商品等价值大幅降低而无法再次销售的情况\n4. 商品等可以复制的情况下，毁坏原始商品等包装的情况';

  @override
  String get termOfService15Content3 => '对于第2项至第4项的情况，“商城”如果没有事先在易于被用户了解的地方明示相关规定的情况下，用户可以行使退约权。';

  @override
  String get termOfService15Content4 => '④ 尽管有第1款和第2款的规定，如果商品等的内容与展示或广告的内容不同或实施与合同内容不同，则用户应承担责任自收到商品等之日起 3 个月内。您可以在知道或可能知道该事实之日起 30 天内取消订阅。';

  @override
  String get termOfService16 => '第16条（退款等的效果）';

  @override
  String get termOfService16Content1 => '“商城”在收到用户退回的商品等后3个工作日内退还已经收到的商品等的款项。在此情况下，“商城”延迟退款给用户时，应按照《电子商务等的消费者保护法实施令》第21条第2款规定的延迟利率计算延迟利息。';

  @override
  String get termOfService16Content2 => '“商城”在退款时，如果用户以信用卡或电子货币等支付方式支付了商品等的款项，应立即向提供该支付方式的经营者请求停止或取消商品等的款项。';

  @override
  String get termOfService16Content3 => '在退约等的情况下，用户应承担因退回商品等所需费用。“商城”不会要求用户支付违约金或损害赔偿金，但是如果用户因商品等的内容与广告内容不符或与合同内容不符而进行退约等，那么“商城”将承担退回商品等所需费用。';

  @override
  String get termOfService16Content4 => '如果用户在接收商品等时支付了运费，那么“商城”应该明确地显示谁承担退约时的运费。';

  @override
  String get termOfService17 => '第17条（个人信息保护）';

  @override
  String get termOfService17Content1 => '“商城”在收集用户的个人信息时，应在提供服务所需的范围内最小化地收集个人信息。';

  @override
  String get termOfService17Content2 => '“商城”在用户注册时不预先收集购买合同履行所需的信息。但是，如果根据相关法律的规定需要在购买合同之前确认身份，则不适用。';

  @override
  String get termOfService17Content3 => '“商城”在收集和使用用户个人信息时，应事先告知用户其目的并取得同意。';

  @override
  String get termOfService17Content4 => '“商城”不得将收集的个人信息用于目的之外的用途。如果产生新的使用目的或者提供给第三方的情况，应在使用和提供阶段事先告知用户并获得同意。但是，如果相关法律另有规定，则不适用。';

  @override
  String get termOfService17Content5 => '“商城”需要得到用户同意的情况下，应提前说明或通知用户有关个人信息保护负责人的身份（所属、姓名及电话号码、其他联系方式）、信息收集目的及使用目的、提供给第三方的信息提供相关事项（接收者、提供目的及提供的信息内容）等《信息通信网络利用促进及信息保护等》法律第22条第2款规定的内容，并且用户可以随时撤销此同意。';

  @override
  String get termOfService17Content6 => '用户可以随时要求查看并更正自己的个人信息，“商城”有义务立即采取必要措施。如果用户要求更正错误，则“商城”在纠正错误之前不得使用该个人信息。';

  @override
  String get termOfService17Content7 => '为了保护个人信息，“商城”应将处理个人信息的人员最小化，并对包括信用卡、银行账户等个人信息的丢失、盗窃、泄露、未经同意提供给第三方、篡改等造成的用户损失负责。';

  @override
  String get termOfService17Content8 => '“商城”或者收到个人信息提供方的第三方应在达到收集目的或者提供目的后立即销毁相关个人信息。';

  @override
  String get termOfService17Content9 => '“商城”不会预先设置个人信息收集、使用、提供的同意选项。此外，对于拒绝个人信息收集、使用、提供的用户，“商城”不会因此限制或拒绝会员注册等服务提供。';

  @override
  String get termOfService18 => '第18条（商城的义务）';

  @override
  String get termOfService18Content1 => '“商城”应尽最大努力持续、稳定地提供商品和服务，并遵守法律和本协议的规定，不做违法或违反公共道德的行为。';

  @override
  String get termOfService18Content2 => '“商城”应设立保护用户个人信息（包括信用信息）的安全系统，以确保用户安全使用互联网服务。';

  @override
  String get termOfService18Content3 => '如果“商城”违反《广告法》第3条规定的不正当广告行为，导致用户损失，则应对该交易承担赔偿责任。';

  @override
  String get termOfService18Content4 => '“商城”不会发送用户不需要的商业性电子邮件。';

  @override
  String get termOfService19 => '第19条（会员ID及密码的义务）';

  @override
  String get termOfService19Content1 => '除第17条规定的情况外，ID和密码的管理责任由会员负责。';

  @override
  String get termOfService19Content2 => '会员不得将其ID和密码提供给第三方使用。';

  @override
  String get termOfService19Content3 => '如果会员发现其ID和密码遗失或被第三方使用，应立即通知“商城”，并根据“商城”的指示进行操作。';

  @override
  String get termOfService20 => '第20条（用户的义务）';

  @override
  String get termOfService20Content1 => '用户不得进行以下行为：\n1.提交或更改时提供虚假信息注册\n2.冒充他人\n3.更改在“商城”上发布的信息\n4.发送或发布“商城”未规定的信息（如计算机程序等）\n5.违反“商城”或其他第三方的版权等知识产权\n6.损害“商城”或其他第三方的声誉或干扰业务\n7.在“商城”上发布淫秽或暴力信息、图像、音频等与公共道德相悖的信息';

  @override
  String get termOfService21 => '第21条（连接商城和被连接商城之间的关系）';

  @override
  String get termOfService21Content1 => '① 如果上级“商城”和下级“商城”通过超链接方式（例如：超链接的目标包括文字、图片和动画等）连接，则称上级为连接“商城”（网站），下级为被连接“商城”（网站）。';

  @override
  String get termOfService21Content2 => '② 如果连接“商城”通过初始界面或连接时的弹出界面明确指出不对用户与被连接“商城”进行交易提供担保责任，则不对该交易承担担保责任。';

  @override
  String get termOfService22 => '第22条（版权所有权及使用限制）';

  @override
  String get termOfService22Content1 => '① “商城”制作的作品的版权和其他知识产权属于“商城”。';

  @override
  String get termOfService22Content2 => '② 用户不得未经“商城”的事先同意复制、传播、出版、分发、广播、其他方式利用“商城”在使用中获取的属于“商城”的知识产权的信息。';

  @override
  String get termOfService22Content3 => '③ 如果“商城”根据协议使用用户拥有的版权，则应提前通知该用户。';

  @override
  String get termOfService23 => '第23条（争议解决）';

  @override
  String get termOfService23Content1 => '① “商城”设立和运营损害赔偿机构，以反映用户的合理意见或投诉并补偿损害。';

  @override
  String get termOfService23Content2 => '② “商城”优先处理用户提交的投诉和意见。但是，如果无法快速处理，则应立即通知用户原因和处理时间。';

  @override
  String get termOfService23Content3 => '③ 关于“商城”和用户之间产生的电子商务纠纷，涉及用户的索赔申请，可以根据公平交易委员会或者地方政府委托的调解机构的调解结果进行处理。';

  @override
  String get termOfService24 => '第24条（管辖权和适用法律）';

  @override
  String get termOfService24Content1 => '① 在“商城”与用户之间发生的电子商务纠纷应由起诉时用户的地址管辖，如果没有地址，则由居住地的地方法院专属管辖。但是，如果起诉时用户的地址或居住地不明确，或者是外国居民，则应在民事诉讼法规定的管辖法院提起诉讼。';

  @override
  String get termOfService24Content2 => '② 在“商城”与用户之间提起的电子商务诉讼应适用韩国法。';

  @override
  String get timeTakeEffect => '附则（生效日）本协议自\n2024年3月1日起生效。';

  @override
  String get privacyPolicy => '个人信息处理方针';

  @override
  String get privacyPolicyContent => '为了保护信息主体的自由和权利，《个人信息保护法》及相关法律所规定的内容，成功狂热者遵守，合法地处理个人信息并安全地管理。根据《个人信息保护法》第30条的规定，我们制定并公开个人信息处理方针，以指导信息主体有关个人信息处理的程序和标准，并确保快速、顺利地处理相关投诉。';

  @override
  String get privacyPolicy1 => '1. 个人信息处理目的';

  @override
  String get privacyPolicy1Content1 => '成功狂热者处理个人信息是为了实现以下目的。处理的个人信息不会用于除以下目的之外的其他用途，如果使用目的发生变更，将按照《个人信息保护法》第18条的规定进行另行同意等必要措施。';

  @override
  String get privacyPolicy1Content2 => '1. 会员注册及管理\n会员注册意向确认、会员制服务提供相关的本人身份识别和认证、会员资格维护管理、服务不良利用防止、14岁以下儿童的个人信息处理时法定代理人的同意确认、各种通知、通知、投诉处理目的等。';

  @override
  String get privacyPolicy1Content3 => '2. 商品或服务提供\n商品配送、服务提供、合同书、发票寄送、内容提供、定制服务提供、本人认证、年龄认证、费用支付、结算、追讨债务。';

  @override
  String get privacyPolicy1Content4 => '3. 市场营销和广告利用活动等广告性信息传递，访问频率了解或对会员服务使用的统计';

  @override
  String get privacyPolicy2 => '2. 个人信息的处理和保留期限';

  @override
  String get privacyPolicy2Content1 => '网站会员注册和管理：直到企业/团体网站注销为止\n但是，在以下情况适用的情况下，直到结束。';

  @override
  String get privacyPolicy2Content2 => '1）根据公司内部政策的信息保留原因，即使会员退出，为了防止不良会员的不当使用再次发生、解决纠纷和配合调查机构的要求，公司将保留会员信息直到使用合同终止之日oo年。';

  @override
  String get privacyPolicy2Content3 => '2）根据相关法律的信息保留原因根据《电子商务等消费者保护法》等相关法律的规定需要保留的情况下，公司将根据相关法律规定的一定期限保留会员信息。';

  @override
  String get privacyPolicy2Content4 => '合同或撤销等记录的保存\n保留原因：《电子商务等消费者保护法》\n保留期限：5年';

  @override
  String get privacyPolicy2Content5 => '支付费用及提供商品等记录\n保留原因：《电子商务等消费者保护法》\n保留期限：5年';

  @override
  String get privacyPolicy2Content6 => '消费者投诉或争议处理记录\n保留原因：《电子商务等消费者保护法》\n保留期限：3年';

  @override
  String get privacyPolicy2Content7 => '日志记录\n保留原因：通信保密法\n保留期限：3个月';

  @override
  String get privacyPolicy2Content8 => '3）当与网站使用相关的债权或债务关系仍然存在时，直到相应债权或债务关系结清为止';

  @override
  String get privacyPolicy3 => '3. 处理的个人信息项目';

  @override
  String get privacyPolicy3Content1 => '成功狂热者处理会员注册、咨询、服务申请等所需的以下个人信息项目。';

  @override
  String get privacyPolicy3Content2 => '1. 会员注册和管理\n姓名，出生日期，性别，登录ID，密码，家庭电话号码，移动电话号码，电子邮件，14岁以下会员的法定代理人信息\n2. 服务申请时\n地址，支付信息\n・ 在服务使用过程中或业务处理过程中，可能会产生和收集服务使用记录、访问日志、Cookie、访问IP、支付记录、不良使用记录。';

  @override
  String get privacyPolicy4 => '4. 个人信息的收集方法';

  @override
  String get privacyPolicy4Content1 => '网站、书面表格、留言板、电子邮件、活动报名、送货请求、电话、传真、通过创建信息收集工具进行收集';

  @override
  String get privacyPolicy5 => '5. 14岁以下儿童的个人信息处理事项';

  @override
  String get privacyPolicy5Content1 => '① 成功狂热者在收集14岁以下儿童的个人信息时，将获得法定代理人的同意，并仅收集对于执行相关服务所必要的最少个人信息。\n• 必填项目：法定代理人的姓名，关系，联系方式';

  @override
  String get privacyPolicy5Content2 => '② 此外，为了与儿童相关的促销活动，将收集儿童的个人信息，需要从法定代理人那里获得单独的同意。';

  @override
  String get privacyPolicy5Content3 => '③ 成功狂热者在收集14岁以下儿童的个人信息时，可以要求儿童提供法定代理人的姓名和联系方式等最少信息，并通过以下方法之一确认法定代理人是否同意。\n• 在包含同意内容的互联网网站上，法定代理人标记同意与否，并通过短信向法定代理人发送个人信息处理者已确认同意的方式\n• 在包含同意内容的互联网网站上，法定代理人标记同意与否，并提供法定代理人的信用卡、借记卡等卡片信息的方式\n• 在包含同意内容的互联网网站上，法定代理人标记同意与否，并通过法定代理人的移动电话认证等方式确认其身份\n• 向法定代理人直接发放包含同意内容的书面文件，或通过邮件或传真发送，并要求法定代理人签名和盖章后提交的方式\n• 发送包含同意内容的电子邮件，并收到法定代理人确认同意的电子邮件的方式\n• 通过电话告知法定代理人同意内容，并获得同意或者指导法定代理人确认内容的互联网地址等方式，并再次进行电话通话的方式\n• 采用其他类似的方式向法定代理人告知同意内容，并确认同意的意愿';

  @override
  String get privacyPolicy6 => '6. 个人信息的销毁程序和方法';

  @override
  String get privacyPolicy6Content1 => '① 成功狂热者在个人信息保留期限届满、处理目的实现或不再需要个人信息时，应立即销毁相应的个人信息。';

  @override
  String get privacyPolicy6Content2 => '② 即使收集到的个人信息的保存期限已经过期或者处理目的已经实现，但是根据其他法律的规定需要继续保存个人信息的情况下，应将相应个人信息转移到单独的数据库(DB)，或者变更保存地点继续保存。';

  @override
  String get privacyPolicy6Content3 => '③ 个人信息销毁的程序和方法如下。\n1. 销毁程序成功狂热者选择销毁个人信息的程序，并经个人信息保护负责人批准后销毁个人信息。\n2. 销毁方法以电子形式记录的个人信息为例，使记录无法再生，并对纸质文档进行粉碎处理或焚烧销毁。';

  @override
  String get privacyPolicy7 => '7. 信息主体和法定代理人的权利、义务及行使方法';

  @override
  String get privacyPolicy7Content1 => '① 信息主体有权随时行使个人信息查阅、更正、删除、处理停止等权利。\n※ 14岁以下儿童个人信息的查阅等请求应由法定代理人直接进行，14岁以上未成年人信息主体可以通过本人行使权利或通过法定代理人行使权利。';

  @override
  String get privacyPolicy7Content2 => '② 行使权利应根据《个人信息保护法》施行令第41条第1款的规定通过书面、电子邮件、传真等方式进行，成功狂热者将立即采取措施。';

  @override
  String get privacyPolicy7Content3 => '③ 行使权利也可以通过信息主体的法定代理人或受委托人等代理人行使。在这种情况下，应提交根据“个人信息处理方法通知(第2020-7号)”附件第11号表格的委托书。';

  @override
  String get privacyPolicy7Content4 => '④ 个人信息的查阅和处理停止请求可能根据《个人信息保护法》第35条第4款、第37条第2款的规定而受到限制。';

  @override
  String get privacyPolicy7Content5 => '⑤ 根据其他法律规定，个人信息的收集对象是该信息不得要求删除的情况下，不能要求删除。';

  @override
  String get privacyPolicy7Content6 => '⑥ 成功狂热者在接受信息主体的查阅请求、更正·删除请求、处理停止请求时，将确认请求者是本人或法定代理人或具有合法代理权的人。';

  @override
  String get privacyPolicy8 => '8. 个人信息的安全措施';

  @override
  String get privacyPolicy8Content1 => '成功狂热者为了保护个人信息的安全，采取了以下措施。\n1. 管理措施：建立和实施内部管理计划，运行专门组织，定期进行员工教育\n2. 技术措施：管理个人信息处理系统等的访问权限，安装访问控制系统，对个人信息进行加密，安装和更新安全程序\n3. 物理措施：访问控制到计算机室、数据存储室等';

  @override
  String get privacyPolicy9 => '9. 关于安装、运行和拒绝个人信息自动收集设备的事项';

  @override
  String get privacyPolicy9Content1 => '① 当成功狂热者为了向用户提供个性化服务而存储和定期检索使用信息时，将使用“Cookie”。';

  @override
  String get privacyPolicy9Content2 => '② Cookie是由运行网站的服务器(http)发送给用户的计算机浏览器的小量信息，也可以存储在用户的个人电脑硬盘上。\n一。 使用Cookie的目的：用于了解用户访问和使用每项服务和网站的方式，热门搜索词，安全连接状态等，以便提供最适合用户的信息。\n二。 拒绝安装·操作和拒绝：用户可以通过浏览器顶部的工具> Internet Options>隐私菜单中的选项设置拒绝Cookie存储。\n三。 如果拒绝保存Cookie，可能会对个性化服务的使用造成困扰。';

  @override
  String get privacyPolicy10 => '10. 与个人信息相关的投诉服务';

  @override
  String get privacyPolicy10Content1 => '为了保护客户的个人信息并处理与个人信息相关的投诉，成功狂热者已指定以下部门和个人信息保护官员。';

  @override
  String get privacyPolicy10Content2 => '• 个人信息保护官员\n姓名：Jo Bokyeong\n公司：成功狂热者\n电话号码：010-8222-8317\n电子邮件：bokyeong19@mecelljoo.kr';

  @override
  String get privacyPolicy10Content3 => '• 个人信息保护官员\n姓名：Jo Bokyeong\n公司：成功狂热者\n电话号码：010-8222-8317\n电子邮件：dhcoan12@naver.com';

  @override
  String get privacyPolicy10Content4 => '• 您可以将您使用公司服务过程中产生的所有与个人信息保护相关的投诉报告给个人信息保护官员或相关部门。\n• 公司将尽快给予用户的投诉充分的答复。\n• 如果您需要报告或咨询其他个人信息侵犯的情况，请咨询以下机构。';

  @override
  String get privacyPolicy10Content5 => '个人信息侵犯报告中心\n(privacy.kisa.or.kr / 无国家号码的118)';

  @override
  String get privacyPolicy10Content6 => '个人信息纠纷调解委员会\n(kopico.go.kr / 1833-6972)';

  @override
  String get privacyPolicy10Content7 => '检察厅网络犯罪调查科\n(spo.go.kr / 区号+1301)';

  @override
  String get privacyPolicy10Content8 => '警察厅网络安全局\n(cyberbureau.police.go.kr / 没有区号182)';

  @override
  String minutesAgo(String time) {
    return '$time 分钟前';
  }

  @override
  String hoursAgo(String time) {
    return '$time 小时前';
  }

  @override
  String totalItems(int totalItems) {
    return '总计 $totalItems 个';
  }

  @override
  String get notificationAlert => '通知';

  @override
  String get ok => '确定';

  @override
  String get check => '检查';

  @override
  String get comment => '评论';

  @override
  String get viewProfile => '查看个人资料';

  @override
  String get writer => '作者';

  @override
  String get writeReply => '写回复';

  @override
  String get great => '很棒';

  @override
  String get joinMemberShip => '加入会员';

  @override
  String get placeHolderId => 'ID';

  @override
  String get validationId => '英文和数字，8个字符或更少';

  @override
  String get placeHolderPassword => '密码';

  @override
  String get validationPassword => '英文和数字与特殊字符混合，8-16个字符';

  @override
  String get doubleCheck => '再次确认';

  @override
  String get doubleCheckFail => '该用户名已存在。请使用其他用户名。';

  @override
  String get doubleCheckSuccess => '重复检查已完成。该用户名可用。';

  @override
  String get placeHolderConfirmPassword => '确认密码';

  @override
  String get placeHolderName => '姓名';

  @override
  String get placeHolderPhone => '电话号码';

  @override
  String get sendAuthentication => '发送认证';

  @override
  String get otpNumber => 'OTP 号码';

  @override
  String get verify => '验证';

  @override
  String get placeHolderReferrerPhoneNumber => '推荐人电话号码（可选）';

  @override
  String get usernameExisted => '该用户名已存在。';

  @override
  String get phoneNumberExisted => '该电话号码已被使用。';

  @override
  String get verifyOTPSuccess => 'OTP 验证成功';

  @override
  String get empty => '此字段不能为空。';

  @override
  String get usernameInvalid => '必须是英文字母和数字的组合，至少6个字符';

  @override
  String get passwordInvalid => '必须包含英文字母、数字和特殊字符，至少8个字符';

  @override
  String get confirmPasswordNotMatch => '密码不匹配';

  @override
  String get phoneInvalid => '电话号码格式不正确。';

  @override
  String get otpInvalid => '必须是6位数字';

  @override
  String get phoneNumberNotExisted => '该电话号码不存在于应用程序中。';

  @override
  String usernameOfPhoneNumber(String phoneNumber) {
    return '$phoneNumber的用户名为';
  }

  @override
  String couldNotLunch(String content) {
    return '我没吃午饭 $content';
  }

  @override
  String get id => '是';

  @override
  String get resetPassword => '重置密码';

  @override
  String get verifyAccountFailed => '用户名与电话号码不匹配';

  @override
  String get pleaseEnterPassword => '请输入要重置的密码。';

  @override
  String get passwordCondition => '(必须包含英文字母、数字和特殊字符，至少8个字符)';

  @override
  String get button => '按钮';

  @override
  String resetPasswordSuccess(Object phoneNumber) {
    return '$phoneNumber的密码\n已重置。';
  }

  @override
  String get productInformation => '产品信息';

  @override
  String get review => '评论';

  @override
  String get inquiry => '查询';

  @override
  String get purchaseReview => '购买评论';

  @override
  String get writeReview => '撰写评论';

  @override
  String get shoppingCart => '购物车';

  @override
  String get buyNow => '立即购买';

  @override
  String get temporaryStorage => '暂存';

  @override
  String get registration => '注册';

  @override
  String get pleaseChooseCategory => '请选择类别。';

  @override
  String get pleaseSelectSubCategory => '请选择子类别。';

  @override
  String get pleaseEnterSubject => '请输入主题。';

  @override
  String get pleaseEnterYourDetails => '请输入您的详细信息。';

  @override
  String get editPhoto => '编辑照片';

  @override
  String get notification => '通知';

  @override
  String get writeQA => '撰写咨询';

  @override
  String get qaCompleted => '已回复';

  @override
  String get qaHidden => '这是私密帖。';

  @override
  String get sendWrittenReview => '撰写评论';

  @override
  String get productRating => '商品评分';

  @override
  String get uploadImage => '上传图片';

  @override
  String get writeReviewTextBoxTitle => '写评论';

  @override
  String get writeReviewHintText => '请告诉我们您对产品的评论';

  @override
  String get takePicture => '拍照';

  @override
  String get pickFromGallery => '从相册选择';

  @override
  String get deletePicture => '删除图片';

  @override
  String get cancel => '取消';

  @override
  String get composeQA => '商品咨询';

  @override
  String get submitQA => '提交咨询';

  @override
  String get qaCategoryType => '咨询类型';

  @override
  String get qaCategoryTypePlaceHolder => '请选择';

  @override
  String get qaDetails => '咨询详情';

  @override
  String get qaDetailsHintText => '请输入咨询内容';

  @override
  String get favoriteBoard => '收藏板';

  @override
  String get follower => '粉丝';

  @override
  String get delete => '删除';

  @override
  String get followManage => '管理关注';

  @override
  String get referrerStatus => '推荐人状态';

  @override
  String get currentReferrer => '当前推荐人数';

  @override
  String numberPeople(Object number) {
    return '$number人';
  }

  @override
  String get currentReferrerList => '当前推荐人列表';

  @override
  String get next => '下一步';

  @override
  String get personalInfoTermAccept => '(必选) 同意隐私政策';

  @override
  String get smTermAccept => '(必选) 同意服务使用条款';

  @override
  String get view => '查看';

  @override
  String get agreeToTermAndCond => '同意条款和条件';

  @override
  String get termOfUseSMMall => '同意成功狂热者商城使用条款';

  @override
  String get termOfUseSMMallTitle => '使用条款';

  @override
  String get successSecretOfTop1 => '顶级1%的企业家分享的\n成功秘诀';

  @override
  String get termAndCondDetails => '政策和条款详情';

  @override
  String cartItemAmount(int amount) {
    return '共 $amount 件';
  }

  @override
  String get selectAll => '全选';

  @override
  String get editBusinessCard => '编辑名片';

  @override
  String get businessCardDetails => '查看名片详情';

  @override
  String get activity => '活动';

  @override
  String get followManagement => '关注管理';

  @override
  String get favoritesBulletinBoard => '收藏的公告板';

  @override
  String get curationActivities => '策展活动';

  @override
  String get communityActivities => '社区活动';

  @override
  String get myDeliveryInformation => '我的交货信息';

  @override
  String get checkOrderDeliveryDetails => '查看订单交货详情';

  @override
  String get inquiryDetails => '咨询详情';

  @override
  String get etc => '等等';

  @override
  String get recommenderStatus => '推荐人状态';

  @override
  String get entire => '全部';

  @override
  String get beforeDelivery => '未发货';

  @override
  String get shipping => '运输中';

  @override
  String get deliveryComplete => '已送达';

  @override
  String get refund => '退货/退款';

  @override
  String get exchange => '换货';

  @override
  String get deliveryInquiry => '查询配送';

  @override
  String get orderDetails => '订单详情';

  @override
  String numberProducts(Object number) {
    return '$number件';
  }

  @override
  String get paymentInformation => '支付信息';

  @override
  String get totalProductAmount => '商品总额';

  @override
  String get deliveryFee => '运费';

  @override
  String get totalDiscountAmount => '总折扣金额';

  @override
  String get paymentAmount => '支付金额';

  @override
  String get pointAccumulation => '积分累积';

  @override
  String get paymentReceipt => '支付收据';

  @override
  String get accumulationExpected => '预计累积';

  @override
  String get ordererInformation => '订购人信息';

  @override
  String get phoneNumber => '电话号码';

  @override
  String get email => '电子邮件';

  @override
  String get deliveryInformation => '交货信息';

  @override
  String get orderPayment => '订单 / 支付';

  @override
  String get orderer => '订购人';

  @override
  String get changeAddress => '更改地址';

  @override
  String get defaultShippingAddress => '默认送货地址';

  @override
  String get addShippingAddress => '添加送货地址';

  @override
  String get add => '添加';

  @override
  String get whatYouWrote => '您所写的';

  @override
  String get postWithComment => '评论的帖子';

  @override
  String get likedPost => '点赞的帖子';

  @override
  String get justNow => '刚刚';

  @override
  String get noPost => '没有帖子';

  @override
  String get exploreOurCommunity => '探索我们的社区';

  @override
  String get exploreCurator => '探索策展人';

  @override
  String get myProfile => '我的个人资料';

  @override
  String get businessCardEdit => '名片编辑';

  @override
  String get basicInformation => '基本信息';

  @override
  String get socialMedia => '社交媒体';

  @override
  String get linkUrl => '链接 URL';

  @override
  String get snsSelect => '选择 SNS';

  @override
  String get addition => '添加';

  @override
  String get fileAttach => '附加文件';

  @override
  String get list => '列表';

  @override
  String get title => '标题';

  @override
  String get imageFile => '图像文件';

  @override
  String get deletePhoto => '删除照片';

  @override
  String get changePhoto => '更改照片';

  @override
  String get follow => '关注';

  @override
  String get following => '正在关注';

  @override
  String get setting => '设置';

  @override
  String get accountInformationManagement => '帐户信息管理';

  @override
  String get signInWithNaver => '正在使用Naver登录';

  @override
  String get signInWithKakao => '正在使用Kakao登录';

  @override
  String get signInWithGoogle => '正在使用Google登录';

  @override
  String get signInWithApple => '正在使用Apple登录';

  @override
  String get notificationSettings => '通知设置';

  @override
  String get languageSettings => '语言设置';

  @override
  String get korean => '韩语';

  @override
  String get usagePolicy => '使用政策';

  @override
  String get logout => '注销';

  @override
  String get edit => '编辑';

  @override
  String get withdrawal => '退出会员';

  @override
  String get save => '保存';

  @override
  String get changePassword => '修改密码';

  @override
  String get editCellPhoneNumber => '编辑手机号码';

  @override
  String get followNewPostNotification => '关注新帖子通知';

  @override
  String get commentAlert => '评论提醒';

  @override
  String get likeAlert => '点赞提醒';

  @override
  String get termAndPolicyConditions => '使用政策和条款';

  @override
  String get currentPassword => '当前密码';

  @override
  String get passwordToChange => '要更改的密码';

  @override
  String get change => '更改';

  @override
  String get changePhoneNumber => '更改电话号码';

  @override
  String get recentSearches => '最近搜索';

  @override
  String get clearAllHistory => '清除所有历史记录';

  @override
  String get someThingWentWrong => '出了点问题。';

  @override
  String get addThumbnail => '添加缩略图';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get someError => '发生了一些错误。';

  @override
  String get product => '商品';

  @override
  String get delivery => '配送';

  @override
  String get other => '其他';

  @override
  String get loginAndSignUp => '登录和注册';

  @override
  String get youNeedToLoginToAccessThisContent => '您需要登录才能访问此内容';

  @override
  String get goToLoginPage => '前往登录页面';

  @override
  String get pleaseLoginToViewRegisteredInformation => '请登录以查看已注册的信息。';

  @override
  String get alertProductAddedToCart => '已添加到购物车的产品';

  @override
  String get orderProduct => '订购产品';

  @override
  String get addressSearch => '地址搜索';

  @override
  String totalPrice(Object price, Object totalProduct) {
    return '共 $totalProduct件 $price韩元';
  }

  @override
  String totalPriceWithoutNumber(double price) {
    final intl.NumberFormat priceNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String priceString = priceNumberFormat.format(price);

    return '支付 $priceString韩元';
  }

  @override
  String get orderProductAgree => '我已确认并同意订单产品的产品名称、价格和交货信息。';

  @override
  String get addToCart => '添加到购物车';

  @override
  String get leaveAComment => '留下评论';

  @override
  String get replyingTo => '回复给：';

  @override
  String get editingComment => '编辑评论...';

  @override
  String get noFollowers => '无关注者';

  @override
  String get noFollowings => '没有关注';

  @override
  String get paymentFailedMessage => '支付失败。\n请重试。';

  @override
  String get paymentSuccessMessage => '支付成功。\n感谢您的订单。';

  @override
  String get apply => '申请';

  @override
  String get noPostDisplayed => '没有显示的帖子。';

  @override
  String get urlInvalid => '无效的URL。';

  @override
  String get copiedToClipboard => '已复制到剪贴板。';

  @override
  String get invalidEmailFormat => '无效的电子邮件格式';

  @override
  String get areYouSureYouWantToUnregister => '您确定要取消注册吗？';

  @override
  String get areYouSureYouWantToDelete => '您确定要删除吗？';

  @override
  String get inquiryCategory => '查询类别';

  @override
  String get answerComplete => '回答完成';

  @override
  String get emptyList => '空';

  @override
  String get savePostSuccess => '帖子已保存';

  @override
  String get unconfirmed => '未确认';

  @override
  String get confirmed => '已确认';

  @override
  String get delivered => '已交付';

  @override
  String get informationSupplement => '资料补充';

  @override
  String get commentMyPost => '评论';

  @override
  String get followingUploadPost => '最新帖子';

  @override
  String get reactMyPost => '反应';

  @override
  String get shareSuccessfully => '分享成功';

  @override
  String get daddrs1000 => '找不到地址';

  @override
  String get aa1000 => '找不到用户';

  @override
  String get aa1001 => '访问被拒绝';

  @override
  String get aa1002 => '访问令牌已过期';

  @override
  String get aa1003 => '刷新令牌已过期';

  @override
  String get aa1004 => '会话令牌已过期';

  @override
  String get aa1005 => '令牌无效';

  @override
  String get aa1006 => 'Google ID 令牌无效';

  @override
  String get aa1007 => '无法发送 OTP';

  @override
  String get aa1008 => 'OTP 已过期';

  @override
  String get aa1009 => 'OTP 不匹配';

  @override
  String get aa1010 => '此用户不支持的身份验证方法';

  @override
  String get aa1011 => 'Kakao 令牌无效';

  @override
  String get aa1012 => 'Naver 令牌无效';

  @override
  String get a1001 => '内部服务器错误';

  @override
  String get a1002 => '无效的请求数据';

  @override
  String get a1003 => '不支持的请求方法';

  @override
  String get dcrt1000 => '找不到购物车';

  @override
  String get dcrt1001 => '产品数量必须小于或等于库存数量';

  @override
  String get dc1000 => '不能添加第二级分类的子分类';

  @override
  String get dc1001 => '不允许添加子分类';

  @override
  String get dc1002 => '分类类型不正确';

  @override
  String get dc1003 => '不能删除分类';

  @override
  String get dc1004 => '不能更改分类名称';

  @override
  String get dc1005 => '找不到分类';

  @override
  String get dcmt1000 => '找不到评论';

  @override
  String get dcmt1001 => '找不到父评论';

  @override
  String get dcmt1002 => '无权编辑';

  @override
  String get dcmt1003 => '不能回复隐藏评论';

  @override
  String get dfvrcate1000 => '只接受父类别的收藏类别';

  @override
  String get af1000 => '上传的文件名无效';

  @override
  String get af1001 => '不支持的文件类型';

  @override
  String get af1002 => '文件解析错误';

  @override
  String get dfile1000 => '找不到文件';

  @override
  String get dfl1000 => '不能关注自己';

  @override
  String get dfl1001 => '不能取消关注自己';

  @override
  String get dl1005 => '不支持的区域设置';

  @override
  String get dmp1000 => '找不到主页';

  @override
  String get dntf1000 => '找不到通知';

  @override
  String get dntfs1000 => '找不到通知设置';

  @override
  String get dordd1000 => '找不到订单详情';

  @override
  String get aods1 => '找不到订单详情会话';

  @override
  String get dord1000 => '订单失败';

  @override
  String get dord1001 => '找不到订单';

  @override
  String get dord1002 => '订单不属于此用户';

  @override
  String get dord1003 => '只能取消订单状态为：未确认 - 已确认';

  @override
  String get dord1004 => '只能取消订单状态为：未确认 - 已确认 - 交付';

  @override
  String get dord1005 => '管理员只能按顺序更改订单状态：未确认 -> 已确认 -> 交付 -> 已交付';

  @override
  String get dord1006 => '管理员只能按顺序退款订单状态：取消 -> 退款';

  @override
  String get dord1007 => '退款失败';

  @override
  String get aos1 => '找不到订单会话';

  @override
  String get aos2 => '产品数量必须小于或等于库存数量';

  @override
  String get dpst1000 => '找不到帖子';

  @override
  String get dpst1001 => '只接受子类别的帖子';

  @override
  String get dpst1002 => '只接受父类别的帖子';

  @override
  String get dpst1003 => '帖子类别不匹配';

  @override
  String get dpst1004 => '帖子父类别必填';

  @override
  String get dprd1000 => '找不到产品';

  @override
  String get dpu1000 => '找不到个人资料网址';

  @override
  String get dqa1000 => '找不到问答';

  @override
  String get dqa1001 => '不能删除他人的问答';

  @override
  String get drt1000 => '找不到评分';

  @override
  String get drt1001 => '不能删除他人的评价';

  @override
  String get drct1000 => '找不到反应';

  @override
  String get dsf1000 => '找不到运费';

  @override
  String get dsm1000 => '找不到社交媒体';

  @override
  String get au1000 => '找不到用户';

  @override
  String get du1001 => '无效的电子邮件格式';

  @override
  String get du1002 => '无效的电话号码格式';

  @override
  String get du1003 => '用户类型不允许使用密码';

  @override
  String get du1004 => '用户已经推荐过其他用户';

  @override
  String get du1005 => '密码错误';

  @override
  String get du1006 => '无效的密码格式';

  @override
  String get du1007 => '无效的用户名格式';

  @override
  String get du1008 => '重复的用户名';

  @override
  String get du1009 => '重复的电子邮件';

  @override
  String get du1010 => '重复的用户电话号码';

  @override
  String get du1011 => '无法更改社交用户的电子邮件';

  @override
  String get du1012 => '无法更改社交用户的电话号码';

  @override
  String get du1013 => '用户未完成注册';

  @override
  String get du1014 => '用户不需要补充信息';

  @override
  String get du1015 => '用户角色不足';

  @override
  String get du1016 => '找不到用户';

  @override
  String get du1017 => '无法停用系统帐户';

  @override
  String get sw101 => '发行的唯一密钥不存在。';

  @override
  String get sw102 => '密钥已过期。';

  @override
  String get sw103 => '超出密钥使用限制。';

  @override
  String get sw104 => '无效的运单号或快递公司代码输入。';

  @override
  String get sw105 => '超过同一运单的每日请求限制。';

  @override
  String get sw106 => '运单号查询错误。';

  @override
  String get sw500 => '服务器错误。';

  @override
  String get dtc1001 => '找不到条款和条件';

  @override
  String get connectionFailure => '无法连接到服务器。请稍后再试。';

  @override
  String get timeoutFailure => '请求超时';

  @override
  String get otherDioFailure => '出现了一些问题';

  @override
  String get convertDataFailure => '数据转换失败';

  @override
  String get genericFailure => '通用失败';

  @override
  String get persistentFailure => '持续失败';

  @override
  String get recipient => '收件人';

  @override
  String get address => '地址';

  @override
  String get checkAddressSearch => '地址搜索';

  @override
  String get enterDetailedAddress => '输入详细地址';

  @override
  String get setDefaultAddress => '设置默认地址';

  @override
  String get longVideo => '長い';

  @override
  String get shortVideo => '短い';

  @override
  String get reaction => '反応';

  @override
  String get viewDetails => '查看详细信息';

  @override
  String get areYouSureYouWantToCancelThisOrder => '您确定要取消此订单吗？';

  @override
  String get deliveryStatus => '配送状态';

  @override
  String get waybillNumber => '运单号';

  @override
  String get productAcceptance => '商品接收';

  @override
  String get productInTransit => '商品运送中';

  @override
  String get deliveryArrived => '送货抵达';

  @override
  String get startDelivery => '开始配送';

  @override
  String get deliveryInformationHasNotBeenUpdated => '送货信息尚未更新。 请稍后再试';

  @override
  String get dicountInvalid => '折扣不能超过订单价值的 30%';

  @override
  String get payment => '付款';

  @override
  String get inquiryHistory => '查询历史';

  @override
  String get answeredInquiry => '已答复';

  @override
  String get pending => '待处理';

  @override
  String get small => '小';

  @override
  String get normal => '普通';

  @override
  String get large => '大';

  @override
  String get huge => '巨大';

  @override
  String get content => '内容';

  @override
  String get report => '報告';

  @override
  String get areYouSureToReportThisPost => '您確定要檢舉此貼文嗎？';

  @override
  String get areYouSureToReportThisComment => '您確定要檢舉此評論嗎？';

  @override
  String get areYouSureToReportThisUser => '您確定要檢舉該使用者嗎？';

  @override
  String get reportScreen => '被举报的帖子、评论、资料';

  @override
  String get reportedPost => '被举报的帖子';

  @override
  String get reportedComment => '被举报的评论';

  @override
  String get reportedUser => '举报用户';

  @override
  String get areYouSureToDeleteThisPost => '您确定要删除这条帖子吗？';

  @override
  String get areYouSureToDeleteThisComment => '您确定要删除这条评论吗？';

  @override
  String get areYouSureToDeleteThisUser => ' 您确定要删除此用户吗？';

  @override
  String get cancelOrder => '주문 취소';

  @override
  String get wouldYouLikeSendAnInquiry => '您想发送询问吗?';

  @override
  String get wouldYouLikeUploadPost => 'W您要上传帖子吗?';

  @override
  String get wouldYouLikeUploadAReview => '您要上传评价吗?';

  @override
  String get all => '全部';
}
