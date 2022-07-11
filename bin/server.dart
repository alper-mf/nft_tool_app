import 'package:vm_service/vm_service.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'core/hot_reload.dart';
import 'services/shelf_service.dart';

//[ENG]For run
//[TR] Çalıştırmak için: dart --enable-vm-service bin/server.dart
main() async {
  final service = ShelfService();
  var server = await io.serve(service.handler, 'localhost', 8080);

  print('Serving at http://${server.address.host}:${server.port}');

  await HotRelaodService.init(server);

  try {
    print('TEST 6');
  } catch (e) {
    print('Handle Request Error  ->-> ' + e.toString());
    server.close(force: true);
  }
}

class StdoutLog extends Log {
  @override
  void warning(String message) => print(message);

  @override
  void severe(String message) => print(message);
}
