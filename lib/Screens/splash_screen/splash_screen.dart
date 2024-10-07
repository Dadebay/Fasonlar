import 'dart:io';

import 'package:atelyam/CustomWidgets/custom_animations.dart';
import 'package:atelyam/Screens/splash/components/noWifi_dialog.dart';
import 'package:atelyam/config/routes/routes.dart';
import 'package:atelyam/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 4), () {
          Get.offNamed(TRoutes.bottomNavBar);
        });
      }
    } on SocketException catch (_) {
      networkDialog(context, onTap: () => checkConnection());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(child: CustomAnimations.loadingAnimation));
  }
}
