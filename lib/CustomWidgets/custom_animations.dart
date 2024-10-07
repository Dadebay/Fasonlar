import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomAnimations {
  static LottieBuilder loadingAnimation =
      Lottie.asset(loadingLottie, width: 70, height: 70);
  static Center get spinKit => Center(
        child: Lottie.asset(loadingLottie, width: 70, height: 70),
      );
  static Center get errorData => const Center(
        child: Text("Error data"),
      );
  static Center get emptyData => Center(
          child: Text(
        "noProduct".tr,
        style: TextStyle(
            color: AppColors.blackColor,
            fontFamily: gilroySemiBold,
            fontSize: 20),
      ));
  static Widget pattern(final int index) {
    return Image.asset(
      'assets/patterns/patterns_$index.png',
      height: Get.size.height,
      width: Get.size.width,
      fit: BoxFit.cover,
    );
  }
}
