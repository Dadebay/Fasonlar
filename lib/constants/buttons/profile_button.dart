// ignore_for_file: file_names

import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProfilButton extends StatelessWidget {
  final String name;
  final Function() onTap;
  final Widget icon;
  final bool? lang;
  const ProfilButton({
    required this.name,
    required this.onTap,
    required this.icon,
    super.key,
    this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: ListTile(
        onTap: onTap,
        tileColor: kGreyColor2,
        shape: const RoundedRectangleBorder(borderRadius: borderRadius15),
        minVerticalPadding: 23,
        title: Text(
          name.tr,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(color: Colors.black, fontFamily: gilroyMedium),
        ),
        leading: lang == true
            ? Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(color: kThirdColor.withOpacity(0.2), border: Border.all(color: kSecondaryColor.withOpacity(0.4), width: 1), borderRadius: BorderRadius.circular(18)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    Get.locale!.languageCode == 'tm'
                        ? tmIcon
                        : Get.locale!.languageCode == 'ru'
                            ? ruIcon
                            : engIcon,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: kThirdColor.withOpacity(0.2), border: Border.all(color: kSecondaryColor.withOpacity(0.3), width: 1), borderRadius: BorderRadius.circular(18)),
                child: icon,
              ),
        trailing: const Icon(IconlyLight.arrow_right_circle, color: kPrimaryColor),
      ),
    );
  }
}
