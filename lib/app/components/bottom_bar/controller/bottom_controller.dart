import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BottomAppbarController extends GetxController {
  RxInt page = 0.obs;

  void setPageIndex(int index) {
    page.value = index;
  }
}
