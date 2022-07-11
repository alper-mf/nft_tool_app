import 'dart:developer';
import 'dart:io';

import 'package:vm_service/utils.dart';

import 'package:vm_service/vm_service_io.dart';
import 'package:watcher/watcher.dart';
import 'package:stream_transform/stream_transform.dart';

import 'dart:developer' as dev;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf/shelf.dart' as shelf;

import '../server.dart';

class HotRelaodService {
  HotRelaodService._();

  static init(HttpServer server) async {
    server.autoCompress = true;
    var observatoryUri = (await dev.Service.getInfo()).serverUri;
    if (observatoryUri != null) {
      var serviceClient = await vmServiceConnectUri(
          convertToWebSocketUrl(serviceProtocolUrl: observatoryUri).toString(),
          log: StdoutLog());
      var vm = await serviceClient.getVM();
      var mainIsolate = vm.isolates!.first;

      Watcher(Directory.current.path)
          .events
          .throttle(const Duration(milliseconds: 1000))
          .listen((_) async {
        await serviceClient.reloadSources(mainIsolate.id!);

        print('App restarted ${DateTime.now()}');
      });
    } else {
      print(
          'You need to pass `--enable-vm-service --disable-service-auth-codes` to enable hot reload');
    }
  }
}
