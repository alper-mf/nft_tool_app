import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nft_tool_app/screens/nft_detail_screen/controller/detail_controller.dart';
import 'package:nft_tool_app/screens/nft_detail_screen/view/detail_view.dart';

class NftDetailScreen extends StatelessWidget {
  final nftId = 0;
  const NftDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NftDetailController(nftId),
      builder: (_) => const NftDetailView(),
    );
  }
}
