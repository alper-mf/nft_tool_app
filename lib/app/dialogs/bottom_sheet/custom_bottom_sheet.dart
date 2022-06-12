import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';

class CBottomSheet {
  static show(
    BuildContext context, [
    Widget? widget,
  ]) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(paddingXS),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(radiusL)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(radiusL)),
                  border: Border.all(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(globalPadding),
                  child: widget,
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      // Get.find<LoginController>().cPhone.value.clear();
    });
  }
}

class GlassWidget extends StatelessWidget {
  final double sigma;
  final double radius;
  final Widget widget;
  const GlassWidget({
    Key? key,
    required this.sigma,
    required this.radius,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration:
                  BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(radius)),
              child: widget)),
    );
  }
}
