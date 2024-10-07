import 'package:atelyam/constants/buttons/fav_button.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:flutter/material.dart';

class DiscoveryCard extends StatelessWidget {
  final String image;
  final bool homePageStyle;

  const DiscoveryCard({super.key, required this.image, required this.homePageStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: homePageStyle == true ? const EdgeInsets.only(left: 20, top: 10, bottom: 10) : EdgeInsets.zero,
        decoration: BoxDecoration(boxShadow: homePageStyle == true ? [] : [BoxShadow(color: kThirdColor.withOpacity(0.8), spreadRadius: 3, blurRadius: 3)], borderRadius: borderRadius25),
        child: ClipRRect(
          borderRadius: borderRadius25,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(top: 10, right: 10, child: FavButton()),
              homePageStyle
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.7), borderRadius: borderRadius20),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Product name",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: kPrimaryColor, fontFamily: gilroySemiBold, fontSize: 16),
                            ),
                            Text(
                              "Anim officia ea excepteur nostrud sed ex ullamco lorem proident ullamco in aliquip minim non dolore sunt officia anim nisi. Aute reprehenderit nisi non velit laboris laborum consequat consequat reprehenderit sed do aute consequat adipiscing enim cupidatat. Mollit qui ad excepteur esse ex ullamco quis sint veniam deserunt officia nostrud.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: kPrimaryColor, fontFamily: gilroyMedium, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ));
  }
}
