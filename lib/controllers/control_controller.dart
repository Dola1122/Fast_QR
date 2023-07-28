import 'package:get/get.dart';

class ControlController extends GetxController {
  int currentIndex = 0;

  void changeTabIndex(int newIndex) {
    currentIndex = newIndex;
    update();
  }
}
