// ignore_for_file: avoid_relative_lib_imports

import 'package:nft_tool_app/app/constants/http_url.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../lib/constant/file_path.dart' show FilePaths;
import 'api.dart';
import 'fake_api.dart';

class ShelfService {
  static const header = {
    "Content-type": "application/json",
    "Access-Control-Allow-Origin": "*",
  };
  // The handler/middleware that will be used by the server, all the routing for the server will be implemented here.
  Handler get handler {
    final router = Router();

    //Categories Endpoint
    router.get(HttpUrl.categories, (Request request) async {
      try {
        //  request.headers.addAll(header);
        await Future.delayed(const Duration(seconds: 2));
        late String model;
        model = await FakeApi().getString(FilePaths.categoriesPath);

        return Response.ok(model, headers: header);
      } catch (e) {
        return Response.badRequest(body: e);
      }
    });

    //NFTDetail Endpoint
    router.get(HttpUrl.nftDetail(0), (Request request) async {
      try {
        //  request.headers.addAll(header);
        await Future.delayed(const Duration(seconds: 2));
        late String model;
        model = await FakeApi().getString(FilePaths.nftDetail);

        return Response.ok(model, headers: header);
      } catch (e) {
        return Response.badRequest(body: e);
      }
    });

    //TokenList Endpoint
    router.get(HttpUrl.tokenList, (Request request) async {
      try {
        //  request.headers.addAll(header);
        await Future.delayed(const Duration(seconds: 4));
        late String model;
        model = await FakeApi().getString(FilePaths.tokenList);
        return Response.ok(model, headers: header);
      } catch (e) {
        return Response.badRequest(body: e);
      }
    });

    // GET
    // You can use regex to limit the capture of the path arguments, in this case the userId param needs to be only digits. Note how you can also used 'async'
    // With the server running try to open http://localhost:8080/user/132 and http://localhost:8080/user/a123
    router.get('/user/<userId|[0-9]+>', (Request request) async {
      await Future.delayed(const Duration(milliseconds: 100));
      return Response.ok('_o/');
    });

    // You can also embed other routers, in this case it will help organizer your routers
    // Note: This needs be before the catch 'router.all' that follows
    router.mount('/api/', Api().router);

    // A catch all of the non implemented routing, useful for showing 404 page now found
    // With the server running try to open http://localhost:8080/abc
    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }
}
