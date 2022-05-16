import 'dart:io';

import 'package:get/get.dart';
import 'package:nft_tool_app/app/model/enums/wallet_enums.dart';
import 'package:nft_tool_app/screens/wallet_screen/controller/account_state.dart';
import 'package:nft_tool_app/utils/url_scheme_utils.dart';

import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';

class WalletController extends GetxController {
  final AccountState state = AccountState();
  final metamask = "MetaMask".obs;
  final rainbow = "Rainbow".obs;
  final trust = "Trust".obs;
  final authToken = "Twitter".obs;

  late WalletConnect? connector;
  late SessionStatus? currentSession;
  Wallet? currentWallet;
  WalletController() {
    createConnector();
  }

  // Create a connector
  void createConnector() async {
    if (connector == null) {
      final sessionStorage = WalletConnectSecureStorage();
      final session = await sessionStorage.getSession();

      connector = WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
        // session: session,
        // sessionStorage: sessionStorage,
        clientMeta: PeerMeta(
          name: 'WalletConnect',
          description: 'WalletConnect Developer App',
          url: 'https://walletconnect.org',
          icons: [
            'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ],
        ),
      );

      // Subscribe to events
      connector?.on('connect', (session) {
        print("connect\nsession = $session");
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
        print("session_update\npayload = $payload");
      });
      connector?.on('disconnect', (session) {
        print("disconnect\nsession = $session");
      });
    }
  }

  //Create a new session
  //Create a new session between the dApp and wallet.
  void connect(Wallet wallet) async {
    currentWallet = wallet;
    String deeplink = "";
    switch (wallet) {
      case Wallet.rainbow:
        deeplink = "rainbow://wc?uri=";
        break;
      case Wallet.metamask:
        deeplink = "metamask://wc?uri=";
        break;
      case Wallet.trust:
        deeplink = "trust://wc?uri=";
        break;
    }
    if (Platform.isAndroid) {
      deeplink = "";
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
      disConnect();
    }
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
