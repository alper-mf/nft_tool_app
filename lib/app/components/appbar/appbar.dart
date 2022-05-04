import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_const.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height * .075,
        padding: const EdgeInsets.all(globalPadding),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NFT Tool',
              style: TextStyle(
                fontSize: Get.height * .025,
                color: globalTextWhiteColor.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: 42,
              width: 42,
              child: SvgPicture.asset(
                menuIcon,
                color: globalTextWhiteColor.withOpacity(0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
