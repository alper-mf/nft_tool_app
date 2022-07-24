import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/appbar/global_app_bar.dart';
import 'package:nft_tool_app/app/components/background/glass_widget.dart';

import 'package:nft_tool_app/app/components/button/rounded_button.dart';
import 'package:nft_tool_app/app/components/chip_list/chip_list.dart';
import 'package:nft_tool_app/app/components/image/image_network_viewer.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/model/enums/general_enums.dart';
import 'package:nft_tool_app/app/model/response/nft_detail.dart';
import 'package:nft_tool_app/app/model/response/rarirty.dart';
import 'package:nft_tool_app/app/theme/text_and_style/general_style/my_text_style.dart';
import 'package:nft_tool_app/app/theme/text_and_style/nft_detail/nft_detail_styles.dart';
import 'package:nft_tool_app/screens/nft_detail_screen/controller/detail_controller.dart';

part '../widget/top_info_card.dart';
part '../widget/detail_chart.dart';
part '../widget/bottom_buttons.dart';
part '../widget/properties.dart';

class NftDetailView extends GetView<NftDetailController> {
  const NftDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: paddingXL),
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: const MyAppBar(
          title: 'Details',
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Obx(() {
          if (controller.loadingStatus != LoadingStatus.loaded) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return SizedBox(
            height: SizeConfig.height,
            width: SizeConfig.width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                SizedBox(
                  height: SizeConfig.height,
                  width: SizeConfig.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: paddingXL, right: paddingXL),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox.square(
                            dimension: SizeConfig.blockSizeHorizontal * 90,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(radiusL),
                                  child: ImageNetworkViewer(
                                      imageUrl: controller.nftDetailModel.itemDetail!.imageUrl!),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 20,
                                  child: GlassWidget(
                                    sigma: 18,
                                    radius: 10,
                                    padding: paddingS,
                                    widget: Padding(
                                      padding: const EdgeInsets.all(paddingS),
                                      child: Text(
                                        controller.nftDetailModel.itemDetail!.rareType!,
                                        style: s14w400Dark(context).copyWith(
                                          fontSize: SizeConfig.width * .05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.height * .03),
                          _TopInfoCard(itemDetail: controller.nftDetailModel.itemDetail!),
                          SizedBox(height: SizeConfig.height * .03),
                          _RarirtyProperties(
                              rarirtyList: controller.nftDetailModel.itemDetail!.rarirty!),
                          SizedBox(height: SizeConfig.height * .2),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _BottomButtons(
                    buyPrice: 10,
                    buyOnTap: () {},
                    placeAbidOnTap: () {},
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
