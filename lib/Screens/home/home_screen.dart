import 'package:atelyam/CustomWidgets/custom_animations.dart';
import 'package:atelyam/Screens/home/components/app_bar.dart';
import 'package:atelyam/Screens/home/components/banner_slider.dart';
import 'package:atelyam/Screens/home/components/category_slider.dart';
import 'package:atelyam/Screens/home/components/fabric_slider.dart';
import 'package:atelyam/Screens/home/components/products_slider.dart';
import 'package:atelyam/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomAnimations.pattern(1),
        CustomScrollView(
          slivers: <Widget>[
            appbar(),
            SliverToBoxAdapter(
                child: Container(
              height: 1500,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  children: [
                    BannerSlider(),
                    categories(),
                    products(size: Get.size, index: 1, add: 5),
                    matalar(),
                    products(size: Get.size, index: 2, add: 10),
                    products(size: Get.size, index: 3, add: 15),
                    Container(
                      height: 1000,
                      color: AppColors.whiteColor,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ],
    ));
  }
}
