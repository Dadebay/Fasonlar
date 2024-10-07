import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import 'constants.dart';

SnackbarController showSnackBar(String title, String subtitle, Color color) {
  if (SnackbarController.isSnackbarBeingShown) {
    SnackbarController.cancelAllSnackbars();
  }
  return Get.snackbar(
    title,
    subtitle,
    snackStyle: SnackStyle.FLOATING,
    titleText: title == ''
        ? const SizedBox.shrink()
        : Text(
            title.tr,
            style: const TextStyle(fontFamily: gilroySemiBold, fontSize: 18, color: Colors.white),
          ),
    messageText: Text(
      subtitle.tr,
      style: const TextStyle(fontFamily: gilroyRegular, fontSize: 16, color: Colors.white),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: color,
    borderRadius: 20.0,
    duration: const Duration(milliseconds: 800),
    margin: const EdgeInsets.all(8),
  );
}

Center spinKit() {
  return Center(
    child: Lottie.asset(loadingLottie, width: 70, height: 70),
  );
}

Center errorData() {
  return const Center(
    child: Text("Error data"),
  );
}

Center emptyData() {
  return Center(
      child: Text(
    "noProduct".tr,
    style: const TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 20),
  ));
}

Widget pattern(final int index) {
  return Image.asset('assets/patterns/patterns_2.png', height: Get.size.height, width: Get.size.width, fit: BoxFit.cover);
}

Positioned appBarWidget({required String name, required Widget icon}) {
  return Positioned(
      top: 40,
      left: 15,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: gilroySemiBold),
          ),
          icon
        ],
      ));
}

SliverLayoutBuilder appBar({required String title, required double height, required Widget actionIcon, required Widget flexible}) {
  return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
    final scrolled = constraints.scrollOffset > height - 40;
    return SliverAppBar(
      expandedHeight: height,
      floating: false,
      pinned: true,
      backgroundColor: scrolled ? Colors.transparent.withOpacity(0.6) : Colors.transparent,
      title: Text(
        title.tr,
        style: const TextStyle(color: Colors.white, fontFamily: gilroySemiBold),
      ),
      flexibleSpace: FlexibleSpaceBar(background: flexible),
      actions: [actionIcon],
    );
  });
}

Widget listViewName(String text, bool icon, Size size, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 35, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text.tr,
            style: TextStyle(color: Colors.black, fontSize: size.width >= 800 ? 30 : 22, fontFamily: gilroyBold),
          ),
          icon
              ? Icon(
                  IconlyBroken.arrow_right_circle,
                  color: Colors.black,
                  size: size.width >= 800 ? 35 : 25,
                )
              : const SizedBox.shrink(),
        ],
      ),
    ),
  );
}
