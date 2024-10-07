import 'package:atelyam/CustomWidgets/listviewName_tile.dart';
import 'package:atelyam/Screens/home/components/discovery_card.dart';
import 'package:atelyam/Config/constants/constants.dart';
import 'package:flutter/material.dart';

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
