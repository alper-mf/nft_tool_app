import 'dart:ui';

import 'package:flutter/material.dart';

class GlassWidget extends StatelessWidget {
  final double sigma;
  final double radius;
  final Widget widget;
  final double? padding;
  final Color? color;
  const GlassWidget(
      {Key? key,
      required this.sigma,
      required this.radius,
      required this.widget,
      this.padding,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: padding ?? 32),
              decoration: BoxDecoration(
                  color: color ?? Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(radius)),
              child: widget)),
    );
  }
}
