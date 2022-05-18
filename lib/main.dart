import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nft_tool_app/app/navigation/router.dart';
import 'package:nft_tool_app/core/services/init_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitServices().dependencies();
  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    routeInformationParser: AppRouter.router.routeInformationParser,
    routerDelegate: AppRouter.router.routerDelegate,
  ));
}
