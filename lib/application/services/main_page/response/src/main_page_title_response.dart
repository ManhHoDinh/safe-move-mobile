import 'package:dart_mappable/dart_mappable.dart';

part 'main_page_title_response.mapper.dart';

@MappableClass()
class MainPageTitleResponse with MainPageTitleResponseMappable {
  const MainPageTitleResponse({
    this.id,
    this.firstTitleKr,
    this.firstTitleEn,
    this.firstTitleCn,
    this.firstTitleJp,
    this.secondTitleKr,
    this.secondTitleEn,
    this.secondTitleCn,
    this.secondTitleJp,
    this.thirdTitleKr,
    this.thirdTitleEn,
    this.thirdTitleCn,
    this.thirdTitleJp,
    this.fourthTitleKr,
    this.fourthTitleEn,
    this.fourthTitleCn,
    this.fourthTitleJp,
  });

  factory MainPageTitleResponse.fromJson(Map<String, dynamic> json) =>
      MainPageTitleResponseMapper.fromJson(json);

  final int? id;
  final String? firstTitleKr;
  final String? firstTitleEn;
  final String? firstTitleCn;
  final String? firstTitleJp;
  final String? secondTitleKr;
  final String? secondTitleEn;
  final String? secondTitleCn;
  final String? secondTitleJp;
  final String? thirdTitleKr;
  final String? thirdTitleEn;
  final String? thirdTitleCn;
  final String? thirdTitleJp;
  final String? fourthTitleKr;
  final String? fourthTitleEn;
  final String? fourthTitleCn;
  final String? fourthTitleJp;
}
