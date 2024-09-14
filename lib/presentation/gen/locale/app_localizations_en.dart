import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get community => 'Community';

  @override
  String get forum => 'Forum';

  @override
  String get store => 'Store';

  @override
  String get profile => 'My page';

  @override
  String get profileNavText => 'MY';

  @override
  String get news => 'News';

  @override
  String get fullMenu => 'Full menu';

  @override
  String get bestReview => 'Best review';

  @override
  String get pressAgainToCloseApp => 'Press again to close the app.';

  @override
  String get seeAll => 'See all';

  @override
  String get onlineMagazine => 'Online magazine';

  @override
  String get sgmNews => 'SGM news';

  @override
  String get sungongMuseum => 'Sungong museum';

  @override
  String get communityCategory => 'Community category';

  @override
  String get bulletBoardCategory => 'Bulletin board category';

  @override
  String get storeCategory => 'Store category';

  @override
  String get sungongMuseumKo => 'Sungong museum';

  @override
  String get category => 'Category';

  @override
  String get companyName => 'Sungongmania Co., Ltd.';

  @override
  String get ceoTitle => 'CEO : ';

  @override
  String get ceo => 'Oh Chae-Mu';

  @override
  String get emailTitle => 'Email : ';

  @override
  String get emailValue => 'ocm@mecelljoo.kr';

  @override
  String get contactNumberTitle => 'Contact Number : ';

  @override
  String get contactNumber => '070-5213-7613';

  @override
  String get businessRegistrationNumberTitle => 'Business Registration Number : ';

  @override
  String get businessRegistrationNumber => '887-87-02726';

  @override
  String get ecommerceRegistrationNumberTitle => 'E-commerce Registration Number : ';

  @override
  String get ecommerceRegistrationNumber => '2023-Chungnam Cheonan-3531';

  @override
  String get personalInfoProtectionOfficerTitle => 'Personal Information Protection Officer : ';

  @override
  String get personalInfoProtectionOfficer => 'Oh Chae-Mu';

  @override
  String get officerEmailTitle => 'Officer Email : ';

  @override
  String get officerEmail => 'ocm@mecelljoo.kr';

  @override
  String get addressTitle => 'Address : ';

  @override
  String get addressValue => '[31156] 804, Marvelous S Tower, 86, Buldang 22-ro, Seobuk-gu, Cheonan-si, Chungcheongnam-do, South Korea';

  @override
  String get copyrightTitle => 'Copyright';

  @override
  String get copyright => 'ⓒ 2024 Sungongmania All rights reserved.';

  @override
  String get latest => 'Latest';

  @override
  String get popular => 'Popular';

  @override
  String get recommended => 'Recommended';

  @override
  String get compose => 'Compose';

  @override
  String get bestContents => 'Best contents';

  @override
  String get onlineMagazineKo => 'Online magazine';

  @override
  String get bestReviewLower => 'Best review';

  @override
  String get selfEmployment => 'Self-employment';

  @override
  String get sales => 'Sales';

  @override
  String get houseWife => 'Housewife';

  @override
  String get officeWorkers => 'Office workers';

  @override
  String get inseldeomBusiness => 'Inseldeom business';

  @override
  String get allPosts => 'All posts';

  @override
  String get favoritePosts => 'Favorite posts';

  @override
  String get popularPosts => 'Popular posts';

  @override
  String get curator => 'Curator';

  @override
  String get unit => 'Won';

  @override
  String commonCurrencyFormat(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return '$valueString won';
  }

  @override
  String get easyLoginSNS => 'Easy SNS login';

  @override
  String get signIn => 'Sign in';

  @override
  String get register => 'Register';

  @override
  String get findId => 'Find ID';

  @override
  String get findPassword => 'Find password';

  @override
  String get password => 'Password';

  @override
  String get username => 'Username';

  @override
  String get termOfService => 'Terms of Service for Success Mania Mall';

  @override
  String get termOfServiceTitle => 'Terms of Service';

  @override
  String get termOfService1 => 'Article 1 (Purpose)';

  @override
  String get termOfService1Content1 => 'This agreement aims to regulate the rights, obligations, and responsibilities between Success Mania (hereinafter referred to as the \'Mall\'), an e-commerce operator, and users of the Success Mania Cyber Mall (hereinafter referred to as the \'Mall\') provided by Success Mania in the use of Internet-related services (hereinafter referred to as the \'Service\').\n※ \'This agreement shall also apply to electronic commerce using PC communication, wireless, and other similar methods, unless it contradicts its nature.\'';

  @override
  String get termOfService2 => 'Article 2 (Definitions)';

  @override
  String get termOfService2Content1 => '① \'Mall\' refers to a virtual business place set up by Success Mania to provide users with goods or services (hereinafter referred to as \'goods, etc.\') using computer and other information communication facilities to trade goods, etc., and also refers to a business operator operating a cyber mall.';

  @override
  String get termOfService2Content2 => '② \'User\' refers to members and non-members who access the \'Mall\' and receive the services provided by the \'Mall\' according to this agreement.';

  @override
  String get termOfService2Content3 => '③ \'Member\' refers to a person who has registered as a member of the \'Mall\' and can continuously use the services provided by the \'Mall\'.';

  @override
  String get termOfService2Content4 => '④ \'Non-member\' refers to a person who uses the services provided by the \'Mall\' without registering as a member.';

  @override
  String get termOfService3 => 'Article 3 (Specification, Explanation, and Amendment of Terms and Conditions)';

  @override
  String get termOfService3Content1 => '① The \'Mall\' shall post the contents of this agreement, the name, and representative\'s name of Success Mania, the address of the business place (including the address where consumer complaints can be addressed), telephone number, fax number, email address, business registration number, telecommunication sales report number, personal information protection manager, etc., on the initial service screen (front) of Success Mania Cyber Mall so that users can easily find them. However, the contents of the agreement may be made available for users to view through a connected screen.';

  @override
  String get termOfService3Content2 => '② Before users agree to this agreement, the \'Mall\' must provide a separate connection screen or pop-up screen, etc., to allow users to confirm important content such as withdrawal rights, delivery responsibilities, and refund conditions specified in the agreement.';

  @override
  String get termOfService3Content3 => '③ \'The \'Mall\' may amend this agreement within the scope not violating related laws such as the Electronic Commerce Act, Act on Regulation of Terms and Conditions, Electronic Documents and Transactions Act, Electronic Financial Transactions Act, Electronic Signature Act, Act on Promotion of Information and Communications Network Utilization and Information Protection, etc.';

  @override
  String get termOfService3Content4 => '④ When the \'Mall\' amends the agreement, it shall notify users of the effective date and reasons for the amendment from 7 days before the effective date until the day before the effective date, along with the current agreement, on the initial screen of the mall. However, in the case of changing the content of the agreement unfavorably to users, the \'Mall\' shall announce it with a prior notice period of at least 30 days. In this case, the \'Mall\' clearly indicates the contents before and after the amendment for users to easily understand.';

  @override
  String get termOfService3Content5 => '⑤ When the \'Mall\' amends the agreement, the amended agreement shall apply only to contracts concluded after the effective date, and the provisions of the previous agreement shall apply to contracts already concluded. However, if users who have already entered into a contract wish to apply the amended terms of the agreement, the amended terms of the agreement shall apply if they submit their intention to the \'Mall\' within the notice period of the amended agreement pursuant to Paragraph 3 and obtain approval from the \'Mall\'.';

  @override
  String get termOfService3Content6 => '⑥ Matters not specified in this agreement and interpretation of this agreement shall be governed by the Electronic Commerce Consumer Protection Act, Act on Regulation of Terms and Conditions, Guidelines for Consumer Protection in Electronic Commerce, etc., established by the Fair Trade Commission, relevant laws and regulations, or commercial practices.';

  @override
  String get termOfService4 => 'Article 4 (Provision and Change of Service)';

  @override
  String get termOfService4Content1 => '① The \'Mall\' performs the following tasks:\n1. Providing information on goods or services and concluding purchase contracts\n2. Delivery of goods or services contracted\n3. Other tasks specified by the \'Mall\'';

  @override
  String get termOfService4Content2 => '② In case of the goods or services being sold out or changes in technical specifications, etc., the \'Mall\' may change the contents of the goods or services to be provided under the contract to be concluded later. In this case, the \'Mall\' shall immediately notify the changed contents of the goods or services and the date of provision in the place where the current contents of the goods or services are posted.';

  @override
  String get termOfService4Content3 => '③ If the \'Mall\' changes the content of the service contracted with the user due to the goods being out of stock or changes in technical specifications, etc., the \'Mall\' shall notify the user immediately to an address where the user can be contacted.';

  @override
  String get termOfService4Content4 => '④ In the case of the preceding paragraph, the \'Mall\' shall compensate for any damages incurred by the user due to this. However, this shall not apply if the \'Mall\' proves that there is no intent or negligence.';

  @override
  String get termOfService5 => 'Article 5 (Suspension of Service)';

  @override
  String get termOfService5Content1 => '① The \'Mall\' may temporarily suspend the provision of services in cases such as maintenance, replacement, or failure of computer or information communication facilities, or interruption of communication.';

  @override
  String get termOfService5Content2 => '② The \'Mall\' shall compensate users or third parties for damages incurred due to the temporary suspension of service due to the reasons stated in Paragraph 1. However, this shall not apply if the \'Mall\' proves that there is no intent or negligence.';

  @override
  String get termOfService5Content3 => '③ In cases where the service cannot be provided due to reasons such as change of business items, abandonment of business, or integration between companies, the \'Mall\' shall notify users in accordance with Article 8 and compensate consumers according to the conditions initially presented by the \'Mall\'. However, if the \'Mall\' has not notified the compensation standards, it shall pay users in kind or cash equivalent to the mileage or accumulation points of users at the value of the currency used by the \'Mall\'.';

  @override
  String get termOfService6 => 'Article 6 (Membership Registration)';

  @override
  String get termOfService6Content1 => '① Users apply for membership by filling out the membership information according to the form specified by the \'Mall\' and expressing their agreement to this agreement.';

  @override
  String get termOfService6Content2 => '② The \'Mall\' registers users as members unless they fall under any of the following subparagraphs among those who applied for membership as stated in Paragraph 1. However, if a minor enters into a contract, the \'Mall\' shall notify them that the contract can be canceled by the minor themselves or their legal representative if they do not obtain consent from their legal representative.\n1. In case of false, omitted, or erroneous registration information\n2. In case a minor purchases goods or services prohibited by the Juvenile Protection Act, such as cigarettes, alcohol, etc.\n3. In case registering as a member would significantly impede the \'Mall\' technologically';

  @override
  String get termOfService6Content3 => '③ The time of conclusion of the membership registration agreement is when the acceptance of the \'Mall\' reaches the member.';

  @override
  String get termOfService6Content4 => '④ If there is any change in the information provided at the time of membership registration, the member must notify the \'Mall\' of such changes through the method of modifying member information, etc., within a reasonable period.';

  @override
  String get termOfService7 => 'Article 7 (Withdrawal of Membership and Loss of Qualification)';

  @override
  String get termOfService7Content1 => '① Members may request withdrawal from the \'Mall\' at any time, and the \'Mall\' shall immediately process the withdrawal of membership.';

  @override
  String get termOfService7Content2 => '② If a member falls under any of the following subparagraphs, the \'Mall\' may restrict or suspend the member\'s qualifications:\n1. In case of false information upon registration\n2. In case the member fails to pay the price of goods purchased through the \'Mall\', or other debts owed to the \'Mall\' by the due date\n3. In case of interfering with the use of the \'Mall\' by others or stealing their information, threatening the order of electronic commerce\n4. In case of engaging in acts prohibited by law or this agreement using the \'Mall\'';

  @override
  String get termOfService7Content3 => '③ If the \'Mall\' restricts or suspends the membership, and the same act is repeated twice or is not corrected within 30 days, the \'Mall\' may cancel the membership.';

  @override
  String get termOfService7Content4 => '④ If the \'Mall\' cancels the membership, it shall delete the membership registration. In this case, the \'Mall\' shall notify the member in advance and provide an opportunity to explain for at least 30 days before deleting the membership registration.';

  @override
  String get termOfService8 => 'Article 8 (Notice to Members)';

  @override
  String get termOfService8Content1 => '① If the \'Mall\' gives notice to a member, it may be sent to the member\'s designated email address agreed upon with the \'Mall\'.';

  @override
  String get termOfService8Content2 => '② In the case of notifying a large number of unspecified members, the \'Mall\' may replace individual notices by posting them on the \'Mall\' bulletin board for more than a week. However, individual notices shall be made for matters significantly affecting the member\'s transactions.';

  @override
  String get termOfService9 => 'Article 9 (Purchase Application)';

  @override
  String get termOfService9Content1 => '① Users of the \'Mall\' apply for purchase through the \'Mall\' in the following or similar manner, and the \'Mall\' shall provide the following information clearly to users when applying for purchase:\n1. Search and selection of goods, etc.\n2. Input of recipient\'s name, address, phone number, email address (or mobile phone number), etc.\n3. Confirmation of terms and conditions, confirmation or refusal of items such as the right to withdraw, services with restricted withdrawal, shipping fees, installation fees, etc.\n4. Agreement to this agreement and confirmation or refusal of the above 3 items\n5. Confirmation of the purchase request of goods, etc., and agreement to the \'Mall\' confirmation\n6. Selection of payment method';

  @override
  String get termOfService9Content2 => '② If the \'Mall\' needs to provide or outsource the personal information of the buyer to a third party, it must obtain the buyer\'s consent at the time of actual purchase application. However, the \'Mall\' shall not obtain comprehensive consent at the time of membership registration. In this case, the \'Mall\' must specify to the buyer the personal information items provided, the recipient, the purpose of using the recipient\'s personal information, and the period of retention and use of the recipient\'s personal information. However, this shall be in accordance with other laws, such as the Personal Information Protection Act, Article 25, Paragraph 1, regarding the entrustment of personal information processing.';

  @override
  String get termOfService10 => 'Article 10 (Formation of Contract)';

  @override
  String get termOfService10Content1 => '① The \'Mall\' may not accept the purchase application under the following subparagraphs among those in Article 9. However, if a minor enters into a contract, the \'Mall\' shall notify them that the contract can be canceled by the minor themselves or their legal representative if they do not obtain consent from their legal representative.\n1. In case of false, omitted, or erroneous information in the application\n2. In case a minor purchases goods or services prohibited by the Juvenile Protection Act, such as cigarettes, alcohol, etc.\n3. In case accepting the purchase application would significantly impede the \'Mall\' technologically';

  @override
  String get termOfService10Content2 => '② The contract is deemed to have been concluded at the time the acceptance of the \'Mall\' reaches the user, as stated in Paragraph 1 of Article 12.';

  @override
  String get termOfService10Content3 => '③ The \'Mall\'s acceptance shall include confirmation of the user\'s purchase application, the availability of the product, and information regarding correction or cancellation of the purchase application.';

  @override
  String get termOfService11 => 'Article 11 (Payment Method)';

  @override
  String get termOfService11Content1 => 'The methods of payment for goods or services purchased from the \'mall\' can be made through the following methods. However, the \'mall\' cannot charge any additional fees on the payment method of the user for the price of goods, etc.\n1. Various account transfers such as phone banking, internet banking, and mail banking\n2. Various card payments such as prepaid cards, debit cards, and credit cards\n3. Online wire transfers\n4. Payment by electronic currency\n5. Payment upon receipt\n6. Payment by points provided by the \'mall\' such as mileage\n7. Payment by gift certificates contracted with the \'mall\' or recognized by the \'mall\'\n8. Payment by other electronic payment methods';

  @override
  String get termOfService12 => 'Article 12 (Confirmation of Receipt Notice, Change and Cancellation of Purchase Application)';

  @override
  String get termOfService12Content1 => '① The \'mall\' shall send a receipt confirmation notice to the user if there is a purchase application from the user.';

  @override
  String get termOfService12Content2 => '② If there is a discrepancy in the expression of intent after receiving the receipt confirmation notice, the user may immediately request a change or cancellation of the purchase application after receiving the receipt confirmation notice, and the \'mall\' shall promptly process it according to the request of the user before delivery. However, if payment has already been made, it shall be subject to the provisions of Article 15 regarding withdrawal of subscription.';

  @override
  String get termOfService13 => 'Article 13 (Supply of Goods, etc.)';

  @override
  String get termOfService13Content1 => '① Unless otherwise agreed upon separately regarding the time of supply of goods, etc., the \'mall\' shall take necessary measures such as order production, packaging, etc., so that the goods, etc., can be delivered within 7 days from the date the user placed the order. However, if the \'mall\' has already received all or part of the price of the goods, etc., it shall take measures within 3 business days from the date of receipt of all or part of the price. At this time, the \'mall\' shall take appropriate measures to allow the user to confirm the procedure and progress of the supply of goods, etc.';

  @override
  String get termOfService13Content2 => '② The \'mall\' shall specify the delivery method, party responsible for the delivery cost by method, and delivery period by method for the goods purchased by the user. If the \'mall\' exceeds the agreed delivery period, it shall compensate for any damages caused to the user as a result. However, this shall not apply if the \'mall\' proves that there is no intention or negligence.';

  @override
  String get termOfService14 => 'Article 14 (Refund)';

  @override
  String get termOfService14Content1 => 'If the \'mall\' is unable to deliver or provide the goods, etc., purchased by the user due to reasons such as being out of stock, it shall promptly notify the user of the reasons and refund the price of the goods, etc., within 3 business days from the date of receipt of the price if the price of the goods, etc., has been received in advance.';

  @override
  String get termOfService15 => 'Article 15 (Right of Withdrawal, etc.)';

  @override
  String get termOfService15Content1 => '① A user who has entered into a contract for the purchase of goods, etc., with the \'mall\' may withdraw the subscription within 7 days from the date of receiving the written contract content pursuant to Article 13 (2) of the Act on Consumer Protection in Electronic Commerce, etc. However, if there are other provisions regarding withdrawal of subscription under the Act on Consumer Protection in Electronic Commerce, etc., such provisions shall apply.';

  @override
  String get termOfService15Content2 => '② If the user receives the goods, etc., the user may not return or exchange them under the following subparagraphs.\n1. In case the goods, etc., are destroyed or damaged due to the user\'s fault (however, if the packaging, etc., is damaged to check the contents of the goods, etc., the subscription may be withdrawn)\n2. In case the value of the goods, etc., has significantly decreased due to the user\'s use or partial consumption\n3. In case the value of the goods, etc., has significantly decreased to the extent that resale is difficult due to the passage of time\n4. In case the original packaging of the goods, etc., has been damaged despite the possibility of duplicating the goods, etc., with the same performance';

  @override
  String get termOfService15Content3 => '③ In cases falling under subparagraphs 2 to 4 of paragraph 2, the user\'s right of withdrawal shall not be restricted unless the \'mall\' has clearly indicated to the user in an easily accessible place that the withdrawal of subscription is restricted or has taken measures such as providing trial products.';

  @override
  String get termOfService15Content4 => '④ Notwithstanding the provisions of paragraphs 1 and 2, if the contents of the goods, etc., are different from the displayed or advertised contents or are not performed in accordance with the contract, the user may withdraw the subscription within 3 months from the date of receiving the goods, etc., or within 30 days from the date the fact was known or could be known.';

  @override
  String get termOfService16 => 'Article 16 (Effect of Withdrawal of Subscription, etc.)';

  @override
  String get termOfService16Content1 => '① If the \'mall\' receives the goods, etc., returned by the user, it shall refund the price of the goods, etc., received within 3 business days. In this case, if the \'mall\' delays the refund of the goods, etc., to the user, it shall pay the user delay interest calculated by multiplying the delay interest rate prescribed in Article 21-2 of the Enforcement Decree of the Act on Consumer Protection in Electronic Commerce, etc.';

  @override
  String get termOfService16Content2 => '② If the user has paid the price of the goods, etc., with a credit card or electronic currency, the \'mall\' shall promptly request the business operator who provided the payment method to suspend or cancel the claim for the price of the goods, etc.';

  @override
  String get termOfService16Content3 => '③ In the case of withdrawal of subscription, etc., the user shall bear the necessary costs for returning the received goods, etc. The \'mall\' shall not claim a penalty or compensation from the user for withdrawal of subscription, etc. However, if the subscription is withdrawn due to the goods, etc., being different from the displayed or advertised contents or not performed in accordance with the contract, the \'mall\' shall bear the necessary costs for returning the goods, etc.';

  @override
  String get termOfService16Content4 => '④ If the user has borne the shipping costs when receiving the goods, etc., the \'mall\' shall clearly indicate who bears the costs upon withdrawal of subscription for the user\'s easy understanding.';

  @override
  String get termOfService17 => 'Article 17 (Protection of Personal Information)';

  @override
  String get termOfService17Content1 => '① The \'mall\' collects the minimum necessary personal information within the scope necessary for providing services when collecting personal information of the user.';

  @override
  String get termOfService17Content2 => '② The \'mall\' does not collect in advance the information necessary for the service provision unless it is agreed upon by the user. The \'mall\' shall take measures such as encrypting personal information, etc., to safely handle personal information including credit information so that the user can safely handle it.';

  @override
  String get termOfService17Content3 => '③ The \'mall\' shall not disclose or distribute personal information of the user without their consent. However, the following cases are excluded.\n1. If there is a request from the investigative agency according to the procedure and method prescribed by the Act for investigation purposes\n2. If there is a request for settlement according to the procedures and methods prescribed by other laws\n3. If it is necessary to provide statistical information for academic research or market research, it is provided in a form that cannot identify a specific individual';

  @override
  String get termOfService17Content4 => '④ If the \'mall\' needs to obtain consent from the user in accordance with paragraph 2 and paragraph 3, it shall specify or notify the identity of the person in charge of personal information management (hereinafter referred to as \'personal information manager\'), purpose of collection and use of information, items of information to be collected and used, retention and use period, etc.';

  @override
  String get termOfService17Content5 => '⑤ The user may request access to or modify their personal information at any time, and the \'mall\' is obligated to take necessary measures without delay. If the user requests correction of an error in personal information, the \'mall\' shall not use or provide the personal information until the correction is completed.';

  @override
  String get termOfService17Content6 => '⑥ The \'mall\' shall limit the number of persons in charge of handling personal information of the user to a minimum, and shall take responsibility for accidents such as loss, theft, leakage, alteration, or damage of personal information including credit information, including the civil, criminal, and administrative responsibilities related thereto.';

  @override
  String get termOfService17Content7 => '⑦ If the \'mall\' or a third party that has received personal information from the \'mall\' is obligated to destroy personal information of the user, such as reaching the purpose of processing personal information or the end of the service provision, it shall do so without delay. The \'mall\' shall clearly specify the information destruction procedure and method in the privacy policy and take necessary measures to ensure that the personal information is not restored or regenerated.';

  @override
  String get termOfService17Content8 => '⑧ The \'mall\' shall actively cooperate with the user\'s request to view and confirm their transaction details so that the user can easily verify their transaction details, such as payment history and usage of personal information.';

  @override
  String get termOfService17Content9 => '⑨ “Mall” does not set the consent box regarding the collection, use, and provision of personal information to be pre-selected. Additionally, services that are restricted when the user refuses consent regarding the collection, use, and provision of personal information. We specify this specifically and do not restrict or refuse the provision of services such as membership registration due to the user\'s refusal to consent to the collection, use, and provision of personal information that is not required to be collected.';

  @override
  String get termOfService18 => 'Article 18 (Obligation to Notify)';

  @override
  String get termOfService18Content1 => 'If the \'mall\' confirms that the user\'s opinion or complaint is justifiable, it shall immediately process it. However, if immediate processing is difficult, the user shall be notified of the reason and processing schedule.';

  @override
  String get termOfService18Content2 => '② “Mall” must have a security system to protect users’ personal information (including credit information) so that users can use Internet services safely.';

  @override
  String get termOfService18Content3 => '③ If the “Mall” incurs damages to a user by engaging in unfair labeling or advertising practices prescribed in Article 3 of the Act on Fairness of Labeling and Advertising for products or services, it shall be responsible for compensating the damages. ';

  @override
  String get termOfService18Content4 => '④ “Mall” does not send commercial advertising emails that users do not want.';

  @override
  String get termOfService19 => 'Article 19 (User\'s Obligations)';

  @override
  String get termOfService19Content1 => '① Users shall not do the following.\n1. Register false information when applying or changing\n2. Stealing the information of others\n3. Change the information posted by the \'mall\'\n4. Infringe on the intellectual property rights such as the copyright of the \'mall\' or third parties\n5. Defamation of or interfere with the work of others\n6. Spread sexually explicit or violent messages, videos, voice, writing, and other information that violates public order and morals on the homepage operated by the \'mall\'\n7. Posting or sending information (computer programs, etc.) other than those set by the \'mall\'\n8. Sending or posting advertisements or spam emails\n9. Impersonating the operator of the \'mall\' or the manager or employee of the \'mall\' to fraudulently use the service\n10. Violating other related laws';

  @override
  String get termOfService19Content2 => '② Users shall comply with the matters stipulated in the notices, precautions for use, etc. provided by the \'mall\', and shall not engage in activities that interfere with the work of the \'mall\'.';

  @override
  String get termOfService19Content3 => '③ If a member becomes aware that his/her ID and password has been stolen or is being used by a third party, he/she must immediately notify the “Mall” and follow any instructions provided by the “Mall”.';

  @override
  String get termOfService20 => 'Article 20 (Obligations of the \'Mall\')';

  @override
  String get termOfService20Content1 => '① The \'mall\' shall not do any act prohibited by these terms and conditions or contrary to the customs of e-commerce, and shall endeavor to provide goods and services continuously and reliably as stipulated in these terms and conditions.';

  @override
  String get termOfService21 => 'Article 21 (Exemption Clause)';

  @override
  String get termOfService21Content1 => '① The \'mall\' shall not be liable for any damage caused by the user\'s reasons for not being able to use the service normally, such as natural disasters or other force majeure.';

  @override
  String get termOfService21Content2 => '② The \'mall\' shall not be liable for any damage caused by the user\'s reasons for not being able to use the service normally, such as natural disasters or other force majeure.';

  @override
  String get termOfService22 => 'Article 22 (Dispute Resolution)';

  @override
  String get termOfService22Content1 => '① The \'mall\' shall establish and operate a complaints processing system to reflect the opinions and complaints raised by users and to compensate for damages related to online shopping.';

  @override
  String get termOfService22Content2 => '② The \'mall\' shall promptly handle complaints submitted by users. However, if immediate processing is difficult, the user shall be notified of the reason and processing schedule immediately.';

  @override
  String get termOfService22Content3 => '③ “Mall” must notify the user when using the copyright belonging to the user in accordance with the agreement.';

  @override
  String get termOfService23 => 'Article 23 (Jurisdiction and Governing Law)';

  @override
  String get termOfService23Content1 => 'These terms and conditions shall be governed by the laws of the Republic of Korea, and any lawsuits between the \'mall\' and the user regarding e-commerce shall be filed with the competent court under the Civil Procedure Act.';

  @override
  String get termOfService23Content2 => 'Additional Provisions\nThis Terms and Conditions shall take effect on January 1, 2024.';

  @override
  String get termOfService23Content3 => '③ If there are requests for remedies from users regarding electronic commerce disputes between the \'Mall\' and users, they may follow the mediation of a dispute resolution institution commissioned by the Fair Trade Commission or the mayor/governor of a city or province.';

  @override
  String get termOfService24 => 'Article 24 (Jurisdiction and Applicable Law)';

  @override
  String get termOfService24Content1 => '① Lawsuits regarding electronic commerce disputes between the \'Mall\' and users are subject to the exclusive jurisdiction of the local court with jurisdiction over the user\'s address at the time of filing the lawsuit. However, if the user\'s address is unclear at the time of filing the lawsuit or for foreign residents, it shall be filed with the court having jurisdiction under the Civil Procedure Act.';

  @override
  String get termOfService24Content2 => '② Korean law applies to electronic commerce lawsuits filed between the \'Mall\' and users.';

  @override
  String get timeTakeEffect => 'Provision Effective Date: This agreement shall take effect from March 1, 2024.';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyContent => 'Success Mania complies with the Personal Information Protection Act and related laws and regulations to protect the freedom and rights of information subjects, lawfully process personal information, and securely manage it. In accordance with Article 30 of the Personal Information Protection Act, we establish and disclose this privacy policy to guide the procedures and standards for personal information processing and to promptly and smoothly handle related complaints.';

  @override
  String get privacyPolicy1 => '1. Purpose of Personal Information Processing';

  @override
  String get privacyPolicy1Content1 => 'Success Mania processes personal information for the following purposes. The processed personal information will not be used for any purpose other than the following, and if the purpose of use changes, we will take necessary measures, such as obtaining separate consent, in accordance with Article 18 of the Personal Information Protection Act.';

  @override
  String get privacyPolicy1Content2 => '1. Membership Registration and Management\nWe process personal information for membership registration confirmation, identification and authentication for membership service provision, maintenance and management of membership status, prevention of service misuse, confirmation of parental consent for the processing of personal information of children under 14, various notifications, and complaint handling purposes.';

  @override
  String get privacyPolicy1Content3 => '2. Provision of Goods or Services\nWe process personal information for the delivery of goods, provision of services, sending of contracts or bills, provision of contents, provision of customized services, identity verification, age verification, payment and settlement, and debt collection purposes.';

  @override
  String get privacyPolicy1Content4 => '3. Marketing and Advertising\nDelivery of advertising information, understanding of access frequency, or statistical analysis of member service usage';

  @override
  String get privacyPolicy2 => '2. Processing and Retention Period of Personal Information';

  @override
  String get privacyPolicy2Content1 => 'Membership Registration and Management: Until the withdrawal from the business website\nHowever, until the end of the following reasons';

  @override
  String get privacyPolicy2Content2 => '1) Reasons for Information Retention by Company Policy The company may retain member information for oo years from the date of termination of the service contract in order to prevent the recurrence of the misuse of the service by bad members, to resolve disputes, and to cooperate with requests from investigative agencies.';

  @override
  String get privacyPolicy2Content3 => '2) Reasons for Information Retention by Relevant Laws In cases where it is necessary to preserve member information pursuant to the provisions of related laws such as the Act on Consumer Protection in Electronic Commerce, the company will retain member information for a certain period prescribed by the related laws.';

  @override
  String get privacyPolicy2Content4 => 'Records of contracts or subscription withdrawals\nReason for retention: Act on Consumer Protection in Electronic Commerce\nRetention period: 5 years';

  @override
  String get privacyPolicy2Content5 => 'Records of payment and supply of goods, etc.\nReason for retention: Act on Consumer Protection in Electronic Commerce\nRetention period: 5 years';

  @override
  String get privacyPolicy2Content6 => 'Records of consumer complaints or dispute resolution\nReason for retention: Act on Consumer Protection in Electronic Commerce\nRetention period: 3 years';

  @override
  String get privacyPolicy2Content7 => 'Log records\nReason for retention: Communications Secrets Protection Act\nRetention period: 3 months';

  @override
  String get privacyPolicy2Content8 => '3) In case of the remaining obligations and debts related to website use, until the settlement of such obligations and debts';

  @override
  String get privacyPolicy3 => '3. Personal Information Items Processed';

  @override
  String get privacyPolicy3Content1 => 'Success Mania processes the following personal information for membership registration, counseling, and service application.';

  @override
  String get privacyPolicy3Content2 => '1. Membership Registration and Management\nName, Date of Birth, Gender, Login ID, Password, Home Phone Number, Mobile Phone Number, Email, Information of legal representative for users under the age of 14\n2. When applying for a service\nAddress, Payment Information\n・ During the use of services or business processing, service usage records, access logs, cookies, access IP, payment records, and records of improper use may be collected and generated.';

  @override
  String get privacyPolicy4 => '4. Methods of Personal Information Collection';

  @override
  String get privacyPolicy4Content1 => 'Website, written forms, bulletin boards, email, event entries, delivery requests, phone calls, faxes, collection through generated information collection tools';

  @override
  String get privacyPolicy5 => '5. Matters concerning the Processing of Personal Information of Children Under 14 Years of Age';

  @override
  String get privacyPolicy5Content1 => '① Success Mania collects the minimum personal information necessary for performing the service with the consent of the legal representative when collecting personal information of children under 14 years of age.\n• Required Items: Name, relationship, contact information of the legal representative';

  @override
  String get privacyPolicy5Content2 => '② Additionally, when collecting personal information of children for related promotions, separate consent is obtained from the legal representative.';

  @override
  String get privacyPolicy5Content3 => '③ When collecting personal information of children under 14 years of age, Success Mania may request minimal information such as the name and contact information of the legal representative from the child and confirm whether one of the following methods has been used to obtain lawful consent from the legal representative.\n• Method to have the legal representative indicate consent on a website with the consent content and inform the personal information processor of the consent via a text message to the legal representative\'s mobile phone\n• Method to have the legal representative indicate consent on a website with the consent content and provide the legal representative\'s credit card or debit card information\n• Method to have the legal representative indicate consent on a website with the consent content and confirm the identity through the legal representative\'s mobile phone authentication\n• Method to issue a written document containing the consent content directly to the legal representative or deliver it via mail or fax and have the legal representative sign and submit the consent\n• Method to send an email containing the consent content and receive an email with the consent indication from the legal representative\n• Method to inform the legal representative of the consent content via phone call and obtain consent, or guide them to confirm the consent content through methods such as an internet address, and confirm the consent through a follow-up phone call\n• Any other method equivalent to the above to inform the legal representative of the consent content and confirm the consent indication';

  @override
  String get privacyPolicy6 => '6. Procedures and Methods of Personal Information Destruction';

  @override
  String get privacyPolicy6Content1 => '① Success Mania promptly destroys personal information when it becomes unnecessary due to the expiration of the personal information retention period or the achievement of the processing purpose.';

  @override
  String get privacyPolicy6Content2 => '② If personal information needs to be retained under other laws despite the expiration of the consent period obtained from the data subject or the achievement of the processing purpose, the company will move the personal information to a separate database or store it in a different location.';

  @override
  String get privacyPolicy6Content3 => '③ The procedures and methods of personal information destruction are as follows.\n1. Destruction Procedure Success Mania selects personal information for destruction when the reasons for destruction occur and destroys the personal information with the approval of the personal information protection manager.\n2. Destruction Method Personal information recorded and stored in electronic files is destroyed to ensure that the records cannot be regenerated, and personal information recorded and stored on paper is shredded or incinerated for destruction.';

  @override
  String get privacyPolicy7 => '7. Rights, Duties, and Methods of Exercising Rights of Information Subjects and Legal Representatives';

  @override
  String get privacyPolicy7Content1 => '① Information subjects may exercise their rights to access, correct, delete, or request processing suspension of personal information held by Success Mania at any time.\n※ Requests for access to information, etc., regarding children under 14 years of age must be made directly by the legal representative, and information subjects who are minors aged 14 or older may exercise their rights regarding personal information themselves or through a legal representative.';

  @override
  String get privacyPolicy7Content2 => '② Requests for rights can be made to Success Mania through written, email, facsimile (FAX), etc., in accordance with Article 41, Paragraph 1 of the Enforcement Decree of the Personal Information Protection Act, and Success Mania will promptly take measures in response.';

  @override
  String get privacyPolicy7Content3 => '③ Rights can also be exercised through a legal representative or a delegated person. In this case, you must submit a power of attorney according to the form prescribed in Annex 11 of the Enforcement Decree of the Personal Information Protection Act.';

  @override
  String get privacyPolicy7Content4 => '④ Requests for access to personal information and requests for processing suspension may be restricted in accordance with Article 35, Paragraph 4, and Article 37, Paragraph 2 of the Personal Information Protection Act.';

  @override
  String get privacyPolicy7Content5 => '⑤ Requests for correction and deletion of personal information cannot be made if the personal information is specified as a collection target by other laws.';

  @override
  String get privacyPolicy7Content6 => '⑥ Success Mania verifies whether the requester of access, correction, deletion, or processing suspension of personal information is the information subject or a legitimate representative.';

  @override
  String get privacyPolicy8 => '8. Measures for Securing the Safety of Personal Information';

  @override
  String get privacyPolicy8Content1 => 'Success Mania takes the following measures to ensure the safety of personal information.\n1. Administrative Measures: Establishment and implementation of internal management plans, operation of dedicated organizations, regular employee education\n2. Technical Measures: Access control for personal information processing systems, installation of access control systems, encryption of personal information, installation and regular updates of security programs\n3. Physical Measures: Access control to computer rooms, data storage rooms, etc.';

  @override
  String get privacyPolicy9 => '9. Installation, Operation, and Refusal of Personal Information Automatic Collection Devices';

  @override
  String get privacyPolicy9Content1 => '① Success Mania uses \'cookies\' to store and retrieve usage information to provide individualized customized services to users.';

  @override
  String get privacyPolicy9Content2 => '② Cookies are small pieces of information sent by the server (http) used to operate the website to the user\'s computer browser and may also be stored on the hard disk of users\' PCs.\nA. Purpose of Using Cookies: Cookies are used to identify and provide optimized information to users by understanding the visit and usage patterns of each service and website visited by users, popular search terms, and security access status.\nB. Installation, Operation, and Refusal of Cookies: Users can refuse to store cookies by setting options in the tools>internet options>privacy menu of their web browser.\nC. Refusal to store cookies may make it difficult to use customized services.';

  @override
  String get privacyPolicy10 => '10. Personal Information Complaint Service';

  @override
  String get privacyPolicy10Content1 => 'Success Mania designates the following departments and personal information protection managers to protect customer\'s personal information and handle complaints related to personal information.';

  @override
  String get privacyPolicy10Content2 => '• Personal Information Protection Officer\nName: Bokyeong\nAffiliation: Success Mania\nPhone Number: 010-8222-8317\nEmail: bokyeong19@mecelljoo.kr';

  @override
  String get privacyPolicy10Content3 => '• Personal Information Protection Manager\nName: Bokyeong\nAffiliation: Success Mania\nPhone Number: 010-8222-8317\nEmail: dhcoan12@naver.com';

  @override
  String get privacyPolicy10Content4 => '• Customers can report any complaints related to personal information protection to the personal information protection manager or relevant department while using the company\'s services.\n• The company will promptly provide sufficient answers to customers\' reports.\n• If you need to report or consult about other personal information infringements, please contact the following agencies.';

  @override
  String get privacyPolicy10Content5 => 'Personal Information Infringement Reporting Center\n(privacy.kisa.or.kr / 118 without area code)';

  @override
  String get privacyPolicy10Content6 => 'Personal Information Dispute Mediation Committee\n(kopico.go.kr / 1833-6972)';

  @override
  String get privacyPolicy10Content7 => 'Cyber Investigation Division, Supreme Prosecutors\' Office\n(spo.go.kr / Area code + 1301)';

  @override
  String get privacyPolicy10Content8 => 'Cyber Safety Bureau, Korean National Police Agency\n(cyberbureau.police.go.kr / 182 without area code)';

  @override
  String minutesAgo(String time) {
    return '$time minutes ago';
  }

  @override
  String hoursAgo(String time) {
    return '$time hours ago';
  }

  @override
  String totalItems(int totalItems) {
    return 'Total $totalItems';
  }

  @override
  String get notificationAlert => 'Notification';

  @override
  String get ok => 'OK';

  @override
  String get check => 'Check';

  @override
  String get comment => 'Comment';

  @override
  String get viewProfile => 'View profile';

  @override
  String get writer => 'Writer';

  @override
  String get writeReply => 'Write reply';

  @override
  String get great => 'Great';

  @override
  String get joinMemberShip => 'Join membership';

  @override
  String get placeHolderId => 'ID';

  @override
  String get validationId => 'Alphanumeric combination within 8 characters';

  @override
  String get placeHolderPassword => 'Password';

  @override
  String get validationPassword => 'Combination of alphanumeric and special characters, 8-16 characters';

  @override
  String get doubleCheck => 'Double check';

  @override
  String get doubleCheckFail => 'The username already exists. Please use a different username.';

  @override
  String get doubleCheckSuccess => 'Duplicate check completed. The username is available.';

  @override
  String get placeHolderConfirmPassword => 'Confirm password';

  @override
  String get placeHolderName => 'Name';

  @override
  String get placeHolderPhone => 'Phone number';

  @override
  String get sendAuthentication => 'Send authentication';

  @override
  String get otpNumber => 'OTP number';

  @override
  String get verify => 'Verify';

  @override
  String get placeHolderReferrerPhoneNumber => 'Referrer phone number (optional)';

  @override
  String get usernameExisted => 'This username already exists.';

  @override
  String get phoneNumberExisted => 'This phone number is already in use.';

  @override
  String get verifyOTPSuccess => 'OTP verification success';

  @override
  String get empty => 'This field cannot be empty.';

  @override
  String get usernameInvalid => 'Combination of alphanumeric, minimum 6 characters';

  @override
  String get passwordInvalid => 'Combination of alphanumeric and special characters, minimum 8 characters';

  @override
  String get confirmPasswordNotMatch => 'Passwords do not match';

  @override
  String get phoneInvalid => 'Invalid phone number format.';

  @override
  String get otpInvalid => '6-digit number allowed';

  @override
  String get phoneNumberNotExisted => 'This phone number does not exist in the application.';

  @override
  String usernameOfPhoneNumber(String phoneNumber) {
    return 'The ID of $phoneNumber';
  }

  @override
  String couldNotLunch(String content) {
    return 'I couldn\'t have launch $content';
  }

  @override
  String get id => 'is';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get verifyAccountFailed => 'Username does not match the phone number';

  @override
  String get pleaseEnterPassword => 'Please enter the password to reset.';

  @override
  String get passwordCondition => '(Combination of alphanumeric and special characters, minimum 8 characters)';

  @override
  String get button => 'Button';

  @override
  String resetPasswordSuccess(Object phoneNumber) {
    return 'Password for $phoneNumber has been\nreset.';
  }

  @override
  String get productInformation => 'Product information';

  @override
  String get review => 'Review';

  @override
  String get inquiry => 'Inquiry';

  @override
  String get purchaseReview => 'Purchase review';

  @override
  String get writeReview => 'Write review';

  @override
  String get shoppingCart => 'Shopping cart';

  @override
  String get buyNow => 'Buy now';

  @override
  String get temporaryStorage => 'Temporary storage';

  @override
  String get registration => 'Registration';

  @override
  String get pleaseChooseCategory => 'Please choose a category.';

  @override
  String get pleaseSelectSubCategory => 'Please select a subcategory.';

  @override
  String get pleaseEnterSubject => 'Please enter the subject.';

  @override
  String get pleaseEnterYourDetails => 'Please enter your details.';

  @override
  String get editPhoto => 'Edit photo';

  @override
  String get notification => 'Notification';

  @override
  String get writeQA => 'Write QA';

  @override
  String get qaCompleted => 'QA completed';

  @override
  String get qaHidden => 'This is a hidden post.';

  @override
  String get sendWrittenReview => 'Write a review';

  @override
  String get productRating => 'Product rating';

  @override
  String get uploadImage => 'Upload image';

  @override
  String get writeReviewTextBoxTitle => 'Write review';

  @override
  String get writeReviewHintText => 'Please share your review of the product';

  @override
  String get takePicture => 'Take picture';

  @override
  String get pickFromGallery => 'Choose from gallery';

  @override
  String get deletePicture => 'Delete picture';

  @override
  String get cancel => 'Cancel';

  @override
  String get composeQA => 'Product inquiry';

  @override
  String get submitQA => 'Submit inquiry';

  @override
  String get qaCategoryType => 'Inquiry type';

  @override
  String get qaCategoryTypePlaceHolder => 'Select';

  @override
  String get qaDetails => 'Inquiry details';

  @override
  String get qaDetailsHintText => 'Please enter your inquiry';

  @override
  String get favoriteBoard => 'Favorite board';

  @override
  String get follower => 'Followers';

  @override
  String get delete => 'Delete';

  @override
  String get followManage => 'Follow management';

  @override
  String get referrerStatus => 'Referrer status';

  @override
  String get currentReferrer => 'Current referrers';

  @override
  String numberPeople(Object number) {
    return '$number people';
  }

  @override
  String get currentReferrerList => 'Current referrer list';

  @override
  String get next => 'Next';

  @override
  String get personalInfoTermAccept => '(required) Agree to privacy policy';

  @override
  String get smTermAccept => '(Required) Agree to Terms of Service';

  @override
  String get view => 'View';

  @override
  String get agreeToTermAndCond => 'Agree to terms and conditions';

  @override
  String get termOfUseSMMall => 'Agree to Success Mania Mall Terms of Use';

  @override
  String get termOfUseSMMallTitle => 'Term of use';

  @override
  String get successSecretOfTop1 => 'Success Secrets from Top 1%\nof entrepreneurs';

  @override
  String get termAndCondDetails => 'Terms and conditions details';

  @override
  String cartItemAmount(int amount) {
    return 'Total $amount items';
  }

  @override
  String get selectAll => 'Select all';

  @override
  String get editBusinessCard => 'Edit business card';

  @override
  String get businessCardDetails => 'Business card details';

  @override
  String get activity => 'Activity';

  @override
  String get followManagement => 'Follow management';

  @override
  String get favoritesBulletinBoard => 'Favorites bulletin board';

  @override
  String get curationActivities => 'Curation activities';

  @override
  String get communityActivities => 'Community activities';

  @override
  String get myDeliveryInformation => 'My Delivery information';

  @override
  String get checkOrderDeliveryDetails => 'Check order delivery details';

  @override
  String get inquiryDetails => 'Inquiry details';

  @override
  String get etc => 'Etc';

  @override
  String get recommenderStatus => 'Referrer status';

  @override
  String get entire => 'Entire';

  @override
  String get beforeDelivery => 'Before delivery';

  @override
  String get shipping => 'Shipping';

  @override
  String get deliveryComplete => 'Delivery complete';

  @override
  String get refund => 'Return / Refund';

  @override
  String get exchange => 'Exchange';

  @override
  String get deliveryInquiry => 'Delivery inquiry';

  @override
  String get orderDetails => 'Order details';

  @override
  String numberProducts(Object number) {
    return '$number items';
  }

  @override
  String get paymentInformation => 'Payment information';

  @override
  String get totalProductAmount => 'Total product amount';

  @override
  String get deliveryFee => 'Delivery fee';

  @override
  String get totalDiscountAmount => 'Total discount amount';

  @override
  String get paymentAmount => 'Payment amount';

  @override
  String get pointAccumulation => 'Point accumulation';

  @override
  String get paymentReceipt => 'Payment receipt';

  @override
  String get accumulationExpected => 'Expected accumulation';

  @override
  String get ordererInformation => 'Orderer information';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get email => 'Email';

  @override
  String get deliveryInformation => 'Delivery information';

  @override
  String get orderPayment => 'Order / Payment';

  @override
  String get orderer => 'Orderer';

  @override
  String get changeAddress => 'Change dddress';

  @override
  String get defaultShippingAddress => 'Default';

  @override
  String get addShippingAddress => 'Add shipping address';

  @override
  String get add => 'Add';

  @override
  String get whatYouWrote => 'What you wrote';

  @override
  String get postWithComment => 'Post with comment';

  @override
  String get likedPost => 'Liked post';

  @override
  String get justNow => 'Just now';

  @override
  String get noPost => 'No posts';

  @override
  String get exploreOurCommunity => 'Explore our community';

  @override
  String get exploreCurator => 'Explore curator';

  @override
  String get myProfile => 'My profile';

  @override
  String get businessCardEdit => 'Edit business card';

  @override
  String get basicInformation => 'Basic information';

  @override
  String get socialMedia => 'Social media';

  @override
  String get linkUrl => 'Link URL';

  @override
  String get snsSelect => 'Select SNS';

  @override
  String get addition => 'Addition';

  @override
  String get fileAttach => 'File attach';

  @override
  String get list => 'List';

  @override
  String get title => 'Title';

  @override
  String get imageFile => 'Image file';

  @override
  String get deletePhoto => 'Delete photo';

  @override
  String get changePhoto => 'Change photo';

  @override
  String get follow => 'Follow';

  @override
  String get following => 'Following';

  @override
  String get setting => 'Setting';

  @override
  String get accountInformationManagement => 'Account information management';

  @override
  String get signInWithNaver => 'Signing in with Naver';

  @override
  String get signInWithKakao => 'Signing in with Kakao';

  @override
  String get signInWithGoogle => 'Signing in with Google';

  @override
  String get signInWithApple => 'Signing in with Apple';

  @override
  String get notificationSettings => 'Notification settings';

  @override
  String get languageSettings => 'Language settings';

  @override
  String get korean => 'Korean';

  @override
  String get usagePolicy => 'Usage policy';

  @override
  String get logout => 'Logout';

  @override
  String get edit => 'Edit';

  @override
  String get withdrawal => 'Withdrawal';

  @override
  String get save => 'Save';

  @override
  String get changePassword => 'Change password';

  @override
  String get editCellPhoneNumber => 'Edit cell phone number';

  @override
  String get followNewPostNotification => 'Follow new post notification';

  @override
  String get commentAlert => 'Comment alert';

  @override
  String get likeAlert => 'Like alert';

  @override
  String get termAndPolicyConditions => 'Term and Policy conditions';

  @override
  String get currentPassword => 'Current password';

  @override
  String get passwordToChange => 'Password to change';

  @override
  String get change => 'Change';

  @override
  String get changePhoneNumber => 'Change phone number';

  @override
  String get recentSearches => 'Recent searches';

  @override
  String get clearAllHistory => 'Clear all history';

  @override
  String get someThingWentWrong => 'Something went wrong.';

  @override
  String get addThumbnail => 'Add thumbnail';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get someError => 'Some error';

  @override
  String get product => 'Product';

  @override
  String get delivery => 'Delivery';

  @override
  String get other => 'Other';

  @override
  String get loginAndSignUp => 'Login and sign up';

  @override
  String get youNeedToLoginToAccessThisContent => 'You need to login to access this content';

  @override
  String get goToLoginPage => 'Go to login page';

  @override
  String get pleaseLoginToViewRegisteredInformation => 'Please login to view registered information. Would you like to log in?';

  @override
  String get alertProductAddedToCart => 'Product added to cart alert';

  @override
  String get orderProduct => 'Order product';

  @override
  String get addressSearch => 'Address search';

  @override
  String totalPrice(Object price, Object totalProduct) {
    return 'Total $totalProduct items $price KRW';
  }

  @override
  String totalPriceWithoutNumber(double price) {
    final intl.NumberFormat priceNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String priceString = priceNumberFormat.format(price);

    return 'Pay $priceString KRW';
  }

  @override
  String get orderProductAgree => 'I have checked the product name, price, and delivery information of the product to be ordered, and agree to purchase it.';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get leaveAComment => 'Leave a comment';

  @override
  String get replyingTo => 'Replying to: ';

  @override
  String get editingComment => 'Editing comment...';

  @override
  String get noFollowers => 'No followers';

  @override
  String get noFollowings => 'No followings';

  @override
  String get paymentFailedMessage => 'Payment failed.\nPlease try again.';

  @override
  String get paymentSuccessMessage => 'Payment completed.\nThank you for your order.';

  @override
  String get apply => 'Apply';

  @override
  String get noPostDisplayed => 'No post displayed.';

  @override
  String get urlInvalid => 'Invalid URL.';

  @override
  String get copiedToClipboard => 'Copied to clipboard.';

  @override
  String get invalidEmailFormat => 'Invalid email format';

  @override
  String get areYouSureYouWantToUnregister => 'Are you sure you want to unregister?';

  @override
  String get areYouSureYouWantToDelete => 'Are you sure you want to delete?';

  @override
  String get inquiryCategory => 'Inquiry category';

  @override
  String get answerComplete => 'Answer complete';

  @override
  String get emptyList => 'Empty';

  @override
  String get savePostSuccess => 'Post saved successfully';

  @override
  String get unconfirmed => 'Unconfirmed';

  @override
  String get confirmed => 'Confirmed';

  @override
  String get delivered => 'Delivered';

  @override
  String get informationSupplement => 'Infomation supplement';

  @override
  String get commentMyPost => 'Comment';

  @override
  String get followingUploadPost => 'New post';

  @override
  String get reactMyPost => 'Reaction';

  @override
  String get shareSuccessfully => 'Shared successfully';

  @override
  String get daddrs1000 => 'Address not found.';

  @override
  String get aa1000 => 'user not found';

  @override
  String get aa1001 => 'access denied';

  @override
  String get aa1002 => 'access token expired';

  @override
  String get aa1003 => 'refresh token expired';

  @override
  String get aa1004 => 'session token expired';

  @override
  String get aa1005 => 'token invalid';

  @override
  String get aa1006 => 'google id token invalid';

  @override
  String get aa1007 => 'can\'t send otp';

  @override
  String get aa1008 => 'otp expired';

  @override
  String get aa1009 => 'otp not match';

  @override
  String get aa1010 => 'auth method not supported for this user';

  @override
  String get aa1011 => 'Kakao token invalid';

  @override
  String get aa1012 => 'Naver token invalid';

  @override
  String get a1001 => 'internal server error';

  @override
  String get a1002 => 'invalid request data';

  @override
  String get a1003 => 'request method not supported';

  @override
  String get dcrt1000 => 'Cart not found';

  @override
  String get dcrt1001 => 'Product quantity must be less than or equal to the quantity in stock';

  @override
  String get dc1000 => 'can\'t add sub-category of second depth category';

  @override
  String get dc1001 => 'category not allow adding sub-category';

  @override
  String get dc1002 => 'category type not correct';

  @override
  String get dc1003 => 'can\'t delete category';

  @override
  String get dc1004 => 'can\'t change category name';

  @override
  String get dc1005 => 'category not found';

  @override
  String get dcmt1000 => 'Comment not found';

  @override
  String get dcmt1001 => 'Parent comment not found';

  @override
  String get dcmt1002 => 'Do not have permission to edit';

  @override
  String get dcmt1003 => 'Can not reply hidden comment';

  @override
  String get dfvrcate1000 => 'Favorite category accept parent category only.';

  @override
  String get af1000 => 'uploaded file name is invalid';

  @override
  String get af1001 => 'file type not supported';

  @override
  String get af1002 => 'file parsing error';

  @override
  String get dfile1000 => 'File not found';

  @override
  String get dfl1000 => 'You can not follow yourself';

  @override
  String get dfl1001 => 'You can not unfollow yourself';

  @override
  String get dl1005 => 'locale not supported';

  @override
  String get dmp1000 => 'Main page not found';

  @override
  String get dntf1000 => 'Notification not found';

  @override
  String get dntfs1000 => 'Notification setting not found';

  @override
  String get dordd1000 => 'Order detail not found';

  @override
  String get aods1 => 'Order Detail Session not found';

  @override
  String get dord1000 => 'Order fail';

  @override
  String get dord1001 => 'Order not found';

  @override
  String get dord1002 => 'Order does not belong to this user';

  @override
  String get dord1003 => 'Order only cancel in order status : UNCONFIRMED - CONFIRMED';

  @override
  String get dord1004 => 'Order only cancel in order status : UNCONFIRMED - CONFIRMED - DELIVERING';

  @override
  String get dord1005 => 'Admin only change Order status follow this : UNCONFIRMED -> CONFIRMED -> DELIVERING -> DELIVERED';

  @override
  String get dord1006 => 'Admin only refund Order status follow this : CANCEL -> REFUND';

  @override
  String get dord1007 => 'Refund fail';

  @override
  String get aos1 => 'Order Session not found';

  @override
  String get aos2 => 'Product quantity must be less than or equal to the quantity in stock';

  @override
  String get dpst1000 => 'post not found';

  @override
  String get dpst1001 => 'Post accept child category only';

  @override
  String get dpst1002 => 'Post accept parent category only';

  @override
  String get dpst1003 => 'Post category do not match';

  @override
  String get dpst1004 => 'Post parent category is required';

  @override
  String get dprd1000 => 'product not found';

  @override
  String get dpu1000 => 'Profile Url not found';

  @override
  String get dqa1000 => 'QnA not found';

  @override
  String get dqa1001 => 'Other people\'s qna cannot be deleted';

  @override
  String get drt1000 => 'Rating not found';

  @override
  String get drt1001 => 'Other people\'s reviews cannot be deleted';

  @override
  String get drct1000 => 'Reaction not found';

  @override
  String get dsf1000 => 'Shipping Fee not found';

  @override
  String get dsm1000 => 'Social media not found';

  @override
  String get au1000 => 'user not found';

  @override
  String get du1001 => 'invalid email format';

  @override
  String get du1002 => 'invalid phone number format';

  @override
  String get du1003 => 'user type does not allow password';

  @override
  String get du1004 => 'user already have referred user';

  @override
  String get du1005 => 'wrong password';

  @override
  String get du1006 => 'invalid password format';

  @override
  String get du1007 => 'invalid username format';

  @override
  String get du1008 => 'duplicate username';

  @override
  String get du1009 => 'duplicate email';

  @override
  String get du1010 => 'duplicate user phone number';

  @override
  String get du1011 => 'can\'t change email of social user';

  @override
  String get du1012 => 'can\'t change phone number of social user';

  @override
  String get du1013 => 'user not finished registration';

  @override
  String get du1014 => 'user not need information supplement';

  @override
  String get du1015 => 'user role not sufficient';

  @override
  String get du1016 => 'user not found';

  @override
  String get du1017 => 'can not deactivate system account';

  @override
  String get sw101 => 'The issued unique key does not exist';

  @override
  String get sw102 => 'Expired key';

  @override
  String get sw103 => 'Exceeded key usage limit';

  @override
  String get sw104 => 'Invalid invoice number or courier code input';

  @override
  String get sw105 => 'Exceeded daily request limit for the same invoice';

  @override
  String get sw106 => 'Error in invoice number inquiry';

  @override
  String get sw500 => 'Server error.';

  @override
  String get dtc1001 => 'term and cond not found';

  @override
  String get connectionFailure => 'can not connect to server. Please try again later';

  @override
  String get timeoutFailure => 'request timeout';

  @override
  String get otherDioFailure => 'some thing went wrong';

  @override
  String get convertDataFailure => 'convert data failure';

  @override
  String get genericFailure => 'generic failure';

  @override
  String get persistentFailure => 'persistent failure';

  @override
  String get recipient => 'recipient';

  @override
  String get address => 'address';

  @override
  String get checkAddressSearch => 'Address search';

  @override
  String get enterDetailedAddress => 'enter detailed address';

  @override
  String get setDefaultAddress => 'Set default address';

  @override
  String get longVideo => 'Long';

  @override
  String get shortVideo => 'Short';

  @override
  String get reaction => 'Reaction';

  @override
  String get viewDetails => 'View details';

  @override
  String get areYouSureYouWantToCancelThisOrder => 'Are you sure you want to cancel this order?';

  @override
  String get deliveryStatus => 'Delivery status';

  @override
  String get waybillNumber => 'Waybill number';

  @override
  String get productAcceptance => 'Product Acceptance';

  @override
  String get productInTransit => 'Product In Transit';

  @override
  String get deliveryArrived => 'Delivery Arrived';

  @override
  String get startDelivery => 'Start Delivery';

  @override
  String get deliveryInformationHasNotBeenUpdated => 'Delivery information has not been updated. Please try again later';

  @override
  String get dicountInvalid => 'Discount cannot exceed 30% of order value';

  @override
  String get payment => 'Payment';

  @override
  String get inquiryHistory => 'Inquiry history';

  @override
  String get answeredInquiry => 'Answered';

  @override
  String get pending => 'Pending';

  @override
  String get small => 'Small';

  @override
  String get normal => 'Normal';

  @override
  String get large => 'Large';

  @override
  String get huge => 'Huge';

  @override
  String get content => 'Content';

  @override
  String get report => 'Report';

  @override
  String get areYouSureToReportThisPost => 'Are you sure want to report this post?';

  @override
  String get areYouSureToReportThisComment => 'Are you sure want to report this comment?';

  @override
  String get areYouSureToReportThisUser => 'Are you sure want to report this user?';

  @override
  String get reportScreen => 'Reported Post, Comment, Profile';

  @override
  String get reportedPost => 'Reported Post';

  @override
  String get reportedComment => 'Reported Comment';

  @override
  String get reportedUser => 'Reported User';

  @override
  String get areYouSureToDeleteThisPost => 'Are you sure want to delete this post?';

  @override
  String get areYouSureToDeleteThisComment => 'Are you sure want to delete this comment?';

  @override
  String get areYouSureToDeleteThisUser => 'Are you sure want to delete this user?';

  @override
  String get cancelOrder => '주문 취소';

  @override
  String get wouldYouLikeSendAnInquiry => 'Would you like to send us an inquiry?';

  @override
  String get wouldYouLikeUploadPost => 'Would you like to upload the post?';

  @override
  String get wouldYouLikeUploadAReview => 'Would you like to upload a review?';

  @override
  String get all => 'All';
}
