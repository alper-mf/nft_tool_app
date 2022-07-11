import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/bottom_bar/controller/bottom_controller.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  const MyAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: Get.find<BottomAppbarController>().page.value != 0 ? 0 : 1,
        child: SafeArea(
          child: Container(
            height: SizeConfig.height * .085,
            padding: const EdgeInsets.all(globalPadding),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: SizeConfig.height * .025,
                    color: defaultTextWhitecolor.withOpacity(0.8),
                  ),
                ),
                SizedBox.square(
                  dimension: SizeConfig.blockSizeHorizontal * 10,
                  child: SvgPicture.asset(
                    menuIcon,
                    color: defaultTextWhitecolor.withOpacity(0.8),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
