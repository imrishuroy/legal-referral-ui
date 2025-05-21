import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/firebase_options.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/core/router/router.dart';
import 'package:legal_referral_ui/src/core/theme/theme.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  getIt<LocalNotificationUtil>().showFlutterNotification(message);
  AppLogger.info('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  await dotenv.load(fileName: 'assets/.env');
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();

  getIt<Dio>().interceptors.addAll([
    AuthInterceptor(
      dio: getIt<Dio>(),
    ),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ),
  ]);
  await SharedPrefs.init();
  // await SharedPrefs.clear();
  AppLogger.init();
  Bloc.observer = const SimpleBlocObserver();

  await getIt<LocalNotificationUtil>().setupLocalNotification();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Legal Referral',
          themeMode: ThemeMode.light,
          theme: LegalReferralTheme.lightTheme,
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
