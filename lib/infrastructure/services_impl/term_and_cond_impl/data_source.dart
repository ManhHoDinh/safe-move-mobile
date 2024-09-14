import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../application/services/term_and_condition/dto/dto.dart';
import '../../../application/services/term_and_condition/term_and_condition.dart';

part 'data_source.g.dart';

@RestApi()
abstract class TermAndCondDataSource {
  factory TermAndCondDataSource(Dio dio, {String baseUrl}) =
      _TermAndCondDataSource;

  @GET('/v1/term-and-cond/published')
  Future<TermAndCondResponse> getTermAndCond(
      {@Query('termType') TermType? termType});
}
