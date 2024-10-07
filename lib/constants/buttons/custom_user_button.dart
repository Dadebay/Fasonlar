import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:flutter/material.dart';

class CustomUserButton extends StatelessWidget {
  const CustomUserButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Container(width: 53, height: 53, decoration: const BoxDecoration(color: kGreyColor2, shape: BoxShape.circle), child: child));
  }
}
