import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController with GetSingleTickerProviderStateMixin {
  RxBool iconVisibility = false.obs;
  late AnimationController? animationController;
  late TextEditingController? searchbarTextEditingController;

  SearchBarController(TextEditingController textEditingController) {
    searchbarTextEditingController = textEditingController;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  void cleanButtonTap() {
    searchbarTextEditingController!.clear();
    iconAnimationTrigger();
  }

  void iconAnimationTrigger() {
    if (searchbarTextEditingController!.text.isNotEmpty) {
      iconVisibility.value = true;
      iconAnimationController();
    } else {
      iconVisibility.value = false;
      iconAnimationController();
    }
  }

  void iconAnimationController() {
    if (iconVisibility.value) {
      animationController!.forward();
    } else {
      animationController!.reverse();
    }
  }
}
