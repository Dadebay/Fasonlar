import 'package:atelyam/app/modules/discovery/views/discovery_view.dart';
import 'package:atelyam/app/modules/favorites/views/favorites_view.dart';
import 'package:atelyam/app/modules/home/views/home_view.dart';
import 'package:atelyam/app/modules/profil/views/profil_view.dart';
import 'package:atelyam/constants/customWidget/constants.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

enum _SelectedTab { home, explore, heart, person }

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedIndex = i;
      _selectedTab = _SelectedTab.values[i];
    });
  }

  List pages = [HomeView(), DiscoveryView(), const FavoritesView(), ProfilView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          indicatorColor: kThirdColor,
          splashBorderRadius: 18,
          splashColor: kSecondaryColor,
          selectedItemColor: kThirdColor,
          unselectedItemColor: Colors.grey.shade200,
          outlineBorderColor: kPrimaryColor,
          marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          paddingR: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          enablePaddingAnimation: true,
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          backgroundColor: kPrimaryColor,
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.discovery,
              unselectedIcon: IconlyLight.discovery,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.profile,
              unselectedIcon: IconlyLight.profile,
            ),
          ],
        ),
      ),
    );
  }
}
