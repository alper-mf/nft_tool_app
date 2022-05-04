import 'dart:convert';

import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:nft_tool_app/app/model/response/test_model.dart';
import 'package:nft_tool_app/core/services/http_client_service.dart';
import 'package:nft_tool_app/screens/explore_screen/controller/explore_controller.dart';

abstract class ExploreRepository {
  Future<List<CoinRankModel>> getList();
}

class ExploreRepositoryController extends ExploreRepository {
  @override
  Future<List<CoinRankModel>> getList() async {
    var response = await HttpClientService().get(coinRankUrl);

    if (response!.statusCode == HttpStatus.ok) {}

    switch (response.statusCode) {
      case HttpStatus.ok:
        final dataResponse =
            jsonDecode(utf8.decode(response.bodyBytes)).map<CoinRankModel>((el) => CoinRankModel.fromJson(el)).toList();

        return dataResponse;

      default:
        throw NetworkError(response.statusCode.toString(), response.body);
    }
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}
