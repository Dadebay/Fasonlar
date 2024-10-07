import 'package:atelyam/constants/buttons/profile_button.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:atelyam/constants/customWidget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  ProfilView({super.key});
  List names = ['profil', 'settings', 'lang', 'aboutUs', 'login'];
  List icons = [
    IconlyLight.profile,
    IconlyLight.setting,
    IconlyLight.setting,
    IconlyLight.info_square,
    IconlyLight.login,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, child: pattern(1)),
          CustomScrollView(
            slivers: <Widget>[
              appBar(
                title: 'profil',
                height: 350,
                actionIcon: IconButton(
                  icon: const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        IconlyLight.more_circle,
                        size: 30,
                        color: Colors.white,
                      )),
                  onPressed: () {},
                ),
                flexible: flexSpace(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                  child: ListView.builder(
                    itemCount: names.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ProfilButton(
                          name: index == 2
                              ? Get.locale!.languageCode == 'tm'
                                  ? "Türkmen dili"
                                  : Get.locale!.languageCode == 'ru'
                                      ? 'Русский язык'
                                      : "Englih"
                              : names[index],
                          lang: index == 2 ? true : false,
                          onTap: () {},
                          icon: Icon(
                            icons[index],
                            color: kSecondaryColor,
                          ));
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  height: Get.size.height / 8,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Column flexSpace() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 62,
            child: CircleAvatar(
              radius: 60,
              child: Image.asset(
                'assets/icons/user3.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Gurbanow Dadebay",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontFamily: gilroySemiBold, fontSize: 20),
          ),
        ),
        const Text(
          "+993-62-99-03-44",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white70, fontFamily: gilroyMedium, fontSize: 15),
        )
      ],
    );
  }
}
