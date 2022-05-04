import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nft_tool_app/app/init/router.dart';

void main() {
  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    routeInformationParser: AppRouter.router.routeInformationParser,
    routerDelegate: AppRouter.router.routerDelegate,
  ));
}
