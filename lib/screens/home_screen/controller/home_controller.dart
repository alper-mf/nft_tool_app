import 'package:flutter/material.dart';
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
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);

    ///PageController init
    pageController.addListener(() {
      offset!.value = pageController.offset;
      page!.value = pageController.page!;
    });
  }

  late final Animation<AlignmentGeometry> animation = Tween<AlignmentGeometry>(
    begin: page!.value == 0
        ? Alignment.topRight
        : page!.value == 1
            ? Alignment.bottomLeft
            : page!.value == 2
                ? Alignment.bottomCenter
                : page!.value == 3
                    ? Alignment.bottomRight
                    : Alignment.topRight,
    end: page!.value == 0
        ? Alignment.bottomLeft
        : page!.value == 1
            ? Alignment.bottomCenter
            : page!.value == 2
                ? Alignment.bottomRight
                : page!.value == 3
                    ? Alignment.topRight
                    : Alignment.bottomLeft,
  ).animate(
    CurvedAnimation(
      parent: animationController!,
      curve: Curves.linear,
    ),
  );
}
