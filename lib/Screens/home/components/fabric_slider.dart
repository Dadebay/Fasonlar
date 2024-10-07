import 'package:atelyam/CustomWidgets/listviewName_tile.dart';
import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column matalar() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      listViewName("Matalar", true, Get.size, () {}),
      SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 220,
              margin: const EdgeInsets.only(left: 15),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: AppBorders.borderRadius30,
                      child: Image.asset(
                        'assets/matalar/${index + 1}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blackColor.withOpacity(0.1),
                        borderRadius: AppBorders.borderRadius30,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Matalaryn atlary",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: gilroySemiBold,
                            height: 1.0,
                            fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
