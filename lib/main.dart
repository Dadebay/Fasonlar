import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/routes/app_routes.dart';
import 'package:atelyam/Config/theme/app_theme.dart';
import 'package:atelyam/firebase_options.dart';
import 'package:atelyam/Utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme.lightTheme,
      transitionDuration: const Duration(milliseconds: 500),
      defaultTransition: Transition.fadeIn,
      fallbackLocale: const Locale('tm'),
      locale: storage.read('langCode') != null
          ? Locale(storage.read('langCode'))
          : const Locale('tm'),
      translations: MyTranslations(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: child!,
      ),
      initialRoute: '/',
      getPages: AppRoutes.pages,
    );
  }
}
