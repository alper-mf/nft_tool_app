import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Api {
  Future<Response> _messages(Request request) async {
    return Response.ok('[]');
  }

  Router get router {
    final router = Router();

    router.get('/messages', _messages);
    router.get('/messages/', _messages);
    router.post('/messages/', _messages);
    // router.update('/messages/', _messages);
    router.delete('/messages/', _messages);

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));
    return router;
  }
}
