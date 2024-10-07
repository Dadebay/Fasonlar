import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:flutter/material.dart';

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
          borderRadius: borderRadius20,
          boxShadow: [
            BoxShadow(
              color: kThirdColor.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: borderRadius20,
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
