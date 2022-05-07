import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_tool_app/app/components/appbar/global_app_bar.dart';
import 'package:nft_tool_app/app/components/chip_list/chip_list.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

part '../widget/top_info_card.dart';
part '../widget/detail_chart.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const MyAppBar(
        title: 'Detail Screen',
        elevation: 0,
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(globalPadding, globalPadding, globalPadding, 0),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * .03,
                ),
                const _TopInfoCard(),
                SizedBox(height: SizeConfig.screenHeight * .03),
                const DetailChart()
              ],
            )),
      ),
    );
  }
}
