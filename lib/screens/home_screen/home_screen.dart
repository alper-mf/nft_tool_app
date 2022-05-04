import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nft_tool_app/screens/home_screen/controller/home_controller.dart';
import 'package:nft_tool_app/screens/home_screen/view/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) => const HomeView(),
    );
  }
}
