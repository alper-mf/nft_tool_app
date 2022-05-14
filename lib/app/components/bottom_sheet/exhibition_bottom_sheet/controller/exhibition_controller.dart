import 'package:get/get.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'dart:math' as math;

class ExhibitionSheetController extends GetxController with GetTickerProviderStateMixin {
  late final BuildContext currentContext;

  final RxDouble minHeight = 120.0.obs;
  final RxDouble iconStartSize = 44.0.obs;
  final RxDouble iconEndSize = 120.0.obs;
  final RxDouble iconStartMarginTop = 36.0.obs;
  final RxDouble iconEndMarginTop = 80.0.obs;
  final RxDouble iconsVerticalSpacing = 24.0.obs;
  final RxDouble iconsHorizontalSpacing = 16.0.obs;

  late AnimationController animationController;

  ExhibitionSheetController([BuildContext? context]) {
    currentContext = context!;
  }

  double get maxHeight => SizeConfig.height;

  double? lerp(double min, double max) => lerpDouble(min, max, animationController.value);
  double? get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(currentContext).padding.top); //<-- Add new property

  double? get headerFontSize => lerp(14, 24);

  double? get itemBorderRadius => lerp(8, 24); //<-- increase item border radius

  double? get iconSize => lerp(iconStartSize.value, iconEndSize.value); //<-- increase icon size

  double? iconTopMargin(int index) =>
      lerp(iconStartMarginTop.value,
          iconEndMarginTop.value + index * (iconsVerticalSpacing.value + iconEndSize.value))! +
      headerTopMargin!; //<-- calculate top margin based on header margin, and size of all of icons above (from small to big)

  double? iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing.value + iconStartSize.value), 0); //

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  void toggle() {
    final bool isOpen = animationController.status == AnimationStatus.completed;
    animationController.fling(
        velocity: isOpen ? -2 : 2); //<-- ...snap the sheet in proper direction
  }

  //***DRAG DROP *//
  void handleDragUpdate(DragUpdateDetails details) {
    animationController.value -= (details.primaryDelta! /
        maxHeight); //<-- Update the animationController.value by the movement done by user.
  }

  void handleDragEnd(DragEndDetails details) {
    if (animationController.isAnimating ||
        animationController.status == AnimationStatus.completed) {
      return;
    }

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0) {
      animationController.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      animationController.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      animationController.fling(velocity: animationController.value < 0.5 ? -2.0 : 2.0);
    } //<-- or just continue to whichever edge is closer
  }
}
