import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: kThirdColor.withOpacity(0.6), borderRadius: borderRadius15),
      child: const Icon(
        IconlyLight.heart,
        color: Colors.white,
      ),
    );
  }
}
