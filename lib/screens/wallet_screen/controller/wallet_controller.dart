import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/dialogs/bottom_sheet/custom_bottom_sheet.dart';
import 'package:nft_tool_app/app/model/enums/wallet_enums.dart';
import 'package:nft_tool_app/screens/wallet_screen/controller/account_state.dart';
import 'package:nft_tool_app/screens/wallet_screen/widget/select_wallet.dart';
import 'package:nft_tool_app/utils/url_scheme_utils.dart';

import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';

class WalletController extends GetxController {
  final AccountState state = AccountState();
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  final metamask = "MetaMask".obs;
  final rainbow = "Rainbow".obs;
  final trust = "Trust".obs;

  late final WalletConnect? connector;
  late SessionStatus? currentSession;
  final sessionStorage = WalletConnectSecureStorage();
  Wallet? currentWallet; //-> Enum

  @override
  void onInit() {
    super.onInit();

    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      // session: session,
      // sessionStorage: sessionStorage,
      clientMeta: const PeerMeta(
        name: 'WalletConnect',
        description: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );
    createConnector();
  }

  // Create a connector
  Future<void> createConnector() async {
    if (connector == null) {
      final session = await sessionStorage.getSession();

      // Subscribe to events
      connector?.on('connect', (session) {
        log("connect\nsession ------->>>>> = $session");

        if (session is SessionStatus) {
          if (currentWallet == Wallet.rainbow) {
            rainbow.value = session.accounts.first;
          } else if (currentWallet == Wallet.metamask) {
            metamask.value = session.accounts.first;
          } else {
            trust.value = session.accounts.first;
          }
        }
      });
      connector?.on('session_update', (payload) {
        if (kDebugMode) {
          print("session_update\npayload = $payload");
        }
      });
      connector?.on('disconnect', (session) {
        if (kDebugMode) {
          print("disconnect\nsession = $session");
        }
      });
    }
  }

  void showIosWalletDialog() {
    if (Platform.isAndroid) {
      CBottomSheet.show(
        scaffoldKey.currentContext!,
        const SelectWalletSheet(),
      );
      //connect(Wallet.rainbow);
    } else {
      CBottomSheet.show(
        scaffoldKey.currentContext!,
        const SelectWalletSheet(),
      );
    }
  }

  //Create a new session
  //Create a new session between the dApp and wallet.
  void connect(Wallet wallet) async {
    currentWallet = wallet;
    String deeplink = "";

    if (Platform.isAndroid) {
      deeplink = "";
    }
    switch (wallet) {
      case Wallet.rainbow:
        log('RAINBOW');
        deeplink = "rainbow://wc?uri=";
        break;
      case Wallet.metamask:
        log('METAMASK');
        deeplink = "metamask://wc?uri=";
        break;
      case Wallet.trust:
        log('WALLET TRUST');
        deeplink = "trust://wc?uri=";
        break;
    }

    if (!(connector?.connected ?? false)) {
      currentSession = await connector?.createSession(
        chainId: 4160,
        onDisplayUri: (uri) {
          uri = deeplink + uri;
          URLSchemeUntils.openOtherApp(uri);
        },
      );
    } else {
      log(' --------> HATA');
      disConnect();
    }

    log('ACCOUNT ADRESS' + currentSession!.accounts[0]);
  }

  void disConnect() async {
    if ((connector?.connected ?? false)) {
      connector?.close(forceClose: true);
      connector = null;
      createConnector();
      metamask.value = "metamask";
      rainbow.value = "rainbow";
      trust.value = "trust";
    }
  }
}
