import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class SJa extends S {
  SJa([String locale = 'ja']) : super(locale);

  @override
  String get home => 'ホーム';

  @override
  String get community => 'コミュニティ';

  @override
  String get forum => 'フォーラム';

  @override
  String get store => 'ストア';

  @override
  String get profile => 'マイページ';

  @override
  String get profileNavText => 'MY';

  @override
  String get news => 'NEWS';

  @override
  String get fullMenu => '全体メニュー';

  @override
  String get bestReview => 'Best Review';

  @override
  String get pressAgainToCloseApp => 'アプリを閉じるにはもう一度押してください。';

  @override
  String get seeAll => 'すべて表示';

  @override
  String get onlineMagazine => 'ONLINE MAGAZINE';

  @override
  String get sgmNews => 'SGM NEWS';

  @override
  String get sungongMuseum => 'SUNGONG MUSEUM';

  @override
  String get communityCategory => 'コミュニティカテゴリー';

  @override
  String get bulletBoardCategory => 'フォーラムカテゴリー';

  @override
  String get storeCategory => 'ストアカテゴリー';

  @override
  String get sungongMuseumKo => 'スンゴン博物館';

  @override
  String get category => 'カテゴリー';

  @override
  String get companyName => '株式会社成功マニア';

  @override
  String get ceoTitle => '代表取締役 : ';

  @override
  String get ceo => 'オ・チェム';

  @override
  String get emailTitle => 'メールアドレス : ';

  @override
  String get emailValue => 'ocm@mecelljoo.kr';

  @override
  String get contactNumberTitle => '代表番号 : ';

  @override
  String get contactNumber => '070-5213-7613';

  @override
  String get businessRegistrationNumberTitle => '事業者登録番号 : ';

  @override
  String get businessRegistrationNumber => '887-87-02726';

  @override
  String get ecommerceRegistrationNumberTitle => '通信販売届出番号 : ';

  @override
  String get ecommerceRegistrationNumber => '2023-忠南天安-3531';

  @override
  String get personalInfoProtectionOfficerTitle => '個人情報保護責任者 : ';

  @override
  String get personalInfoProtectionOfficer => 'オ・チェム';

  @override
  String get officerEmailTitle => '担当者のメールアドレス : ';

  @override
  String get officerEmail => 'ocm@mecelljoo.kr';

  @override
  String get addressTitle => '住所 : ';

  @override
  String get addressValue => '[31156] 韓国忠清南道天安市西北区プルダン22道86 (マーベラスSタワー) 804号';

  @override
  String get copyrightTitle => '著作権 ';

  @override
  String get copyright => 'ⓒ 2024 成功マニア All rights reserved.';

  @override
  String get latest => '最新順';

  @override
  String get popular => '人気順';

  @override
  String get recommended => 'おすすめ順';

  @override
  String get compose => '投稿する';

  @override
  String get bestContents => 'Best Contents';

  @override
  String get onlineMagazineKo => 'オンラインマガジン';

  @override
  String get bestReviewLower => 'Best Review';

  @override
  String get selfEmployment => '自営業';

  @override
  String get sales => '営業';

  @override
  String get houseWife => '主婦';

  @override
  String get officeWorkers => '会社員';

  @override
  String get inseldeomBusiness => 'インセルダムビジネス';

  @override
  String get allPosts => '全ての投稿';

  @override
  String get favoritePosts => 'お気に入りの投稿';

  @override
  String get popularPosts => '人気の投稿';

  @override
  String get curator => 'キュレーター';

  @override
  String get unit => '원';

  @override
  String commonCurrencyFormat(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return '$valueString원';
  }

  @override
  String get easyLoginSNS => 'SNS簡単ログイン';

  @override
  String get signIn => 'ログイン';

  @override
  String get register => '会員登録';

  @override
  String get findId => 'IDを探す';

  @override
  String get findPassword => 'パスワードを忘れる';

  @override
  String get password => 'パスワード';

  @override
  String get username => 'ユーザー名';

  @override
  String get termOfService => 'サクセスマニアモール利用規約';

  @override
  String get termOfServiceTitle => 'サービス利用規約';

  @override
  String get termOfService1 => '第1条（目的）';

  @override
  String get termOfService1Content1 => 'この規約は、サクセスマニア（電子商取引事業者）が運営するサクセスマニアサイバーモール（以下、「モール」とします）で提供するインターネット関連サービス（以下、「サービス」とします）を利用する際のモールと利用者の権利、義務、および責任事項を定めることを目的とします。\n※PC通信、無線などを利用する電子商取引についても、その性質に反しない限り、この規約を準用します。';

  @override
  String get termOfService2 => '第2条（定義）';

  @override
  String get termOfService2Content1 => '①「モール」とは、サクセスマニアが商品または役務（以下、「商品等」とします）を利用者に提供するために、コンピューター等の情報通信設備を利用して商品等を取引できるように設定した仮想の営業所を指し、また、サイバーモールを運営する事業者の意味でも使用します。';

  @override
  String get termOfService2Content2 => '②「利用者」とは、「モール」に接続して本規約に従って「モール」が提供するサービスを受ける会員および非会員を指します。';

  @override
  String get termOfService2Content3 => '③‘会員’とは、「モール」に会員登録をした者であり、継続的に「モール」が提供するサービスを利用できる者を指します。';

  @override
  String get termOfService2Content4 => '④‘非会員’とは、会員に加入せずに「モール」が提供するサービスを利用する者を指します。';

  @override
  String get termOfService3 => '第3条（規約等の明示および説明、および改定）';

  @override
  String get termOfService3Content1 => '①「モール」は、この規約の内容と相互および代表者氏名、営業所所在地住所（消費者の苦情を処理できる場所の住所を含む）、電話番号、ファクシミリ番号、電子メールアドレス、事業者登録番号、通信販売業申告番号、個人情報保護責任者などを利用者が簡単に知ることができるように、サクセスマニアサイバーモールの初期サービス画面（全面）に掲示します。ただし、規約の内容は利用者が連結画面を通じて見ることができるようにすることができます。';

  @override
  String get termOfService3Content2 => '②「モール」は、利用者が規約に同意する前に規約に定められた内容のうち、クーリングオフ、配送責任、返金条件など重要な内容を利用者が理解できるように別途の連結画面やポップアップ画面などを提供して利用者の確認を求めなければなりません。';

  @override
  String get termOfService3Content3 => '③「モール」は、「電子商取引等に関する消費者保護に関する法律」、「規約の制約に関する法律」、「電子文書および電子取引基本法」、「電子金融取引法」、「電子署名法」、「情報通信網利用促進および情報保護等に関する法律」、「訪問販売等に関する法律」、「消費者基本法」など関連法を違反しない範囲でこの規約を改定することができます。';

  @override
  String get termOfService3Content4 => '④「モール」が規約を改定する場合は、適用日および改定理由を明示して現行規約とともにモールの初期画面にその適用日の7日前から適用日前日まで公示します。ただし、利用者に不利な規約内容を変更する場合には、少なくとも30日以上の事前猶予期間を設けて公示します。この場合、「モール」は改定前後の内容を明確に比較して利用者がわかりやすく表示します。';

  @override
  String get termOfService3Content5 => '⑤「モール」が規約を改定する場合は、その改定規約はその適用日以降に締結される契約にのみ適用され、その前に既に締結された契約に対しては改定前の規約条項がそのまま適用されます。ただし既に契約を締結した利用者が改定規約条項の適用を希望する意思を第3項による改定規約の公示期間内に「モール」に送信して「モール」の同意を得た場合には、改定規約条項が適用されます。';

  @override
  String get termOfService3Content6 => '⑥ この規約に定められていない事項およびこの規約の解釈に関しては、電子商取引等に関する消費者保護に関する法律、規約の制約等に関する法律、公正取引委員会が定める電子商取引等に関する消費者保護指針および関係法令または慣習に従います。';

  @override
  String get termOfService4 => '第4条（サービスの提供および変更）';

  @override
  String get termOfService4Content1 => '①「モール」は以下の業務を行います。\n1. 商品または役務に関する情報提供および購入契約の締結\n2. 購入契約が締結された商品または役務の配送\n3. その他「モール」が定める業務';

  @override
  String get termOfService4Content2 => '②「モール」は商品または役務の在庫切れまたは技術仕様の変更などの場合には、将来の契約によって提供される商品または役務の内容を変更することができます。この場合は、変更された商品または役務の内容および提供日を明示して、現在の商品または役務の内容が掲載された場所に即時に公告します。';

  @override
  String get termOfService4Content3 => '③「モール」が提供することになっているサービスの内容を商品等の在庫切れや技術的仕様の変更などの理由で変更する場合には、その理由を利用者が通知可能な住所に即時に通知します。';

  @override
  String get termOfService4Content4 => '④前項の場合、「モール」はこれにより利用者が被った損害を賠償します。ただし、「モール」が故意または過失がないことを証明する場合には、この限りではありません。';

  @override
  String get termOfService5 => '第5条（サービスの中断）';

  @override
  String get termOfService5Content1 => '①「モール」はコンピューター等の情報通信設備の保守点検、交換および故障、通信の断絶などの理由が発生した場合には、サービスの提供を一時的に中断することがあります。';

  @override
  String get termOfService5Content2 => '②「モール」は第1項の理由でサービスの提供が一時的に中断されたことにより利用者または第三者が被った損害については、賠償します。ただし、「モール」が故意または過失がないことを証明する場合には、この限りではありません。';

  @override
  String get termOfService5Content3 => '③事業種目の変更、事業の放棄、企業間の統合などの理由でサービスを提供できなくなる場合には、「モール」は第8条に定める方法で利用者に通知し、当初「モール」から提示された条件に従って消費者に補償します。ただし、「モール」が補償基準などを公示しない場合には、利用者のマイレージまたはポイントなどを「モール」で通用する通貨価値に相当する物品または現金で利用者に支払います。';

  @override
  String get termOfService6 => '第6条（会員登録）';

  @override
  String get termOfService6Content1 => '①利用者は、「モール」が定めた入会申込書に従って会員情報を記入した後、この規約に同意する意思表示を行うことにより、会員登録を申請します。';

  @override
  String get termOfService6Content2 => '②「モール」は第1項と同様に会員として登録することを申請した利用者のうち、次の各号に該当しない限り会員として登録します。\n1. 登録内容に虚偽、記載漏れ、誤記がある場合\n2. 登録申請者がこの規約第7条第3項により以前に会員資格を喪失したことがある場合、ただし第7条第3項による会員資格喪失後3年が経過した者として「モール」の会員再加入承認を得た場合を除く。\n3. その他、会員として登録することが「モール」の技術的に著しく障害があると判断される場合';

  @override
  String get termOfService6Content3 => '③会員登録契約の成立時期は、「モール」の承諾が会員に到達した時点とします。';

  @override
  String get termOfService6Content4 => '④会員は会員登録時に登録した事項に変更がある場合、相当期間内に「モール」に対して会員情報の修正等の方法でその変更事項を知らせる必要があります。';

  @override
  String get termOfService7 => '第7条（会員退会および資格喪失等）';

  @override
  String get termOfService7Content1 => '①会員は、「モール」にいつでも退会を要求することができ、それに対して「モール」はすぐに会員退会を処理します。';

  @override
  String get termOfService7Content2 => '②会員が次の各号のいずれかに該当する場合、「モール」は会員資格を制限または停止することができます。\n1. 入会申込時に虚偽の内容を登録した場合\n2. 「モール」を利用して購入した商品等の代金、その他「モール」利用に関連して会員が負担する義務を期日に支払わない場合\n3. 他人の「モール」の利用を妨害したりその情報を乗っ取ったりするなど、電子商取引秩序を脅かす場合\n4. 「モール」を利用して法令または本規約で禁止されている行為を行う場合';

  @override
  String get termOfService7Content3 => '③「モール」が会員資格を制限または停止した後、同じ行為が2回以上繰り返されるか、30日以内にその理由が是正されない場合、「モール」は会員資格を喪失させることができます。';

  @override
  String get termOfService7Content4 => '④「モール」が会員資格を喪失させる場合、会員登録を抹消します。この場合、「モール」はこれを通知し、会員登録を抹消する前に最低30日間の期間を定めて証明の機会を与えます。';

  @override
  String get termOfService8 => '第8条（会員への通知）';

  @override
  String get termOfService8Content1 => '①「モール」が会員に通知をする場合、会員が事前に「モール」と協議して指定した電子メールアドレスに行うことができます。';

  @override
  String get termOfService8Content2 => '②「モール」は一般的な会員に対する通知の場合、1週間以上「モール」掲示板に掲示することによって個別の通知に代えることができます。ただし、会員自身の取引に重大な影響を与える事項については個別通知を行います。';

  @override
  String get termOfService9 => '第9条（購入申込み）';

  @override
  String get termOfService9Content1 => '①「モール」利用者は「モール」上で以下のいずれかの方法により購入を申し込み、「モール」は利用者が購入申込みを行う際に以下の各内容を分かりやすく提供しなければなりません。\n1. 商品等の検索および選択\n2. 受取人の氏名、住所、電話番号、電子メールアドレス（または携帯電話番号）などの入力\n3. 契約内容、利用者の撤回権が制限されるサービス、配送料、設置費用などの費用負担および関連情報の確認\n4. この規約に同意し、上記3号の事項を確認または拒否する表示（例えば、マウスクリック）\n5. 商品等の購入申込みおよび関連する確認または「モール」の確認に対する同意\n6. 支払方法の選択';

  @override
  String get termOfService9Content2 => '②「モール」が第三者に購入者の個人情報を提供・委託する必要がある場合、実際の購入申込み時に購入者の同意を得なければならず、会員登録時に包括的に同意を得ません。この場合、「モール」は提供される個人情報の項目、提供先、提供先の個人情報の利用目的および保有・利用期間などを購入者に明示しなければなりません。ただし、「情報通信網利用促進および情報保護等に関する法律」第25条第1項による個人情報処理委託の場合など関連法令で異なる場合はその通りです。';

  @override
  String get termOfService10 => '第10条（契約の成立）';

  @override
  String get termOfService10Content1 => '①「モール」は第9条と同様の購入申込みに対して、次の各号に該当する場合は承諾しないことがあります。ただし、未成年者と契約する場合には、法定代理人の同意を得なければなりません。\n1. クレジットカードの事実無効、不良、不足など契約内容に虚偽、誤記または漏れがある場合\n2. 買い手の意思表示が明らかにない場合または申込みの趣旨が明確でない場合\n3. 商品等の在庫切れまたは技術的な不具合などの理由で商品等の提供が困難な場合\n4. その他「モール」が契約を締結することが不適当と判断した場合';

  @override
  String get termOfService10Content2 => '②契約は、商品等の注文者の受領確認の通知が利用者に到達した時点で成立します。';

  @override
  String get termOfService10Content3 => '③契約成立後の利用者の変更要求やキャンセルは、商品等の契約締結に関する法律およびその施行細則に基づく基本契約条項で処理されます。';

  @override
  String get termOfService11 => '第11条（支払方法）';

  @override
  String get termOfService11Content1 => '「モール」で購入した商品やサービスに対する支払方法は、次の方法で行うことができます。ただし、「モール」は利用者の支払方法に対して、商品などの代金にいかなる名目の手数料も追加して徴収することはできません。\n1. ネットバンキング、インターネットバンキング、メールバンキングなどの各種口座振替\n2. プリペイドカード、デビットカード、クレジットカードなどの各種カード決済\n3. オンライン振込み\n4. 電子マネーによる支払い\n5. 受取時の支払い\n6. ポイントなど「モール」が付与したポイントによる支払い\n7. 「モール」と契約を結んだ場合または「モール」が認める商品券による支払い\n8. その他、電子的な支払方法による代金支払いなど';

  @override
  String get termOfService12 => '第12条(受信確認通知.購入申請の変更及び取消)';

  @override
  String get termOfService12Content1 => '① 「モール」は利用者の購入申請がある場合、利用者に受信確認通知をします。';

  @override
  String get termOfService12Content2 => '② 受信確認通知を受けた利用者は、意思表示の不一致などがある場合には、受信確認通知を受けた後直ちに購入申請の変更及び取消を要求することができ、モールは配送前に利用者の要求がある場合には、遅滞なくその要求に従って処理しなければなりません。ただし、すでに代金を支払った場合には、第15条の契約解除などに関する規定に従います。';

  @override
  String get termOfService13 => '第13条(商品等の供給)';

  @override
  String get termOfService13Content1 => '① 「モール」は利用者と商品等の供給時期に関して別途の約定がない限り、利用者が契約をした日から7日以内に商品等を配送できるように受注製作、包装等その他の必要な措置を取ります。ただし、「モール」がすでに商品等の代金の全部または一部を受領した場合には、代金の全部または一部を受領した日から3営業日以内に措置を取ります。このとき「モール」は利用者が商品等の供給手続きや進行状況を確認できるように適切な措置をします。';

  @override
  String get termOfService13Content2 => '② 「モール」は利用者が購入した商品に対して配送手段、手段別配送料負担者、手段別配送期間などを明示します。もし「モール」が約定配送期間を超過した場合には、それによる利用者の損害を賠償しなければなりません。ただし、「モール」が故意・過失がないことを証明した場合には、その限りではありません。';

  @override
  String get termOfService14 => '第14条(返金)';

  @override
  String get termOfService14Content1 => '「モール」は、利用者が購入申請した商品等が品切れなどの理由で引き渡しまたは提供をすることができない場合には、直ちにその理由を利用者に通知し、事前に商品等の代金を受領した場合には、代金を受領した日から3営業日以内に返金するか、返金に必要な措置を取ります。';

  @override
  String get termOfService15 => '第15条(契約解除等)';

  @override
  String get termOfService15Content1 => '① 「モール」と商品等の購入に関する契約を締結した利用者は、「電子商取引等에서의 소비자보호에 관한 법률」第13条第2項に定める契約内容に関する書面を受け取った日（その書面を受け取ったときよりも商品等の供給が遅くなった場合には、商品等を受け取るか、商品等の供給が始まった日を意味します）から7日以内に契約の解除をすることができます。ただし、契約解除に関して「전자상거래 등에서의 소비자보호에 관한 법률」に別段の規定がある場合には、その法律の規定に従います。';

  @override
  String get termOfService15Content2 => '② 利用者は商品等を受け取った場合、以下の各号の1に該当する場合には返品および交換をすることができません。\n1. 利用者に責任がある事由で商品等が消失または損壊された場合\n2. 利用者の使用または一部消費により商品等の価値が著しく減少した場合\n3. 時効が成立した場合\n4. 「モール」または販売業者が別途の返品および交換に関する規定を定めた場合\n5. その他、法令で返品および交換が認められない場合';

  @override
  String get termOfService15Content3 => '③ 第2項第2号から第4号の場合に「モール」が事前に契約解除等が制限される事実を消費者が簡単に知ることができる場所に明記하거나、試用商品を提供するなどの措置をとらなかった場合、利用者の契約解除等が制限されません。';

  @override
  String get termOfService15Content4 => '④ 利用者は、第1項および第2項の規定にかかわらず、商品等の内容が表示・広告内容と異なるか、契約内容と異なるように履行された場合には、該当商品等を受け取った日から3か月以内、その事実を知った日または知るべき日から30日以内に契約解除等をすることができます。';

  @override
  String get termOfService16 => '第16条(契約解除等の効果)';

  @override
  String get termOfService16Content1 => '① 「モール」は、利用者から商品等を返品された場合、3営業日以内にすでに支払われた商品等の代金を返金します。この場合、「モール」が利用者に商品等の返金を遅延した場合には、その遅延期間については「電子商取引 등에서의 소비자보호에 관한 법률 시행령」第21条の2で定める遅延이자율(괄호 부분 삭제)をかけて算出した遅延利息を支払います。';

  @override
  String get termOfService16Content2 => '② 「モール」は上記の代金を返金する際に、利用者がクレジットカードまたは電子マネーなどの支払い手段で商品等の代金を支払った場合には、直ちに該当の支払い手段を提供した事業者に対し、商品等の代金の請求を停止または取消しするように要求します。';

  @override
  String get termOfService16Content3 => '③ 契約解除等の場合、受け取った商品等の返却に必要な費用は利用者が負担します。「モール」は利用者に契約解除等による違約金または損害賠償を請求しません。ただし、商品等の内容が表示・広告内容と異なるか、契約内容と異なるように履行された場合、返品に必要な費用は「モール」が負担します。';

  @override
  String get termOfService16Content4 => '④ 利用者が商品等を受け取る際に送料を負担した場合、「モール」は契約解除時にその費用が誰が負担するかを利用者が簡単に理解できるように明示します。';

  @override
  String get termOfService17 => '第17条(個人情報保護)';

  @override
  String get termOfService17Content1 => '① 「モール」は利用者の個人情報を収集する際、サービス提供のために必要な範囲で最小限の個人情報を収集します。';

  @override
  String get termOfService17Content2 => '② 「モール」は会員登録時に商品契約の履行に必要な情報を事前に収集しません。ただし、関連法令上の義務履行のために商品契約前に本人確認が必要な場合には最小限の特定個人情報を収集します。';

  @override
  String get termOfService17Content3 => '③ 「モール」は利用者の個人情報を収集・利用する際、当該利用者にその目的を通知し、同意を得ます。';

  @override
  String get termOfService17Content4 => '④ 「モール」は収集された個人情報を目的外の利用には使用できず、新たな利用目的が発生した場合または第三者への提供する場合には利用・提供段階で当該利用者にその目的を通知し、同意を得ます。ただし、関連法令に別段の定めがある場合は例外とします。';

  @override
  String get termOfService17Content5 => '⑤ 「モール」が第2項および第3項により利用者の同意を必要とする場合には、個人情報保護責任者の身元(所属、姓名および電話番号、その他連絡先)、情報の収集目的および利用目的、第三者への情報提供関連事項(提供先、提供目的および提供する情報の内容)など「情報통신망 이용촉진 및 정보보호 등에 관한 법률」第22条第2項이 규정한 사항을 사전에 명시하거나 고지해야 하며, 이용자는 언제든지 이 동의를 철회할 수 있습니다.';

  @override
  String get termOfService17Content6 => '⑥ 利用者はいつでも「モール」が持つ自身の個人情報に対して閲覧および誤り訂正を要求することができ、モール」はこれに対して直ちに必要な措置を講じます。「モール」が誤りの訂正を要求された場合、「モール」はその誤りが訂正されるまで当該個人情報を使用しません。';

  @override
  String get termOfService17Content7 => '⑦ 「モール」は個人情報保護のため、利用者の個人情報を処理する者を最小限に制限し、クレジットカード、銀行口座などを含む利用者の個人情報の紛失、盗難、漏洩、無断の第三者提供、改ざんなどによる利用者の損害に対して一切の責任を負います。';

  @override
  String get termOfService17Content8 => '⑧ 「モール」またはこれから個人情報を提供された第三者は、個人情報の収集目的または提供した目的を達成した時点で、当該個人情報を直ちに廃棄します。';

  @override
  String get termOfService17Content9 => '⑨ 「モール」は個人情報の収集・利用・提供に関する同意란을 사전에 선택한 것으로 설정하지 않습니다.また、個人情報の収集・利用・提供に関する利用者の同意拒否時の制限されるサービス를 구체적に明示し、必須収集項目でない個人情報の収集・利用・提供に関する利用者の同意拒否を理由로会員登録などのサービス提供を制限または拒否しません。';

  @override
  String get termOfService18 => '第18条(「モール」の義務)';

  @override
  String get termOfService18Content1 => '①「モール」は法令や本規約が禁止し、また公序良俗に反する行為を行わず、本規約に定めるところに従って、持続的かつ安定的に商品やサービスを提供するために最善を尽くさなければなりません。';

  @override
  String get termOfService18Content2 => '②「モール」は、ユーザーが安全にインターネットサービスを利用できるよう、個人情報（クレジット情報を含む）を保護するセキュリティシステムを整備しなければなりません。';

  @override
  String get termOfService18Content3 => '③「モール」が商品やサービスに関して「表示・広告の公正化に関する法律」第3条に定める不当な表示・広告行為を行い、これによりユーザーが損害を被った場合、その損害を賠償する責任を負います。';

  @override
  String get termOfService18Content4 => '④「モール」は、ユーザーが希望しない営利目的の広告性電子メールを送信しません。';

  @override
  String get termOfService19 => '第19条（会員のIDおよびパスワードに関する義務）';

  @override
  String get termOfService19Content1 => '① 第17条の場合を除き、IDおよびパスワードの管理責任は会員にあります。';

  @override
  String get termOfService19Content2 => '② 会員は、自身のIDおよびパスワードを第三者に利用させてはなりません。';

  @override
  String get termOfService19Content3 => '③ 会員が自身のIDおよびパスワードが盗難されたり、第三者に使用されていることに気付いた場合は、直ちに「モール」に通知し、「モール」からの指示に従わなければなりません。';

  @override
  String get termOfService20 => '第20条（利用者の義務）';

  @override
  String get termOfService20Content1 => '利用者は、以下の行為をしてはなりません。\n1. 申請または変更時に虚偽の情報を登録すること\n2. 他人の情報をなりすますこと\n3. 「モール」に掲載された情報の変更\n4. 「モール」が指定した情報以外の情報（コンピュータプログラムなど）を送信または掲載すること\n5. 「モール」または第三者の著作権その他の知的財産権を侵害すること\n6. 「モール」または第三者の名誉を毀損し、または業務を妨害する行為\n7. 卑猥または暴力的なメッセージ、画像、音声、その他公序良俗に反する情報を「モール」に公開または掲載する行為';

  @override
  String get termOfService21 => '第21条（リンクされたモールとリンク元モールとの関係）';

  @override
  String get termOfService21Content1 => '① 上位の「モール」と下位の「モール」がハイパーリンク（例：ハイパーリンクの対象には文字、画像、イラストなどが含まれる）などの方法でリンクされた場合、前者をリンク元「モール」（ウェブサイト）とし、後者をリンク先「モール」（ウェブサイト）とします。';

  @override
  String get termOfService21Content2 => '② リンク元「モール」が、ユーザーとリンク先「モール」との間で行われる取引について、商品またはサービスの提供についての保証責任を負わないことを、リンク元「モール」の初期画面または接続時のポップアップ画面で明示した場合、その取引に対する保証責任を負いません。';

  @override
  String get termOfService22 => '第22条（著作権の帰属および利用制限）';

  @override
  String get termOfService22Content1 => '① 「モール」が作成した著作物に関する著作権その他の知的財産権は「モール」に帰属します。';

  @override
  String get termOfService22Content2 => '② 利用者は、「モール」が所有する知的財産権が対象となる情報を、「モール」の事前の承諾なしに複製、送信、出版、配布、放送その他の方法で営利目的で利用したり、第三者に利用させたりしてはなりません。';

  @override
  String get termOfService22Content3 => '③ 「モール」が契約に基づき利用者の所有する著作権を使用する場合、事前に利用者に通知する必要があります。';

  @override
  String get termOfService23 => '第23条（紛争の解決）';

  @override
  String get termOfService23Content1 => '① 「モール」は、ユーザーが提起する正当な意見や不満を反映し、その損害を補償するために損害補償処理機構を設置・運営します。';

  @override
  String get termOfService23Content2 => '② 「モール」は、ユーザーから提出される不満や意見を優先的に処理します。ただし、迅速な処理が困難な場合は、その理由と処理日程を即座にユーザーに通知します。';

  @override
  String get termOfService23Content3 => '③ 「モール」とユーザーとの間で発生した電子商取引に関連する紛争解決申請がある場合、公正取引委員会または市・道知事が委託する紛争調整機関の調停に従うことができます。';

  @override
  String get termOfService24 => '第24条（管轄権および準拠法）';

  @override
  String get termOfService24Content1 => '① 「モール」とユーザーとの間で発生した電子商取引に関する訴訟は、提訴時のユーザーの住所に基づき、住所がない場合は提訴時の居所を管轄する地方裁判所の専属管轄とします。ただし、提訴時のユーザーの住所や居所が明らかでない場合、または外国居住者の場合は、民事訴訟法上の管轄裁判所に提起します。';

  @override
  String get termOfService24Content2 => '② 「モール」とユーザーとの間で提起された電子商取引訴訟には、韓国法が適用されます。';

  @override
  String get timeTakeEffect => '付則（施行日）この規約は2024年3月1日から施行されます。';

  @override
  String get privacyPolicy => '個人情報保護方針';

  @override
  String get privacyPolicyContent => '成功マニアは情報主体の自由と権利保護のため、「個人情報保護法」および関連法令が定めるところに従い、適法に個人情報を処理し、安全に管理しています。したがって、情報主体に対して個人情報処理に関する手続きと基準を案内し、関連する苦情を迅速かつ円滑に処理できるよう、以下のように個人情報処理方針を策定・公開します。';

  @override
  String get privacyPolicy1 => '1. 個人情報の処理目的';

  @override
  String get privacyPolicy1Content1 => '成功マニアは次の目的のために個人情報を処理します。処理されている個人情報は次の目的以外の用途には使用されず、利用目的が変更される場合は、「個人情報保護法」第18条に従い別途の同意を得るなど必要な措置を取る予定です。';

  @override
  String get privacyPolicy1Content2 => '1. 会員登録および管理\n会員登録の意思確認、会員制サービスの提供に伴う本人確認・認証、会員資格の維持・管理、サービス不正利用の防止、14歳未満の子供の個人情報処理時法定代理人の同意確認、各種通知、苦情処理の目的で個人情報を処理します。';

  @override
  String get privacyPolicy1Content3 => '2. 商品またはサービスの提供\n商品配送、サービス提供、契約書・請求書送付、コンテンツ提供、カスタマイズされたサービス提供、本人確認、年齢確認、料金支払い・精算、債権回収のために個人情報を処理します。';

  @override
  String get privacyPolicy1Content4 => '3. マーケティングおよび広告に利用されるイベントなどの広告情報の伝達、アクセス頻度の把握、または会員のサービス利用に関する統計';

  @override
  String get privacyPolicy2 => '2. 個人情報の処理および保有期間';

  @override
  String get privacyPolicy2Content1 => 'ホームページ会員登録および管理：事業者/団体のホームページ退会まで\nただし、次の理由に該当する場合には該当理由終了まで';

  @override
  String get privacyPolicy2Content2 => '1) 会社内方針による情報保持理由 会員が退会した場合でも不良会員の不正利用の再発を防止し、紛争解決および捜査機関の要請に応じるために、利用契約の解除日からoo年間会員の情報を保有することができます。';

  @override
  String get privacyPolicy2Content3 => '2) 関連法令による情報保有理由 電子商取引等での消費者保護に関する法律など関連法令の規定により保存する必要がある場合、会社は以下のように関連法令で定められた一定期間会員情報を保管します。';

  @override
  String get privacyPolicy2Content4 => '契約または申込の取り消しに関する記録\n保存理由：電子商取引等での消費者保護に関する法律\n保管期間：5年';

  @override
  String get privacyPolicy2Content5 => '料金支払いおよび商品等の供給に関する記録\n保存理由：電子商取引等での消費者保護に関する法律\n保管期間：5年';

  @override
  String get privacyPolicy2Content6 => '消費者の苦情または紛争処理に関する記録\n保存理由：電子商取引等での消費者保護に関する法律\n保管期間：3年';

  @override
  String get privacyPolicy2Content7 => 'ログ記録\n保存理由：通信の秘密保護法\n保管期間：3ヶ月';

  @override
  String get privacyPolicy2Content8 => '3) ホームページ利用による債権・債務関係が残存する場合は、当該債権・債務関係の精算時まで';

  @override
  String get privacyPolicy3 => '3. 処理する個人情報項目';

  @override
  String get privacyPolicy3Content1 => '成功マニアは会員登録、相談、サービス申し込みなどのために、次の個人情報項目を処理しています。';

  @override
  String get privacyPolicy3Content2 => '1. 会員登録および管理\n名前、生年月日、性別、ログインID、パスワード、自宅電話番号、携帯電話番号、メールアドレス、14歳未満の加入者の場合、法定代理人の情報\n2. サービス申し込み時\n住所、支払情報\n・ サービス利用の過程や業務処理の過程でサービス利用記録、アクセスログ、クッキー、アクセスIP、支払記録、不良利用記録が生成されて収集されることがあります。';

  @override
  String get privacyPolicy4 => '4. 個人情報の収集方法';

  @override
  String get privacyPolicy4Content1 => 'ホームページ、書面フォーム、掲示板、メール、イベント応募、配送要求、電話、FAX、生成情報収集ツールを介して収集';

  @override
  String get privacyPolicy5 => '5. 14歳未満の子供の個人情報処理に関する事項';

  @override
  String get privacyPolicy5Content1 => '① 成功マニアは14歳未満の子供に対して個人情報を収集する際、法定代理人の同意を得て、該当サービスの実行に必要な最小限の個人情報を収集します。\n• 必須事項：法定代理人の氏名、関係、連絡先';

  @override
  String get privacyPolicy5Content2 => '② また、関連する広報のために子供の個人情報を収集する場合、法定代理人から別途の同意を得ます。';

  @override
  String get privacyPolicy5Content3 => '③ 成功マニアは14歳未満の子供の個人情報を収集する際、子供に法定代理人の氏名、連絡先など最小限の情報を要求することができ、次のいずれかの方法で正当な法定代理人が同意したかを確認します。\n• 同意内容を掲載したインターネットサイトに法定代理人が同意の意思表示をするようにし、個人情報処理者がその同意表示を確認したことを法定代理人の携帯電話メッセージで通知する方法\n• 同意内容を掲載したインターネットサイトに法定代理人が同意の意思表示をするようにし、法定代理人のクレジットカード・デビットカードなどのカード情報を提供する方法\n• 同意内容を掲載したインターネットサイトに法定代理人が同意の意思表示をするようにし、法定代理人の携帯電話本人確認などを通じて本人かどうかを確認する方法\n• 同意内容が記載された文書を法定代理人に直接交付するか、郵送またはFAXを介して提出した後に法定代理人が同意内容に署名・押印して提出する方法\n• 同意内容が記載された電子メールを送信して法定代理人から同意の意思表示が記載された電子メールを受信する方法\n• 電話を通じて同意内容を法定代理人に通知し、同意を得るか、インターネットアドレスなど同意内容を確認できる方法を案内し、再度電話通話を通じて同意を得る方法\n• その他、同等の方法で法定代理人に同意内容を通知し、同意の意思表示を確認する方法';

  @override
  String get privacyPolicy6 => '6. 個人情報の廃棄手続きおよび方法';

  @override
  String get privacyPolicy6Content1 => '① 成功マニアは、個人情報が不要になった場合、個人情報の保有期間の経過、処理目的の達成などにより、速やかに該当個人情報を廃棄します。';

  @override
  String get privacyPolicy6Content2 => '② 情報主体로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존해야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 이전하거나 보관 장소를 달리하여 보존합니다.';

  @override
  String get privacyPolicy6Content3 => '③ 個人情報の廃棄手続きおよび方法は次のとおりです。\n1. 廃棄手続き\n成功マニアは廃棄事由が発生した個人情報を選定し、個人情報保護責任者の承認を受けて個人情報を廃棄します。\n2. 廃棄方法\n電子的なファイル形式で記録・保存された個人情報は、再生できないように廃棄し、紙の文書に記録・保存された個人情報はシュレッダーで破棄または焼却して廃棄します。';

  @override
  String get privacyPolicy7 => '7. 情報主体と法定代理人の権利・義務および行使方法';

  @override
  String get privacyPolicy7Content1 => '① 情報主体は、成功マニアに対していつでも個人情報の閲覧・訂正・削除・処理停止などの権利を行使することができます。\n※ ただし、14歳未満の子供に関する個人情報の閲覧などの要求は法定代理人が直接行う必要があります。また、14歳以上の未成年者の情報主体は、未成年者自身が権利を行使するか、法定代理人を通じて権利を行使することもできます。';

  @override
  String get privacyPolicy7Content2 => '② 権利の行使は、「個人情報保護法」施行令第41条第1項に従って書面、電子メール、模写伝送(FAX)などを通じて行うことができます。成功マニアはこれに対して速やかに対応します。';

  @override
  String get privacyPolicy7Content3 => '③ 権利の行使は情報主体の法定代理人や委任を受けた者など代理人を通じて行うこともできます。この場合は、「個人情報処理に関する指針(第2020-7号)」別表第11号書式に従った委任状を提出する必要があります。';

  @override
  String get privacyPolicy7Content4 => '④ 個人情報の閲覧や処理停止の要求は、「個人情報保護法」第35条第4項、第37条第2項により情報主体の権利が制限されることがあります。';

  @override
  String get privacyPolicy7Content5 => '⑤ 個人情報の訂正や削除の要求は、他の法令で当該個人情報が収集対象として明示されている場合にはその削除を要求することができません。';

  @override
  String get privacyPolicy7Content6 => '⑥ 成功マニアは、情報主体の権利に基づく閲覧の要求、訂正・削除の要求、処理停止の要求などが行った者が本人であるか正当な代理人であるかを確認します。';

  @override
  String get privacyPolicy8 => '8. 個人情報の安全性確保措置';

  @override
  String get privacyPolicy8Content1 => '成功マニアは個人情報の安全性確保のために以下の措置を講じています。\n1. 管理的措置: 内部管理計画の策定・実施、専任組織の運営、定期的な従業員教育\n2. 技術的措置: 個人情報処理システムなどのアクセス権限管理、アクセス制御システムの設置、個人情報の暗号化、セキュリティプログラムの設置および更新\n3. 物理的措置: コンピュータ室、資料保管室などのアクセス制限';

  @override
  String get privacyPolicy9 => '9. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항';

  @override
  String get privacyPolicy9Content1 => '① 成功マニア는 사용자에게 개별적인 맞춤 서비스를 제공하기 위해 이용 정보를 저장하고 수시로 불러오는 \'쿠키(cookie)\'를 사용합니다.';

  @override
  String get privacyPolicy9Content2 => '② 쿠키는 웹사이트를 운영하는 데 사용되는 서버(HTTP)가 사용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며, 사용자들의 PC 컴퓨터 내의 하드디스크에 저장될 수도 있습니다.\n가. 쿠키의 사용 목적: 사용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용 형태, 인기 검색어, 보안 접속 여부 등을 파악하여 사용자에게 최적화된 정보 제공을 위해 사용됩니다.\n나. 쿠키의 설치·운영 및 거부: 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부할 수 있습니다.\n다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.';

  @override
  String get privacyPolicy10 => '10. 개인정보에 관한 민원서비스';

  @override
  String get privacyPolicy10Content1 => '成功マニアは顧客の個人情報を保護し、個人情報に関連する苦情を処理するために、以下のように関連部門および個人情報保護責任者を指定しています。';

  @override
  String get privacyPolicy10Content2 => '• 個人情報保護担当者\n氏名: 정보경\n所属: 成功マニア\n電話番号: 010-8222-8317\nメール: bokyeong19@mecelljoo.kr';

  @override
  String get privacyPolicy10Content3 => '• 個人情報保護責任者\n氏名: 정보경\n所属: 成功マニア\n電話番号: 010-8222-8317\nメール: dhcoan12@naver.com';

  @override
  String get privacyPolicy10Content4 => '• 貴殿は、会社のサービスを利用し、生じるすべての個人情報保護に関連する苦情を個人情報保護責任者または担当部署に申し出ることができます。\n• 会社は利用者の苦情に対して迅速に十分な回答を致します。\n• その他、個人情報侵害に関する苦情や相談が必要な場合は、以下の機関にお問い合わせください。';

  @override
  String get privacyPolicy10Content5 => '個人情報侵害報告センター\n(privacy.kisa.or.kr / 118番なし)';

  @override
  String get privacyPolicy10Content6 => '個人情報紛争調整委員会\n(kopico.go.kr / 1833-6972)';

  @override
  String get privacyPolicy10Content7 => '検察庁サイバー捜査課\n(spo.go.kr / 地域番号+1301)';

  @override
  String get privacyPolicy10Content8 => '警察庁サイバー安全局\n(cyberbureau.police.go.kr / 182番なし)';

  @override
  String minutesAgo(String time) {
    return '$time分前';
  }

  @override
  String hoursAgo(String time) {
    return '$time時間前';
  }

  @override
  String totalItems(int totalItems) {
    return '合計 $totalItems個';
  }

  @override
  String get notificationAlert => 'お知らせ';

  @override
  String get ok => 'いいね';

  @override
  String get check => 'チェック';

  @override
  String get comment => 'コメント';

  @override
  String get viewProfile => 'プロフィールを見る';

  @override
  String get writer => '作成者';

  @override
  String get writeReply => '返信を書く';

  @override
  String get great => 'いいね';

  @override
  String get joinMemberShip => '会員登録';

  @override
  String get placeHolderId => 'ID';

  @override
  String get validationId => '英数字の組み合わせ、8文字以内';

  @override
  String get placeHolderPassword => 'パスワード';

  @override
  String get validationPassword => '英数字と記号を含む8-16文字の組み合わせ';

  @override
  String get doubleCheck => '重複確認';

  @override
  String get doubleCheckFail => '既に存在するIDです。別のIDを使用してください。';

  @override
  String get doubleCheckSuccess => '重複確認済みです。使用可能なIDです。';

  @override
  String get placeHolderConfirmPassword => 'パスワードの確認';

  @override
  String get placeHolderName => '名前';

  @override
  String get placeHolderPhone => '電話番号';

  @override
  String get sendAuthentication => '認証コード送信';

  @override
  String get otpNumber => '認証コード';

  @override
  String get verify => '認証する';

  @override
  String get placeHolderReferrerPhoneNumber => '紹介者の電話番号（任意）';

  @override
  String get usernameExisted => 'このユーザー名は既に存在します。';

  @override
  String get phoneNumberExisted => 'この電話番号はすでに使用されています。';

  @override
  String get verifyOTPSuccess => 'OTP認証成功';

  @override
  String get empty => 'このフィールドは空白にできません。';

  @override
  String get usernameInvalid => '英数字の組み合わせ、6文字以上';

  @override
  String get passwordInvalid => '英数字と記号を含む8文字以上の組み合わせ';

  @override
  String get confirmPasswordNotMatch => 'パスワードが一致しません';

  @override
  String get phoneInvalid => '電話番号の形式が間違っています。';

  @override
  String get otpInvalid => '6桁の数字が可能です';

  @override
  String get phoneNumberNotExisted => 'この電話番号はアプリケーションに存在しません。';

  @override
  String usernameOfPhoneNumber(String phoneNumber) {
    return '$phoneNumber様のユーザーIDは';
  }

  @override
  String couldNotLunch(String content) {
    return '昼食を食べませんでした $content';
  }

  @override
  String get id => 'です';

  @override
  String get resetPassword => 'パスワードをリセット';

  @override
  String get verifyAccountFailed => 'ユーザー名が電話番号と一致しません';

  @override
  String get pleaseEnterPassword => 'リセットするパスワードを入力してください。';

  @override
  String get passwordCondition => '(英数字、記号を含む8文字以上の組み合わせ)';

  @override
  String get button => 'ボタン';

  @override
  String resetPasswordSuccess(Object phoneNumber) {
    return '$phoneNumber様のパスワードが\nリセットされました。';
  }

  @override
  String get productInformation => '製品情報';

  @override
  String get review => 'レビュー';

  @override
  String get inquiry => 'お問い合わせ';

  @override
  String get purchaseReview => '購入レビュー';

  @override
  String get writeReview => 'レビューを書く';

  @override
  String get shoppingCart => 'ショッピングカート';

  @override
  String get buyNow => '今すぐ購入';

  @override
  String get temporaryStorage => '一時保存';

  @override
  String get registration => '登録';

  @override
  String get pleaseChooseCategory => 'カテゴリを選択してください。';

  @override
  String get pleaseSelectSubCategory => 'サブカテゴリを選択してください。';

  @override
  String get pleaseEnterSubject => '題名を入力してください。';

  @override
  String get pleaseEnterYourDetails => '内容を入力してください。';

  @override
  String get editPhoto => '写真を編集';

  @override
  String get notification => '通知';

  @override
  String get writeQA => 'お問い合わせを書く';

  @override
  String get qaCompleted => '回答完了';

  @override
  String get qaHidden => '非公開です。';

  @override
  String get sendWrittenReview => 'レビューを送信する';

  @override
  String get productRating => '製品評価';

  @override
  String get uploadImage => '画像をアップロード';

  @override
  String get writeReviewTextBoxTitle => 'レビューを書く';

  @override
  String get writeReviewHintText => '製品のレビューをお書きください';

  @override
  String get takePicture => '写真を撮る';

  @override
  String get pickFromGallery => 'ギャラリーから選択';

  @override
  String get deletePicture => '写真を削除する';

  @override
  String get cancel => 'キャンセル';

  @override
  String get composeQA => '製品について問い合わせる';

  @override
  String get submitQA => '問い合わせる';

  @override
  String get qaCategoryType => '問い合わせの種類';

  @override
  String get qaCategoryTypePlaceHolder => '選択';

  @override
  String get qaDetails => '問い合わせ内容';

  @override
  String get qaDetailsHintText => '問い合わせ内容を入力してください';

  @override
  String get favoriteBoard => 'お気に入り掲示板';

  @override
  String get follower => 'フォロワー';

  @override
  String get delete => '削除';

  @override
  String get followManage => 'フォロー管理';

  @override
  String get referrerStatus => '紹介者状況';

  @override
  String get currentReferrer => '現在の紹介者数';

  @override
  String numberPeople(Object number) {
    return '$number人';
  }

  @override
  String get currentReferrerList => '現在の紹介者リスト';

  @override
  String get next => '次へ';

  @override
  String get personalInfoTermAccept => '(必須) 個人情報保護方針に同意する';

  @override
  String get smTermAccept => '(必須) サービス利用規約に同意する';

  @override
  String get view => '表示';

  @override
  String get agreeToTermAndCond => '規約に同意する';

  @override
  String get termOfUseSMMall => '成功マニアモール利用規約に同意する';

  @override
  String get termOfUseSMMallTitle => '利用規約';

  @override
  String get successSecretOfTop1 => 'トップ1％のビジネスパーソンが教える\n成功の秘訣';

  @override
  String get termAndCondDetails => '利用ポリシーおよび規約';

  @override
  String cartItemAmount(int amount) {
    return '合計 $amount点';
  }

  @override
  String get selectAll => 'すべて選択';

  @override
  String get editBusinessCard => '名刺を編集する';

  @override
  String get businessCardDetails => '名刺の詳細';

  @override
  String get activity => 'アクティビティ';

  @override
  String get followManagement => 'フォロー管理';

  @override
  String get favoritesBulletinBoard => 'お気に入りの掲示板';

  @override
  String get curationActivities => 'キュレーション活動';

  @override
  String get communityActivities => 'コミュニティ活動';

  @override
  String get myDeliveryInformation => '配送情報';

  @override
  String get checkOrderDeliveryDetails => '注文配送詳細の確認';

  @override
  String get inquiryDetails => 'お問い合わせ詳細';

  @override
  String get etc => 'その他';

  @override
  String get recommenderStatus => '紹介者状況';

  @override
  String get entire => '全体';

  @override
  String get beforeDelivery => '配送前';

  @override
  String get shipping => '配送中';

  @override
  String get deliveryComplete => '配送完了';

  @override
  String get refund => '返品/返金';

  @override
  String get exchange => '交換';

  @override
  String get deliveryInquiry => '配送照会';

  @override
  String get orderDetails => '注文詳細';

  @override
  String numberProducts(Object number) {
    return '$number個';
  }

  @override
  String get paymentInformation => '支払い情報';

  @override
  String get totalProductAmount => '総商品金額';

  @override
  String get deliveryFee => '配送料';

  @override
  String get totalDiscountAmount => '総割引額';

  @override
  String get paymentAmount => '支払い金額';

  @override
  String get pointAccumulation => 'ポイント蓄積';

  @override
  String get paymentReceipt => '支払いレシート';

  @override
  String get accumulationExpected => '蓄積予定';

  @override
  String get ordererInformation => '注文者情報';

  @override
  String get phoneNumber => '電話番号';

  @override
  String get email => 'Eメール';

  @override
  String get deliveryInformation => '配送情報';

  @override
  String get orderPayment => '注文 / 支払い';

  @override
  String get orderer => '注文者';

  @override
  String get changeAddress => '配送先変更';

  @override
  String get defaultShippingAddress => 'デフォルト配送先';

  @override
  String get addShippingAddress => '配送先追加';

  @override
  String get add => '追加する';

  @override
  String get whatYouWrote => '書いたもの';

  @override
  String get postWithComment => 'コメント付き投稿';

  @override
  String get likedPost => 'いいねした投稿';

  @override
  String get justNow => 'たった今';

  @override
  String get noPost => '投稿がありません';

  @override
  String get exploreOurCommunity => 'コミュニティを見る';

  @override
  String get exploreCurator => 'キュレーターを見る';

  @override
  String get myProfile => 'プロフィール';

  @override
  String get businessCardEdit => '名刺編集';

  @override
  String get basicInformation => '基本情報';

  @override
  String get socialMedia => 'ソーシャルメディア';

  @override
  String get linkUrl => 'リンクURL';

  @override
  String get snsSelect => 'SNS選択';

  @override
  String get addition => '追加';

  @override
  String get fileAttach => 'ファイル添付';

  @override
  String get list => 'リスト';

  @override
  String get title => 'タイトル';

  @override
  String get imageFile => '画像ファイル';

  @override
  String get deletePhoto => '写真を削除する';

  @override
  String get changePhoto => '写真を変更する';

  @override
  String get follow => 'フォローする';

  @override
  String get following => 'フォロー中';

  @override
  String get setting => '設定';

  @override
  String get accountInformationManagement => 'アカウント情報管理';

  @override
  String get signInWithNaver => 'Naverでサインイン中';

  @override
  String get signInWithKakao => 'Kakaoでサインイン中';

  @override
  String get signInWithGoogle => 'Googleでサインイン中';

  @override
  String get signInWithApple => 'Appleでサインイン中';

  @override
  String get notificationSettings => '通知設定';

  @override
  String get languageSettings => '言語設定';

  @override
  String get korean => '韓国語';

  @override
  String get usagePolicy => '利用ポリシー';

  @override
  String get logout => 'ログアウト';

  @override
  String get edit => '編集';

  @override
  String get withdrawal => '退会';

  @override
  String get save => '保存する';

  @override
  String get changePassword => 'パスワード変更';

  @override
  String get editCellPhoneNumber => '携帯電話番号を編集';

  @override
  String get followNewPostNotification => '新しい投稿をフォローする通知';

  @override
  String get commentAlert => 'コメント通知';

  @override
  String get likeAlert => 'いいね通知';

  @override
  String get termAndPolicyConditions => '利用規約とポリシー';

  @override
  String get currentPassword => '現在のパスワード';

  @override
  String get passwordToChange => '変更するパスワード';

  @override
  String get change => '変更する';

  @override
  String get changePhoneNumber => '電話番号を変更する';

  @override
  String get recentSearches => '最近の検索';

  @override
  String get clearAllHistory => 'すべての履歴を消去';

  @override
  String get someThingWentWrong => '問題が発生しました。';

  @override
  String get addThumbnail => 'サムネイルを追加';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get someError => 'エラーが発生しました。';

  @override
  String get product => '商品';

  @override
  String get delivery => '配送';

  @override
  String get other => 'その他';

  @override
  String get loginAndSignUp => 'ログインとサインアップ';

  @override
  String get youNeedToLoginToAccessThisContent => 'このコンテンツにアクセスするにはログインが必要です';

  @override
  String get goToLoginPage => 'ログインページへ移動';

  @override
  String get pleaseLoginToViewRegisteredInformation => 'この機能を利用するにはログインが必要です。ログインしますか？';

  @override
  String get alertProductAddedToCart => 'カートに追加された製品';

  @override
  String get orderProduct => '注文製品';

  @override
  String get addressSearch => '住所検索';

  @override
  String totalPrice(Object price, Object totalProduct) {
    return '合計 $totalProduct個 $priceウォン';
  }

  @override
  String totalPriceWithoutNumber(double price) {
    final intl.NumberFormat priceNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String priceString = priceNumberFormat.format(price);

    return '$priceStringウォンで支払う';
  }

  @override
  String get orderProductAgree => '注文する商品の商品名、価格、配送情報を確認し、購入に同意します。';

  @override
  String get addToCart => 'カートに追加';

  @override
  String get leaveAComment => 'コメントを残す';

  @override
  String get replyingTo => 'への返信：';

  @override
  String get editingComment => 'コメントを編集...';

  @override
  String get noFollowers => 'フォロワーはいません。';

  @override
  String get noFollowings => 'フォロー中のユーザーはいません。';

  @override
  String get paymentFailedMessage => '支払いに失敗しました。\nもう一度お試しください。';

  @override
  String get paymentSuccessMessage => '支払いが完了しました。\nご注文ありがとうございます。';

  @override
  String get apply => '適用する';

  @override
  String get noPostDisplayed => '表示される投稿がありません。';

  @override
  String get urlInvalid => '無効なURLです。';

  @override
  String get copiedToClipboard => 'クリップボードにコピーされました。';

  @override
  String get invalidEmailFormat => '無効なメール形式';

  @override
  String get areYouSureYouWantToUnregister => '本当に登録を解除しますか？';

  @override
  String get areYouSureYouWantToDelete => '本当に削除しますか？';

  @override
  String get inquiryCategory => '問い合わせカテゴリ';

  @override
  String get answerComplete => '回答完了';

  @override
  String get emptyList => '空のリスト';

  @override
  String get savePostSuccess => '投稿が保存されました';

  @override
  String get unconfirmed => '未確認';

  @override
  String get confirmed => '確認済み';

  @override
  String get delivered => '配送済み';

  @override
  String get informationSupplement => '情報補足';

  @override
  String get commentMyPost => 'コメント';

  @override
  String get followingUploadPost => '新しい記事';

  @override
  String get reactMyPost => '反応';

  @override
  String get shareSuccessfully => '正常に共有されました';

  @override
  String get daddrs1000 => '住所が見つかりません。';

  @override
  String get aa1000 => 'ユーザーが見つかりません';

  @override
  String get aa1001 => 'アクセスが拒否されました';

  @override
  String get aa1002 => 'アクセストークンの有効期限が切れました';

  @override
  String get aa1003 => 'リフレッシュトークンの有効期限が切れました';

  @override
  String get aa1004 => 'セッショントークンの有効期限が切れました';

  @override
  String get aa1005 => 'トークンが無効です';

  @override
  String get aa1006 => 'Google ID トークンが無効です';

  @override
  String get aa1007 => 'OTP を送信できません';

  @override
  String get aa1008 => 'OTP の有効期限が切れました';

  @override
  String get aa1009 => 'OTP が一致しません';

  @override
  String get aa1010 => 'このユーザーに対してサポートされていない認証方法';

  @override
  String get aa1011 => 'Kakao トークンが無効です';

  @override
  String get aa1012 => 'Naver トークンが無効です';

  @override
  String get a1001 => '内部サーバーエラー';

  @override
  String get a1002 => '無効なリクエストデータ';

  @override
  String get a1003 => 'リクエストメソッドがサポートされていません';

  @override
  String get dcrt1000 => 'カートが見つかりません';

  @override
  String get dcrt1001 => '商品の数量は在庫数以下でなければなりません';

  @override
  String get dc1000 => '二番目の深さのカテゴリーのサブカテゴリーを追加できません';

  @override
  String get dc1001 => 'サブカテゴリーの追加が許可されていません';

  @override
  String get dc1002 => 'カテゴリータイプが正しくありません';

  @override
  String get dc1003 => 'カテゴリーを削除できません';

  @override
  String get dc1004 => 'カテゴリー名を変更できません';

  @override
  String get dc1005 => 'カテゴリーが見つかりません';

  @override
  String get dcmt1000 => 'コメントが見つかりません';

  @override
  String get dcmt1001 => '親コメントが見つかりません';

  @override
  String get dcmt1002 => '編集する権限がありません';

  @override
  String get dcmt1003 => '非表示コメントに返信できません';

  @override
  String get dfvrcate1000 => 'お気に入りカテゴリーは親カテゴリーのみを受け入れます。';

  @override
  String get af1000 => 'アップロードされたファイル名が無効です';

  @override
  String get af1001 => 'ファイルタイプがサポートされていません';

  @override
  String get af1002 => 'ファイルの解析エラー';

  @override
  String get dfile1000 => 'ファイルが見つかりません';

  @override
  String get dfl1000 => '自分自身をフォローできません';

  @override
  String get dfl1001 => '自分自身をフォロー解除できません';

  @override
  String get dl1005 => 'ロケールがサポートされていません';

  @override
  String get dmp1000 => 'メインページが見つかりません';

  @override
  String get dntf1000 => '通知が見つかりません';

  @override
  String get dntfs1000 => '通知設定が見つかりません';

  @override
  String get dordd1000 => '注文詳細が見つかりません';

  @override
  String get aods1 => '注文詳細セッションが見つかりません';

  @override
  String get dord1000 => '注文に失敗しました';

  @override
  String get dord1001 => '注文が見つかりません';

  @override
  String get dord1002 => 'このユーザーに属していない注文です';

  @override
  String get dord1003 => '注文は次の注文ステータスのみキャンセルできます: 未確認 - 確認済み';

  @override
  String get dord1004 => '注文は次の注文ステータスのみキャンセルできます: 未確認 - 確認済み - 配送中';

  @override
  String get dord1005 => '管理者のみが注文ステータスを次のように変更できます: 未確認 -> 確認済み -> 配送中 -> 配達済み';

  @override
  String get dord1006 => '管理者のみが注文ステータスを次のように払い戻すことができます: キャンセル -> 返金';

  @override
  String get dord1007 => '返金に失敗しました';

  @override
  String get aos1 => '注文セッションが見つかりません';

  @override
  String get aos2 => '商品の数量は在庫数以下である必要があります';

  @override
  String get dpst1000 => '投稿が見つかりません';

  @override
  String get dpst1001 => '子カテゴリーのみ受け入れる投稿';

  @override
  String get dpst1002 => '親カテゴリーのみ受け入れる投稿';

  @override
  String get dpst1003 => '投稿カテゴリーが一致しません';

  @override
  String get dpst1004 => '投稿親カテゴリーが必要です';

  @override
  String get dprd1000 => '商品が見つかりません';

  @override
  String get dpu1000 => 'プロフィールURLが見つかりません';

  @override
  String get dqa1000 => 'QnAが見つかりません';

  @override
  String get dqa1001 => '他人の QnA を削除できません';

  @override
  String get drt1000 => '評価が見つかりません';

  @override
  String get drt1001 => '他人のレビューを削除できません';

  @override
  String get drct1000 => 'リアクションが見つかりません';

  @override
  String get dsf1000 => '送料が見つかりません';

  @override
  String get dsm1000 => 'ソーシャルメディアが見つかりません';

  @override
  String get au1000 => 'ユーザーが見つかりません';

  @override
  String get du1001 => '無効なメール形式';

  @override
  String get du1002 => '無効な電話番号形式';

  @override
  String get du1003 => 'ユーザータイプがパスワードを許可しません';

  @override
  String get du1004 => 'ユーザーはすでに紹介済みのユーザーがいます';

  @override
  String get du1005 => '間違ったパスワード';

  @override
  String get du1006 => '無効なパスワード形式';

  @override
  String get du1007 => '無効なユーザー名形式';

  @override
  String get du1008 => '重複するユーザー名';

  @override
  String get du1009 => '重複するメール';

  @override
  String get du1010 => '重複するユーザー電話番号';

  @override
  String get du1011 => 'ソーシャルユーザーのメールを変更できません';

  @override
  String get du1012 => 'ソーシャルユーザーの電話番号を変更できません';

  @override
  String get du1013 => 'ユーザーは登録を完了していません';

  @override
  String get du1014 => 'ユーザーに情報補完が必要ありません';

  @override
  String get du1015 => 'ユーザーの役割が不十分です';

  @override
  String get du1016 => 'ユーザーが見つかりません';

  @override
  String get du1017 => 'システムアカウントを無効にできません';

  @override
  String get sw101 => '発行された固有キーが存在しません。';

  @override
  String get sw102 => '期限切れのキー。';

  @override
  String get sw103 => 'キー使用量が超過しました。';

  @override
  String get sw104 => '無効な送り状番号または配送会社コードの入力。';

  @override
  String get sw105 => '同じ送り状の1日のリクエスト制限を超過しました。';

  @override
  String get sw106 => '送り状番号の検索エラー。';

  @override
  String get sw500 => 'サーバーエラーです。';

  @override
  String get dtc1001 => '利用規約が見つかりませんでした';

  @override
  String get connectionFailure => 'サーバーに接続できません。後で再試行してください。';

  @override
  String get timeoutFailure => 'リクエストのタイムアウト';

  @override
  String get otherDioFailure => '何か問題が発生しました';

  @override
  String get convertDataFailure => 'データ変換の失敗';

  @override
  String get genericFailure => '一般的な失敗';

  @override
  String get persistentFailure => '永続的な失敗';

  @override
  String get recipient => '受取人';

  @override
  String get address => '住所';

  @override
  String get checkAddressSearch => '住所検索';

  @override
  String get enterDetailedAddress => '詳細な住所を入力する';

  @override
  String get setDefaultAddress => 'デフォルトの住所を設定する';

  @override
  String get longVideo => '長い';

  @override
  String get shortVideo => '短い';

  @override
  String get reaction => '反応';

  @override
  String get viewDetails => '詳細を見る';

  @override
  String get areYouSureYouWantToCancelThisOrder => 'この注文をキャンセルしてもよろしいですか?';

  @override
  String get deliveryStatus => '配送状況';

  @override
  String get waybillNumber => '運送状番号';

  @override
  String get productAcceptance => '商品受領';

  @override
  String get productInTransit => '商品移動中';

  @override
  String get deliveryArrived => '配送到着';

  @override
  String get startDelivery => '配送開始';

  @override
  String get deliveryInformationHasNotBeenUpdated => '配信情報は更新されていません。 後でもう一度試してください';

  @override
  String get dicountInvalid => '割引は注文金額の 30% を超えることはできません';

  @override
  String get payment => '支払い';

  @override
  String get inquiryHistory => 'お問い合わせ履歴';

  @override
  String get answeredInquiry => '回答済み';

  @override
  String get pending => '保留中';

  @override
  String get small => '小さい';

  @override
  String get normal => '普通の';

  @override
  String get large => '大きい';

  @override
  String get huge => '巨大な';

  @override
  String get content => 'コンテンツ';

  @override
  String get report => '報告';

  @override
  String get areYouSureToReportThisPost => 'この投稿を報告してもよろしいですか?';

  @override
  String get areYouSureToReportThisComment => 'このコメントを報告してもよろしいですか?';

  @override
  String get areYouSureToReportThisUser => 'このユーザーを報告してもよろしいですか?';

  @override
  String get reportScreen => '報告された投稿、コメント、プロフィール';

  @override
  String get reportedPost => '報告された投稿';

  @override
  String get reportedComment => '報告されたコメント';

  @override
  String get reportedUser => 'ユーザーを報告';

  @override
  String get areYouSureToDeleteThisPost => 'この投稿を削除してもよろしいですか？';

  @override
  String get areYouSureToDeleteThisComment => 'このコメントを削除してもよろしいですか？';

  @override
  String get areYouSureToDeleteThisUser => 'このユーザーを削除してもよろしいですか？';

  @override
  String get cancelOrder => '주문 취소';

  @override
  String get wouldYouLikeSendAnInquiry => 'お問い合わせを送信しますか?';

  @override
  String get wouldYouLikeUploadPost => '投稿をアップロードしますか?';

  @override
  String get wouldYouLikeUploadAReview => 'レビューをアップロードしますか?';

  @override
  String get all => 'すべて';
}
