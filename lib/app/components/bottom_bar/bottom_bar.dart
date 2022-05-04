import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/padding_const.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
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
            height: Get.height * .1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  exploreIcon,
                  color: Colors.white.withOpacity(0.8),
                ),
                SvgPicture.asset(
                  statsIcon,
                  color: Colors.grey.withOpacity(0.5),
                ),
                SvgPicture.asset(
                  prizeIcon,
                  color: Colors.grey.withOpacity(0.5),
                ),
                SvgPicture.asset(
                  walletIcon,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
