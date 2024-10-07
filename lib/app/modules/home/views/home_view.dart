import 'package:atelyam/app/modules/home/controllers/home_controller.dart';
import 'package:atelyam/app/modules/home/views/banners.dart';
import 'package:atelyam/constants/cards/discovery_card.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:atelyam/constants/customWidget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  List categoriesList = [
    'Matalar',
    'Fasonlar 2024',
    'Gündelik Köýnekler',
    'Owadan köýnekler',
    'Toý köýnekleri',
    'Ipekler',
    'Özünden gülli gülýüpek',
    'Flamaster',
    'Nagyşly',
    'Tomus köýnekler',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        pattern(1),
        CustomScrollView(
          slivers: <Widget>[
            appbar(),
            SliverToBoxAdapter(
                child: Container(
              height: 1500,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  children: [
                    const Banners(),
                    categories(),
                    products(size: Get.size, index: 1, add: 5),
                    matalar(),
                    products(size: Get.size, index: 2, add: 10),
                    products(size: Get.size, index: 3, add: 15),
                    Container(
                      height: 1000,
                      color: Colors.white,
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
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Category name",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, height: 1.0, fontSize: 14),
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
                        borderRadius: borderRadius30,
                        child: Image.asset(
                          'assets/matalar/${index + 1}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: borderRadius30,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(
                          "Matalaryn atlary",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontFamily: gilroySemiBold, height: 1.0, fontSize: 22),
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

  Widget products({
    required Size size,
    required int index,
    required int add,
  }) {
    return Wrap(
      children: [
        listViewName(categoriesList[index], true, size, () {}),
        SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 10,
              itemExtent: 220,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return DiscoveryCard(
                  homePageStyle: true,
                  image: 'assets/fasonlar/${index + add}.webp',
                );
              },
            )),
      ],
    );
  }

  SliverLayoutBuilder appbar() {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      final scrolled = constraints.scrollOffset > 10;
      return SliverAppBar(
        expandedHeight: 60,
        floating: false,
        pinned: true,
        collapsedHeight: 70,
        backgroundColor: scrolled ? Colors.transparent.withOpacity(0.4) : Colors.transparent,
        title: Text(
          'home'.tr,
          style: const TextStyle(color: Colors.white, fontFamily: gilroySemiBold),
        ),
      );
    });
  }
}
