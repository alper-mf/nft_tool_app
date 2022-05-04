import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/bottom_bar/controller/bottom_controller.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/padding_const.dart';

class BottomAppbarView extends GetView<BottomAppbarController> {
  const BottomAppbarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Container(
              padding: const EdgeInsets.fromLTRB(globalPadding + 5, 0, globalPadding + 5, 0),
              height: Get.height * .1,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => controller.setPageIndex(0),
                    child: SvgPicture.asset(
                      exploreIcon,
                      color: controller.page.value == 0
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.setPageIndex(1),
                    child: SvgPicture.asset(
                      statsIcon,
                      color: controller.page.value == 1
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.setPageIndex(2),
                    child: SvgPicture.asset(
                      prizeIcon,
                      color: controller.page.value == 2
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.setPageIndex(3),
                    child: SvgPicture.asset(
                      walletIcon,
                      color: controller.page.value == 3
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
