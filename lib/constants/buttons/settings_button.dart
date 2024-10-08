// ignore_for_file: file_names

import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingButton extends StatelessWidget {
  final String name;
  final Function() onTap;
  final Widget icon;
  const SettingButton({
    required this.name,
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: 23,
      title: Text(
        name.tr,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(color: Colors.black, fontFamily: gilroyMedium),
      ),
      trailing: icon,
    );
  }
}
