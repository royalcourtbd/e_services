import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 3.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
