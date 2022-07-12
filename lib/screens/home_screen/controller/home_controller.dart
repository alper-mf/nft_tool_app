import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/bottom_bar/controller/bottom_controller.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController? animationController;
  final PageController pageController = PageController();
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  //Current Context
  BuildContext get context => scaffoldKey.currentContext!;

  RxDouble? offset = 0.0.obs;
  RxInt? page = 0.obs;
  HomeController() {
    init();
  }

  Future<void> init() async {
    ///AnimationController init
    animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);
  }

  late final Animation<AlignmentGeometry> animation = Tween<AlignmentGeometry>(
    begin: Get.find<BottomAppbarController>().page.value == 0
        ? Alignment.topRight
        : Get.find<BottomAppbarController>().page.value == 1
            ? Alignment.bottomLeft
            : Get.find<BottomAppbarController>().page.value == 2
                ? Alignment.bottomCenter
                : Get.find<BottomAppbarController>().page.value == 3
                    ? Alignment.bottomRight
                    : Alignment.topRight,
    end: Get.find<BottomAppbarController>().page.value == 0
        ? Alignment.bottomLeft
        : Get.find<BottomAppbarController>().page.value == 1
            ? Alignment.bottomCenter
            : Get.find<BottomAppbarController>().page.value == 2
                ? Alignment.bottomRight
                : Get.find<BottomAppbarController>().page.value == 3
                    ? Alignment.topRight
                    : Alignment.bottomLeft,
  ).animate(
    CurvedAnimation(
      parent: animationController!,
      curve: Curves.linear,
    ),
  );
}
