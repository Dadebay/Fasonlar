import 'package:atelyam/Screens/bottomnavbar/bottomnavbar_controller.dart';
import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final BottomNavBarController _bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.whiteColor,
        body: bottomNavBarList[_bottomNavBarController.selectedIndex.value]
            ['screen'],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CrystalNavigationBar(
            indicatorColor: AppColors.kThirdColor,
            splashBorderRadius: 18,
            splashColor: AppColors.kSecondaryColor,
            selectedItemColor: AppColors.kThirdColor,
            unselectedItemColor: Colors.grey.shade200,
            outlineBorderColor: AppColors.kPrimaryColor,
            marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            paddingR: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            enablePaddingAnimation: true,
            currentIndex: _bottomNavBarController.selectedIndex.value,
            backgroundColor: AppColors.kPrimaryColor,
            onTap: (index) => _bottomNavBarController.changeIndex(index: index),
            items: List.generate(
              bottomNavBarList.length,
              (index) => CrystalNavigationBarItem(
                icon: bottomNavBarList[index]['iconBold'],
                unselectedIcon: bottomNavBarList[index]['icon'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
