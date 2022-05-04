import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/model/response/test_model.dart';

import 'package:nft_tool_app/screens/explore_screen/controller/explore_controller.dart';
import 'package:nft_tool_app/screens/explore_screen/cubit/explore_repository.dart';
import 'package:nft_tool_app/screens/explore_screen/cubit/explore_screen_cubit.dart';

void main() {
  // test('Get NFT Rank List Method Test', () async {
  //   final exploreViewModel = Get.put(ExploreController());
  //   final response = await exploreViewModel.getNFTRankList();
  //   expect(response is List<CoinRankModel>, true);
  // });

  test('Get NFT Rank List Method Test', () async {
    final response = ExploreScreenCubit(ExploreRepositoryController())..getTokenRankList();
    expect(response is List<CoinRankModel>, true);
  });
}
