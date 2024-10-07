import 'package:atelyam/constants/cards/discovery_card.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:atelyam/constants/customWidget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoriteController> {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        pattern(1),
        appBarWidget(
            name: 'favorites'.tr,
            icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyLight.delete,
                  color: Colors.white,
                  size: 30,
                ))),
        Positioned.fill(
          top: 100,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white, borderRadius: borderRadius30),
            child: ClipRRect(
              borderRadius: borderRadius30,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) => DiscoveryCard(
                  homePageStyle: false,
                  image: 'assets/fasonlar/${index + 10}.webp',
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2.5 : 2),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
