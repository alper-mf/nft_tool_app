import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nft_tool_app/app/navigation/pages.dart';

class AppRouter {
  late AppRouter instance;

  //Init Edilecek durumlar için burayı kullanabilirsiniz.
  AppRouter._();

  static GoRouter get router => AppRouter._router;

  //Cupertino Ekle
  static final GoRouter _router = GoRouter(
      initialLocation: ScreensPath.initialLocation,
      routes: [
        ScreensPath.goToSplash(),
        ScreensPath.goToOnBoarding(),
        ScreensPath.goToLoadingScreen(),
        ScreensPath.goToAuth(),
        ScreensPath.goToHomeScreen(),
        ScreensPath.goToWalletScreen(),
        ScreensPath.goToMarketPlace(),
        ScreensPath.goToNftDetailScreen(),
      ],
      errorPageBuilder: (context, error) => MaterialPage(
          key: error.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(error.toString()),
            ),
          )));
}
