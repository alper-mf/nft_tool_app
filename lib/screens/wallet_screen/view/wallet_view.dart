import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:nft_tool_app/app/components/button/rounded_button.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/screens/wallet_screen/controller/wallet_controller.dart';
import 'package:nft_tool_app/screens/wallet_screen/view/example_view.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(globalPadding),
        height: SizeConfig.screenHeight,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * .15,
              width: SizeConfig.screenHeight * .15,
              child: SvgPicture.asset(walletIcon),
            ),
            const Padding(
              padding: EdgeInsets.all(globalPadding),
              child: Text(
                'Özgür finansman dünyasına girmen için\n sadece bir adım kaldı.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .05,
            ),
            CRoundedButton(
              kHeight: SizeConfig.screenHeight * .06,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Test')));
              },
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shield,
                    size: Get.height * .03,
                    color: globalTextWhiteColor,
                  ),
                  SizedBox(width: SizeConfig.screenWidth * .02),
                  Text(
                    'Cüzdanımı Bağla',
                    style: TextStyle(color: globalTextWhiteColor),
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
