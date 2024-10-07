import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SliverLayoutBuilder appbar() {
  return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
    final scrolled = constraints.scrollOffset > 10;
    return SliverAppBar(
      expandedHeight: 60,
      floating: false,
      pinned: true,
      collapsedHeight: 70,
      backgroundColor:
          scrolled ? Colors.transparent.withOpacity(0.4) : Colors.transparent,
      title: Text(
        'home'.tr,
        style:
            TextStyle(color: AppColors.whiteColor, fontFamily: gilroySemiBold),
      ),
    );
  });
}
