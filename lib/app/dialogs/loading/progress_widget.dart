import 'package:flutter/material.dart';

class LoadingProgressWidget extends StatelessWidget {
  const LoadingProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
