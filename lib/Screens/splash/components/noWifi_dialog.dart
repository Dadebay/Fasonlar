import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void networkDialog(BuildContext context, {required VoidCallback onTap}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: AppBorders.borderRadius20),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: AppBorders.borderRadius20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'noConnection1'.tr,
                    style: TextStyle(
                        fontSize: 24.0,
                        color: AppColors.kPrimaryColor,
                        fontFamily: gilroyMedium),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(
                      'noConnection2'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: gilroyMedium,
                          fontSize: 16.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Future.delayed(const Duration(milliseconds: 1000), onTap);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: AppBorders.borderRadius10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                    ),
                    child: Text(
                      'noConnection3'.tr,
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.whiteColor,
                          fontFamily: gilroyMedium),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: AppColors.whiteColor,
              maxRadius: 70,
              minRadius: 60,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.whiteColor),
                child: ClipRRect(
                  child: Image.asset(noWifi, fit: BoxFit.fill),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
