import 'dart:io';

import 'package:flutter/material.dart';

///it written for check the internet
///it shows this message when we have not internet
Future<bool> checkInternet(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    // when we have not internet
    //TODO: Alper - ShowToastMessage
    // showToastMessage(context,
    //     textMessage: 'Lütfen internet bağlantınızı kontrol ediniz.');
  } on SocketException catch (_) {
    return false;
  }
}
