import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/background/glass_widget.dart';
import 'package:nft_tool_app/app/components/bottom_sheet/exhibition_bottom_sheet/controller/exhibition_controller.dart';
import 'package:nft_tool_app/app/components/bottom_sheet/exhibition_bottom_sheet/widgets/expanded_item.dart';
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
                        title: 'The best in the collection'),
                    for (Event event in events) _buildFullItem(event),
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
          left: Radius.circular(controller.iconLeftBorderRadius), //<-- Set the rounded corners
          right: Radius.circular(controller.iconRightBorderRadius),
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

  Widget _buildFullItem(Event event) {
    int index = events.indexOf(event);
    return ExpandedEventItem(
      topMargin: controller.iconTopMargin(index), //<--provide margins and height same as for icon
      leftMargin: controller.iconLeftMargin(index),
      height: controller.iconSize,
      isVisible:
          controller.animationController.status == AnimationStatus.completed, //<--set visibility
      borderRadius: controller.itemBorderRadius, //<-- pass border radius
      title: event.title, //<-- data to be displayed
      date: event.date, //<-- data to be displayed
    );
  }
}
