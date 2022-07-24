import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nft_tool_app/screens/home_screen/home_screen.dart';
import 'package:nft_tool_app/screens/nft_detail_screen/detail_screen.dart';
import 'package:nft_tool_app/screens/wallet_screen/wallet_screen.dart';

class ScreensPath {
  static const String _initialLocation = _splash;
  static const String _splash = '/splash';
  static const String _onBoarding = '/onBoarding';
  static const String _loadingScreen = '/loadingScreen';
  static const String _auth = '/auth';
  static const String _home = '/';
  static const String _marketPlace = '/marketplace';
  static const String _walletScreen = '/walletScreen';
  static const String _nftDetailScreen = '/nftDetailScreen';

  static String get initialLocation => _initialLocation;
  static String get splash => _splash;
  static String get onBoarding => _onBoarding;
  static String get loadingScreen => _loadingScreen;
  static String get auth => _auth;
  static String get home => _home;
  static String get marketPlace => _marketPlace;
  static String get walletScreen => _walletScreen;
  static String get nftDetailScreen => _nftDetailScreen;

  static GoRoute goToSplash() {
    return GoRoute(
        path: splash,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()));
  }

  static GoRoute goToOnBoarding() {
    return GoRoute(
        path: onBoarding,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()));
  }

  static GoRoute goToLoadingScreen() {
    return GoRoute(
        path: loadingScreen,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()));
  }

  static GoRoute goToAuth() {
    return GoRoute(
        path: auth,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()));
  }

  static GoRoute goToHomeScreen() {
    return GoRoute(
        path: home,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()));
  }

  static GoRoute goToMarketPlace() {
    return GoRoute(
        path: marketPlace,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()));
  }

  static GoRoute goToNftDetailScreen() {
    return GoRoute(
        path: nftDetailScreen,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const NftDetailScreen()));
  }

  static GoRoute goToWalletScreen() {
    return GoRoute(
        path: walletScreen,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const WalletScreen()));
  }
}
