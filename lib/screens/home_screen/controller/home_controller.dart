import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController? animationController;
  final PageController pageController = PageController();

  RxDouble? offset = 0.0.obs;
  RxDouble? page = 0.0.obs;
  HomeController() {
    init();
  }

  Future<void> init() async {
    ///AnimationController init
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    ///PageController init
    pageController.addListener(() {
      offset = pageController.offset.obs;
      page = pageController.page!.obs;
    });
  }
}
