import 'dart:ui';

import 'package:flutter/material.dart';

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
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(radius)),
              child: widget)),
    );
  }
}
