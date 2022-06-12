import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:nft_tool_app/app/components/button/rounded_button.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/theme/colors/colors.dart';
import 'package:nft_tool_app/app/theme/text_and_style/connect_my_wallet/wallet_styles.dart';
import 'package:nft_tool_app/app/theme/text_and_style/connect_my_wallet/wallet_texts.dart';
import 'package:nft_tool_app/screens/wallet_screen/controller/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(globalPadding),
        height: SizeConfig.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: SizeConfig.height * .15,
              width: SizeConfig.height * .15,
              child: SvgPicture.asset(
                walletIcon,
                color: defaultWhiteColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(globalPadding),
              child: Text(
                WalletTexts.walletScreenInitText,
                textAlign: TextAlign.center,
                style: WalletTextStyles.sheetTitle,
              ),
            ),
            SizedBox(
              height: SizeConfig.height * .05,
            ),
            CRoundedButton(
              kHeight: SizeConfig.height * .06,
              onTap: controller.showIosWalletDialog,
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shield,
                    size: Get.height * .03,
                    color: defaultTextWhitecolor,
                  ),
                  SizedBox(width: SizeConfig.width * .02),
                  Text(
                    WalletTexts.connectYourWallet,
                    style: TextStyle(color: defaultTextWhitecolor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
