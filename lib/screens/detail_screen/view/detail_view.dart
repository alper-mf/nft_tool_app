import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_tool_app/app/components/appbar/global_app_bar.dart';

import 'package:nft_tool_app/app/components/bottom_sheet/exhibition_bottom_sheet/exhibition_bottom_sheet.dart';
import 'package:nft_tool_app/app/components/chip_list/chip_list.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

part '../widget/top_info_card.dart';
part '../widget/detail_chart.dart';

String azuki =
    'https://ikzttp.mypinata.cloud/ipfs/QmYDvPAXtiJg7s8JdRBSLWdgSphQdac8j1YuQNNxcGE1hg/4369.png';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Details',
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          height: SizeConfig.height,
          width: SizeConfig.width,
          padding: const EdgeInsets.only(left: paddingXL, right: paddingXL),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox.square(
                        dimension: SizeConfig.blockSizeHorizontal * 90,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(radiusM)),
                              image: DecorationImage(
                                image: NetworkImage(azuki),
                              )),
                        ),
                      ),
                      SizedBox(height: SizeConfig.height * .03),
                      const _TopInfoCard(),
                      SizedBox(height: SizeConfig.height * .03),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: SizeConfig.height * .08,
              //   width: SizeConfig.width,
              //   color: Colors.red.withOpacity(0.5),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
