import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

Widget listViewName(String text, bool icon, Size size, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 35, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text.tr,
            style: TextStyle(
                color: AppColors.blackColor,
                fontSize: size.width >= 800 ? 30 : 22,
                fontFamily: gilroyBold),
          ),
          icon
              ? Icon(
                  IconlyBroken.arrow_right_circle,
                  color: AppColors.blackColor,
                  size: size.width >= 800 ? 35 : 25,
                )
              : const SizedBox.shrink(),
        ],
      ),
    ),
  );
}
