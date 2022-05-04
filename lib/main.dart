import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nft_tool_app/screens/explore_screen/explore_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: const ExploreScreen(),
  ));
}
