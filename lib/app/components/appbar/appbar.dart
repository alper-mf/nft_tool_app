import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/bottom_bar/controller/bottom_controller.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: Get.find<BottomAppbarController>().page.value != 0
            ? const SizedBox()
            : SafeArea(
                child: Container(
                  height: SizeConfig.height * .085,
                  padding: const EdgeInsets.all(globalPadding),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NFT Tool',
                        style: TextStyle(
                          fontSize: SizeConfig.height * .025,
                          color: globalTextWhiteColor.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          menuIcon,
                          color: globalTextWhiteColor.withOpacity(0.8),
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
