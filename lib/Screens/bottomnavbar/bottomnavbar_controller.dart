import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndex({final int? index}) {
    selectedIndex.value = index ?? 0;
  }
}
