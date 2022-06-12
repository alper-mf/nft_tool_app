import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/bottom_bar/controller/bottom_controller.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

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
          Container(
            padding: const EdgeInsets.fromLTRB(globalPadding + 5, 0, globalPadding + 5, 0),
            height: SizeConfig.height * .1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => controller.setPageIndex(0),
                  child: const _BottomButtonWidget(icon: exploreIcon, index: 0),
                ),
                InkWell(
                  onTap: () => controller.setPageIndex(1),
                  child: const _BottomButtonWidget(icon: statsIcon, index: 1),
                ),
                InkWell(
                  onTap: () => controller.setPageIndex(2),
                  child: const _BottomButtonWidget(icon: prizeIcon, index: 2),
                ),
                InkWell(
                  onTap: () => controller.setPageIndex(3),
                  child: const _BottomButtonWidget(icon: walletIconMini, index: 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomButtonWidget extends GetView<BottomAppbarController> {
  final String icon;
  final int index;
  const _BottomButtonWidget({
    Key? key,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color:
                  controller.page.value == index ? greenColor.withOpacity(0.5) : Colors.transparent,
              blurRadius: 24)
        ]),
        child: SvgPicture.asset(
          icon,
          color: controller.page.value == index
              ? greenColor.withOpacity(0.6)
              : Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
