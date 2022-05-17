import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/button/rounded_button.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/model/enums/wallet_enums.dart';
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
          'Cüzdan Seç',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: SizeConfig.height * .03,
        ),
        _WalletButton(
          svgIcon: '',
          tap: () => controller.connect(Wallet.metamask),
          walletTitle: 'Metamask',
        ),
        SizedBox(
          height: SizeConfig.height * .02,
        ),
        _WalletButton(
          svgIcon: '',
          tap: () => controller.connect(Wallet.trust),
          walletTitle: 'Trust Wallet',
        ),
        SizedBox(
          height: SizeConfig.height * .02,
        ),
        _WalletButton(
          svgIcon: '',
          tap: () => controller.connect(Wallet.rainbow),
          walletTitle: 'Rainbow Wallet',
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
    return CRoundedButton(
      kHeight: 50,
      borderRadius: 15,
      onTap: tap,
      color: selectWalletButtonColor,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                height: 32,
                width: 32,
                child: Placeholder(),
              ),
              SizedBox(
                width: SizeConfig.width * .02,
              ),
              Text(walletTitle),
            ],
          ),
          Icon(
            CupertinoIcons.forward,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
