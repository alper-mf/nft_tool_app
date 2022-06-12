import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nft_tool_app/app/components/bottom_sheet/exhibition_bottom_sheet/exhibition_bottom_sheet.dart';
import 'package:nft_tool_app/app/components/chip_list/chip_list.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

part '../widget/top_info_card.dart';
part '../widget/detail_chart.dart';

String azuki =
    'https://ikzttp.mypinata.cloud/ipfs/QmYDvPAXtiJg7s8JdRBSLWdgSphQdac8j1YuQNNxcGE1hg/5116.png';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig.height,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: SizeConfig.height / 2,
                width: SizeConfig.width,
                child: Image.network(azuki),
              ),
              Padding(
                  padding:
                      const EdgeInsets.fromLTRB(globalPadding, globalPadding, globalPadding, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.height * .03,
                      ),
                      const _TopInfoCard(),
                      SizedBox(height: SizeConfig.height * .03),
                      // const DetailChart()
                    ],
                  )),
              const ExhibitionBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
