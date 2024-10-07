import 'package:atelyam/Screens/bottomnavbar/bottomnavbar.dart';
import 'package:atelyam/Config/routes/routes.dart';
import 'package:atelyam/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: TRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: TRoutes.bottomNavBar,
      page: () => BottomNavBar(),
    )
  ];
}
