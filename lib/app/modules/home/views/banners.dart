import 'package:atelyam/constants/cards/banner_card.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Banners extends StatefulWidget {
  const Banners({
    super.key,
  });

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool sizeValue = size.width >= 800 ? true : false;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, count) {
            return const BannerCard();
          },
          options: CarouselOptions(
            onPageChanged: (index, CarouselPageChangedReason a) {
              selectedIndex = index;
              setState(() {});
            },
            height: 220,
            viewportFraction: 1.0,
            autoPlay: true,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 2000),
          ),
        ),
        dots(sizeValue),
      ],
    );
  }

  SizedBox dots(bool sizeValue) {
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
              height: selectedIndex == index
                  ? sizeValue
                      ? 22
                      : 16
                  : sizeValue
                      ? 16
                      : 10,
              width: selectedIndex == index
                  ? sizeValue
                      ? 21
                      : 15
                  : sizeValue
                      ? 16
                      : 10,
              decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.transparent : kSecondaryColor,
                shape: BoxShape.circle,
                border: selectedIndex == index
                    ? Border.all(
                        color: kPrimaryColor,
                        width: 3,
                      )
                    : Border.all(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
