// ignore_for_file: file_names, must_be_immutable

import 'package:atelyam/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../customWidget/constants.dart';

class AgreeButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  AgreeButton({super.key, required this.onTap, required this.text});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: animatedContaner());
  }

  Widget animatedContaner() {
    return Obx(() {
      return AnimatedContainer(
        decoration: const BoxDecoration(borderRadius: borderRadius20, color: kPrimaryColor),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: homeController.agreeButton.value ? 0 : 10),
        width: homeController.agreeButton.value ? 60 : Get.size.width,
        duration: const Duration(milliseconds: 800),
        child: homeController.agreeButton.value
            ? const Center(
                child: SizedBox(
                  width: 34,
                  height: 29,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                text.tr,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontFamily: gilroyBold, fontSize: 22),
              ),
      );
    });
  }
}
