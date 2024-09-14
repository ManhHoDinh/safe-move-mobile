import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';

part 'data_source.g.dart';

@RestApi()
abstract class StatsDataSource {
  factory StatsDataSource(Dio dio, {String baseUrl}) = _StatsDataSource;

  @POST('/v1/stats/visitor')
  Future<SuccessResponse> markUserVisit();
}
