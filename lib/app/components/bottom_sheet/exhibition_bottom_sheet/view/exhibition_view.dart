import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/background/glass_widget.dart';
import 'package:nft_tool_app/app/components/bottom_sheet/exhibition_bottom_sheet/controller/exhibition_controller.dart';
import 'package:nft_tool_app/app/model/response/event_model_sheet.dart';

part '../widgets/sheet_header.dart';

class ExhibitionBottomSheetView extends GetView<ExhibitionSheetController> {
  const ExhibitionBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, child) => Positioned(
            height: controller.lerp(controller.minHeight.value, controller.maxHeight),
            left: 5,
            right: 5,
            bottom: 10,
            child: GestureDetector(
              onTap: () => controller.toggle(),
              onVerticalDragUpdate: controller.handleDragUpdate,
              onVerticalDragEnd: controller.handleDragEnd,
              child: GlassWidget(
                radius: 32,
                sigma: 18,
                widget: Stack(
                  children: [
                    _SheetHeader(
                        fontSize: controller.headerFontSize!,
                        topMargin: controller.headerTopMargin!,
                        title: 'Bests On The Collection'),
                    for (Event event in events) _buildIcon(event),
                  ],
                ),
              ),
            )));
  }

  Widget _buildIcon(Event event) {
    int index = events.indexOf(event); //<-- Get index of the event
    return Positioned(
      height: controller.iconSize, //<-- Specify icon's size
      width: controller.iconSize, //<-- Specify icon's size
      top: controller.iconTopMargin(index), //<-- Specify icon's top margin
      left: controller.iconLeftMargin(index), //<-- Specify icon's left margin
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(controller.itemBorderRadius!), //<-- Set the rounded corners
          right: Radius.circular(controller.itemBorderRadius!),
        ),
        child: Image.network(
          event.assetName,
          fit: BoxFit.cover,
          alignment:
              Alignment(controller.lerp(1, 0)!, 0), //<-- Play with alignment for extra style points
        ),
      ),
    );
  }
}
