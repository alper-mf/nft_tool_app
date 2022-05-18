import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/appbar/appbar.dart';
import 'package:nft_tool_app/app/components/background/background_widget.dart';
import 'package:nft_tool_app/app/components/bottom_bar/bottom_bar.dart';
import 'package:nft_tool_app/app/components/bottom_bar/controller/bottom_controller.dart';
import 'package:nft_tool_app/app/components/indexed_stack/animated_indexed_stack.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/screens/explore_screen/controller/explore_controller.dart';
import 'package:nft_tool_app/screens/explore_screen/explore_screen.dart';
import 'package:nft_tool_app/screens/home_screen/controller/home_controller.dart';
import 'package:nft_tool_app/screens/wallet_screen/wallet_screen.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.height,
        width: double.infinity,
        child: Stack(
          children: [
            const BackgroundWidget(),
            SizedBox(
              height: SizeConfig.height,
              width: double.infinity,
              child: Column(
                children: const [
                  MyAppbar(),
                  _BuilderPagesWidget(),
                  BottomAppbar(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BuilderPagesWidget extends GetView<ExploreController> {
  const _BuilderPagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Obx(
          () => AnimatedIndexedStack(
            index: Get.find<BottomAppbarController>().page.value,
            children: [
              const ExploreScreen(),
              Container(
                height: SizeConfig.height,
                width: double.infinity,
                //color: Colors.black.withOpacity(0.2),
              ),
              Container(
                height: SizeConfig.height,
                width: double.infinity,
                color: Colors.black.withOpacity(0.2),
              ),
              const WalletScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
