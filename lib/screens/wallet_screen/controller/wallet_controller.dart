import 'package:get/get.dart';
import 'package:wallet_connect/wallet_connect.dart';

class WalletController extends GetxController {
  final String projectId = '9a300a1ae4ef3d59d0cbeeea2df31af4';
  final String wmServerUrl = '';

  late final wcClient = WCClient(
    onConnect: () {
      final session = WCSession.from(
          'wc:8a5e5bdc-a0e4-4702-ba63-8f1a5655744f@1?bridge=https%3A%2F%2Fbridge.walletconnect.org&key=41791102999c339c844880b23950704cc43aa840f3739e365323cda4dfa89e7a');

      final peerMeta = WCPeerMeta(
        name: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        description: 'Wallet Connect',
        icons: ['https://walletconnect.org/walletconnect-logo.png'],
      );

      wcClient.connectNewSession(session: session, peerMeta: peerMeta);
    },
    onDisconnect: (code, reason) {
      // Respond to disconnect callback
    },
    onFailure: (error) {
      // Respond to connection failure callback
    },
    onSessionRequest: (id, peerMeta) {
      // Respond to connection request callback
    },
    onEthSign: (id, message) {
      // Respond to personal_sign or eth_sign or eth_signTypedData request callback
    },
    onEthSendTransaction: (id, tx) {
      // Respond to eth_sendTransaction request callback
    },
    onEthSignTransaction: (id, tx) {
      // Respond to eth_signTransaction request callback
    },
  );
}
