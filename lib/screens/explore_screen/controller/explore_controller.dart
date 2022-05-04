import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/model/response/error_response_model.dart';
import 'package:nft_tool_app/app/model/response/test_model.dart';
import 'package:nft_tool_app/core/services/http_client_service.dart';

String coinRankUrl = 'https://api.opensea.io/tokends/?format=json&limit=10';
String testUrl = 'https://jsonplaceholder.typicode.com/posts';

class ExploreController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final RxList<CoinRankModel> coinRankList = <CoinRankModel>[].obs;

  ExploreController() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    Timer.run(() async {
      await getNFTRankList();
    });
  }

  Future<dynamic> getNFTRankList() async {
    try {
      var response = await HttpClientService().get(coinRankUrl);

      if (response!.statusCode == HttpStatus.ok) {
        coinRankList.value =
            jsonDecode(utf8.decode(response.bodyBytes)).map<CoinRankModel>((el) => CoinRankModel.fromJson(el)).toList();

        return coinRankList();
      }
    } catch (e) {
      log('GetCoinRankList Error In Explore Controller' + e.toString());
      return ErrorResponseModel();
    }
  }
}
