import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  void bannerChange({required int index}) {
    selectedIndex.value = index;
  }
}
