import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/chip_list/chip_list.dart';
import 'package:nft_tool_app/app/components/search_bar/search_bar_view.dart';
import 'package:nft_tool_app/app/components/slide_animation.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/constants/radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/model/response/coin_rank_list.dart';

import 'package:nft_tool_app/screens/explore_screen/controller/explore_controller.dart';

part './body_view.dart';
part '../widgets/rank_list_widget.dart';
part '../widgets/home_title_widget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchBarTextEditingController = TextEditingController();
    List<String> chipList = ['Nft Rank List', 'Rarirty Tool', 'Trend Alert', 'MarketCap'];

    return _BodyView(
        searchBarTextEditingController: searchBarTextEditingController, chipList: chipList);
  }
}
