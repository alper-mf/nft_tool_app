import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

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
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: widget ??
                    SizedBox(
                      height: SizeConfig.height / 2,
                      child: const Center(
                        child: Text('Not added any widget from here'),
                      ),
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
