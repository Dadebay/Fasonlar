import 'package:atelyam/CustomWidgets/listviewName_tile.dart';
import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column categories() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      listViewName("categoriesMini", true, Get.size, () {}),
      SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: 5,
          itemExtent: 130,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/category/${index + 1}.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Category name",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: gilroySemiBold,
                          height: 1.0,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
