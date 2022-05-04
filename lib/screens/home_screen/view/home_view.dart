import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/appbar/appbar.dart';
import 'package:nft_tool_app/app/components/background/background_widget.dart';
import 'package:nft_tool_app/app/components/bottom_bar/bottom_bar.dart';
import 'package:nft_tool_app/screens/explore_screen/explore_screen.dart';
import 'package:nft_tool_app/screens/home_screen/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.page!.value);
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: double.infinity,
        child: Stack(
          children: [
            const BackgroundWidget(),
            SizedBox(
              height: Get.height,
              width: double.infinity,
              child: Column(
                children: [
                  const MyAppbar(),
                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        const ExploreScreen(),
                        Container(
                          height: Get.height,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                  const BottomBar(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
