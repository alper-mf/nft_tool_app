import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nft_tool_app/screens/market_place_screen/controller/market_place_controller.dart';
import 'package:nft_tool_app/screens/market_place_screen/view/market_place_view.dart';

class MarketPlaceScreen extends StatelessWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MarketPlaceController(),
      builder: (_) => MarketPlaceView(),
    );
  }
}
