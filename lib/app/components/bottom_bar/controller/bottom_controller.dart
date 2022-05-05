import 'package:get/get.dart';

class BottomAppbarController extends GetxController {
  RxInt page = 0.obs;

  void setPageIndex(int index) {
    page.value = index;
  }
}
