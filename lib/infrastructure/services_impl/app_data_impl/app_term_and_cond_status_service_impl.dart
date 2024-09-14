import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/failures/persistent/persistent.dart';
import '../../../application/services/app/app_data/app_term_and_cond_status_service.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';

class AppTermAndCondStatusServiceImpl with AppTermAndCondStatusService {
  const AppTermAndCondStatusServiceImpl(
    this.preferences,
  );

  final SharedPreferences preferences;
  static const _haveReadTermAndCond = 'SM-term-and-cond-read-status';

  @override
  Future<Result<Failure, bool>> haveReadTermAndCondYet() async {
    try {
      final bool? haveReadYet = preferences.getBool(_haveReadTermAndCond);
      return Right(haveReadYet ?? false);
    } catch (err) {
      return const Left(PersistentWriteFailure());
    }
  }

  @override
  Future<Result<Failure, void>> markHaveReadTermAndCond() async {
    try {
      await preferences.setBool(_haveReadTermAndCond, true);
      return const Right(null);
    } catch (err) {
      return const Left(PersistentWriteFailure());
    }
  }
}
