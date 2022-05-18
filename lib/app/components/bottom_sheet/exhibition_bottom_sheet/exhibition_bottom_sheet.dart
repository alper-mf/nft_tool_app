import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nft_tool_app/app/components/bottom_sheet/exhibition_bottom_sheet/controller/exhibition_controller.dart';
import 'package:nft_tool_app/app/components/bottom_sheet/exhibition_bottom_sheet/view/exhibition_view.dart';

class ExhibitionBottomSheet extends StatelessWidget {
  const ExhibitionBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ExhibitionSheetController(context),
      builder: (_) => const ExhibitionBottomSheetView(),
    );
  }
}
