import 'package:get/get.dart';
import 'package:wallet_connect/wallet_connect.dart';

class WalletController extends GetxController {
  final String projectId = '9a300a1ae4ef3d59d0cbeeea2df31af4';
  final String wmServerUrl = '';
  final String env = 'native';

  final wcClient = WCClient(
    onConnect: () {
      // Respond to connect callback
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
