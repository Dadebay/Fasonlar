import 'package:atelyam/Screens/home/homeScreen_controller.dart';
import 'package:atelyam/config/theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({super.key});
  final HomeScreenController _homeController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool sizeValue = size.width >= 800 ? true : false;
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, count) {
              return const BannerCard();
            },
            options: CarouselOptions(
              onPageChanged: (index, CarouselPageChangedReason value) {
                _homeController.bannerChange(index: index);
              },
              height: 220,
              viewportFraction: 1.0,
              autoPlay: true,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
            ),
          ),
          dots(sizeValue, _homeController),
        ],
      ),
    );
  }

  SizedBox dots(bool sizeValue, HomeScreenController controller) {
    return SizedBox(
      height: sizeValue ? 40 : 20,
      width: Get.size.width,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: sizeValue ? 8 : 4),
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              height: controller.selectedIndex.value == index
                  ? sizeValue
                      ? 22
                      : 16
                  : sizeValue
                      ? 16
                      : 10,
              width: controller.selectedIndex.value == index
                  ? sizeValue
                      ? 21
                      : 15
                  : sizeValue
                      ? 16
                      : 10,
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == index
                    ? Colors.transparent
                    : AppColors.kSecondaryColor,
                shape: BoxShape.circle,
                border: controller.selectedIndex.value == index
                    ? Border.all(
                        color: AppColors.kPrimaryColor,
                        width: 3,
                      )
                    : Border.all(color: AppColors.whiteColor),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {},
      child: Container(
        margin: const EdgeInsets.all(8),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: AppBorders.borderRadius20,
          boxShadow: [
            BoxShadow(
              color: AppColors.kThirdColor.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: AppBorders.borderRadius20,
            child: Image.asset(
              'assets/patterns/patterns.png',
              fit: BoxFit.cover,
            )
            //  CachedNetworkImage(
            //   fadeInCurve: Curves.ease,
            //   imageUrl: '$serverURL/${model.destination!}-mini.webp',
            //   imageBuilder: (context, imageProvider) => Container(
            //     width: size.width,
            //     decoration: BoxDecoration(
            //       borderRadius: borderRadius20,
            //       image: DecorationImage(
            //         image: imageProvider,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            //   placeholder: (context, url) => spinKit(),
            //   errorWidget: (context, url, error) => noBannerImage(),
            // ),
            ),
      ),
    );
  }
}
