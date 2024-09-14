@MappableLib(generateInitializerForScope: InitializerScope.directory)
import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';
import 'firebase_options.dart';
import 'main.init.dart';
import 'presentation/app.dart';
import 'presentation/bases/bloc_utils/observer/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeMappers();
  Provider.debugCheckInvalidValueType = null;
  Bloc.observer = AppBlocObserver();

  final initFirebaseFuture = initFirebase();
  final initDIServiceFuture = initService();

  await Future.wait([
    initFirebaseFuture,
    lockOrientation(),
    initService(),
  ]);

  final diData = await initDIServiceFuture;

  KakaoSdk.init(nativeAppKey: diData.config.kakaoNativeAppKey);

  runApp(SuccessManiaApp(
    data: diData,
  ));
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> lockOrientation() {
  return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Future<AppDIData> initService() {
  final AppDIService appDIService = AppDIService();
  return appDIService.load();
}
