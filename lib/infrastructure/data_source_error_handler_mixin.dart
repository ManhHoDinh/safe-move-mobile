import 'package:dio/dio.dart';

import '../application/failures/data_convert_failure/data_convert_failure.dart';
import '../utilities/failure/failure.dart';
import '../utilities/result/result.dart';
import 'dio_error_converter.dart';

mixin DataSourceErrorHandler {
  Failure convertError(DioException exception) {
    return DioErrorConverter(error: exception).convert();
  }

  Future<Result<Failure, T>> handleApiResult<T>(
      {required Future<T> Function() future}) async {
    try {
      final result = await future();
      return Right(result);
    } on DioException catch (error) {
      return Left(convertError(error));
    } catch (err) {
      return const Left(DataConvertFailure());
    }
  }
}
