import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class URLSchemeUntils {
  static bool handleURLScheme(String urlScheme, {dynamic formObject}) {
    final url = Uri.parse(urlScheme);
    final secheme = url.scheme;
    final host = url.host;
    final paths = url.path.substring(1).split('/');

    final query = url.queryParameters;
    final path = paths.isNotEmpty ? paths[0] : '';
    if (secheme == 'http' || secheme == 'https') {
      final url = query['url'];
      if (url != null && url.isEmpty == false) {
        openBrower(url);
        return true;
      }
    } else if (secheme == 'ntfchicken') {
      if (host == 'page') {
        if (path == 'web') {
          final url = query['url'];
          if (url != null && url.isEmpty == false) {
            // Get.toNamed(Routes.web, arguments: url);
            return true;
          }
        }
      }
    }
    return false;
  }

  static openBrower(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }

  static call(String aaa) async {
    final url = 'tel:' + aaa;
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }

  static message(String phone) async {
    final url = 'sms:$phone';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }

  static openOtherApp(String url) async {
    /**
     * weixin://
     * alipays://
     */
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }
// handleURLScheme:(NSString *)urlScheme from:(id)fromObject
}
