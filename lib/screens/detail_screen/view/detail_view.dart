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
import 'package:nft_tool_app/screens/detail_screen/controller/detail_controller.dart';

part '../widget/top_info_card.dart';
part '../widget/detail_chart.dart';
part '../widget/bottom_buttons.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(radiusL),
                            child: ImageNetworkViewer(
                                imageUrl: controller.nftDetailModel.itemDetail!.imageUrl!),
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
    );
  }
}

class _RarirtyProperties extends StatelessWidget {
  final List<Rarirty> rarirtyList;
  const _RarirtyProperties({Key? key, required this.rarirtyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Properties',
            style: s14w700Dark(context).copyWith(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.width * .05,
              color: defaultTextWhitecolor.withOpacity(0.7),
            )),
        SizedBox(height: SizeConfig.height * .02),
        Wrap(
          runSpacing: SizeConfig.height * .02,
          spacing: SizeConfig.width * .04,
          children: List.generate(rarirtyList.length, (index) {
            final item = rarirtyList[index];
            return Container(
              padding: const EdgeInsets.all(paddingM),
              decoration: BoxDecoration(
                  border: Border.all(color: lightGrey),
                  borderRadius: const BorderRadius.all(Radius.circular(radiusM))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.traitType!.toUpperCase(),
                    style: s12w400Dark(context).copyWith(fontSize: SizeConfig.height * .015),
                  ),
                  SizedBox(height: SizeConfig.height * (.01 / 2)),
                  Text(
                    item.value!.capitalizeFirst!,
                    style: s14w700Dark(context).copyWith(
                      fontSize: SizeConfig.height * .02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.height * (.01 / 2)),
                  Text(
                    item.rarirtyPercent! + ' rarirty',
                    style: s12w400Dark(context).copyWith(
                        fontSize: SizeConfig.height * .018,
                        fontWeight: FontWeight.bold,
                        color: defaultTextWhitecolor.withOpacity(0.7)),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
