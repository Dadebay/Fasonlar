import 'package:atelyam/app/modules/search/views/search_view.dart';
import 'package:atelyam/constants/cards/discovery_card.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:atelyam/constants/customWidget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DiscoveryView extends StatelessWidget {
  DiscoveryView({super.key});
  List categories = [
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
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) => DiscoveryCard(
                  image: 'assets/fasonlar/${index + 1}.webp',
                  homePageStyle: false,
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2.7 : 2),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
              ),
            ),
          ],
        ),
      ],
    ));
  }

  SliverLayoutBuilder appbar() {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      final scrolled = constraints.scrollOffset > 100 - 70;
      return SliverAppBar(
        expandedHeight: 110,
        floating: false,
        pinned: true,
        actions: [
          scrolled
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    Get.to(() => const SearchView());
                  },
                  icon: const Icon(
                    IconlyLight.search,
                    color: Colors.white,
                    size: 25,
                  ))
        ],
        backgroundColor: scrolled ? Colors.transparent.withOpacity(0.6) : Colors.transparent,
        title: scrolled
            ? const SizedBox.shrink()
            : Text(
                'Fasonlar'.tr,
                style: const TextStyle(color: Colors.white, fontFamily: gilroySemiBold),
              ),
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: categories.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: kThirdColor.withOpacity(0.8), spreadRadius: 2, blurRadius: 3)],
                      borderRadius: borderRadius10,
                    ),
                    child: Text(
                      categories[index],
                      maxLines: 1,
                      style: const TextStyle(color: kPrimaryColor, fontFamily: gilroyMedium, fontSize: 16),
                    ));
              },
            ),
          ),
        ),
      );
    });
  }
}
