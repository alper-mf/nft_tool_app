import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/screens/home_screen/controller/home_controller.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: const [
          _GreenGlowLight(),
          GlassContainer(),
        ],
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
      ),
    );
  }
}

class _GreenGlowLight extends GetView<HomeController> {
  const _GreenGlowLight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AlignTransition(
        alignment: controller.animation,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.page!.value == 0
                ? Colors.green.withOpacity(0.5)
                : controller.page!.value == 1
                    ? Colors.blue.withOpacity(0.5)
                    : controller.page!.value == 2
                        ? Colors.yellow.withOpacity(0.5)
                        : controller.page!.value == 3
                            ? Colors.red.withOpacity(0.5)
                            : Colors.transparent,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
            child: Container(
              height: 150,
              width: 150,
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
