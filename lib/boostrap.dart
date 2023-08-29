import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getjoke/core/di/di.dart';
import 'package:getjoke/core/network/http_request/api_service/api_service.dart';
import 'package:getjoke/features/home/cubit/home_cubit.dart';
import 'package:getjoke/get_joke_app.dart';

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  //To handle http request for old android models
  HttpOverrides.global = MyHttpOverrides();

  await setupDi();

  configLoading();
  //Network
  ApiService().initialLizeNetworkSetting();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    Future.delayed(const Duration(seconds: 1), () {
      runApp(MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()..init(),
          ),
        ],
        child: const GetJokeApp(),
      ));
    });
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
