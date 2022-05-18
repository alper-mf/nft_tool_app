import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nft_tool_app/screens/wallet_screen/controller/wallet_controller.dart';
import 'package:nft_tool_app/screens/wallet_screen/view/wallet_view.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WalletController(),
      builder: (_) => const WalletView(),
    );
  }
}
