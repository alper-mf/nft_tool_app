import 'dart:developer';
import 'dart:io';

import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'core/hot_reload.dart';
import 'services/shelf_service.dart';

//[ENG]For run
//[TR] Çalıştırmak için: dart --enable-vm-service bin/server.dart
main() async {
  withHotreload(
    () => createServer(),
    onReloaded: () => print('Reload!'),
    onHotReloadNotAvailable: () => print('No hot-reload :('),
    onHotReloadAvailable: () => print('Yay! Hot-reload :)'),
    onHotReloadLog: (log) => print('Reload Log: ${log.message}'),
    logLevel: Level.INFO,
  );
}

Future<HttpServer> createServer() async {
  final service = ShelfService();
  var server = await io.serve(service.handler, 'localhost', 8080);

  print('Serving at http://${server.address.host}:${server.port}');

  try {
    print('Started');
  } catch (e) {
    log('Handle Request Error  ->-> ' + e.toString());
    server.close(force: true);
  }
  return server;
}
