import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/button/rounded_button.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/model/enums/wallet_enums.dart';
import 'package:nft_tool_app/app/theme/colors/colors.dart';
import 'package:nft_tool_app/app/theme/text_and_style/connect_my_wallet/wallet_styles.dart';
import 'package:nft_tool_app/app/theme/text_and_style/connect_my_wallet/wallet_texts.dart';
import 'package:nft_tool_app/screens/wallet_screen/controller/wallet_controller.dart';

class SelectWalletSheet extends GetView<WalletController> {
  const SelectWalletSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          WalletTexts.pleaseSelectYourWallet,
          textAlign: TextAlign.center,
          style: WalletTextStyles.sheetTitle,
        ),
        SizedBox(
          height: SizeConfig.height * .03,
        ),
        _WalletButton(
          svgIcon: metamaskOutlined,
          tap: () => controller.connect(Wallet.metamask),
          walletTitle: WalletTexts.metamask,
        ),
        SizedBox(
          height: SizeConfig.height * .02,
        ),
        _WalletButton(
          svgIcon: trustWalletOutlined,
          tap: () => controller.connect(Wallet.trust),
          walletTitle: WalletTexts.trustWallet,
        ),
        SizedBox(
          height: SizeConfig.height * .02,
        ),
        _WalletButton(
          svgIcon: rainbowWalletOutlined,
          tap: () => controller.connect(Wallet.rainbow),
          walletTitle: WalletTexts.rainbowWallet,
        ),
      ],
    );
  }
}

class _WalletButton extends StatelessWidget {
  final VoidCallback tap;
  final String svgIcon;
  final String walletTitle;
  const _WalletButton({
    Key? key,
    required this.tap,
    required this.svgIcon,
    required this.walletTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: ListTile(
        visualDensity: VisualDensity.comfortable,
        minLeadingWidth: 10,
        leading: Container(
          height: 24,
          width: 24,
          margin: EdgeInsets.only(top: SizeConfig.height * .01),
          child: svgIcon.isNotEmpty
              ? SvgPicture.asset(
                  svgIcon,
                  color: defaultWhiteColor,
                )
              : const Placeholder(
                  color: Colors.white,
                ),
        ),
        title: Text(
          walletTitle,
          style: WalletTextStyles.sheetTitle,
        ),
        subtitle: Text(
          'Select',
          style: WalletTextStyles.sheetSubtitle,
        ),
      ),
    );
  }
}
