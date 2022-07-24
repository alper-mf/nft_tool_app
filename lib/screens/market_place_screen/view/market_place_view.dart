import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/appbar/global_app_bar.dart';
import 'package:nft_tool_app/app/components/background/glass_widget.dart';
import 'package:nft_tool_app/app/components/button/rounded_button.dart';
import 'package:nft_tool_app/app/components/indexed_stack/animated_indexed_stack.dart';
import 'package:nft_tool_app/app/components/search_bar/search_bar_view.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/model/enums/general_enums.dart';
import 'package:nft_tool_app/app/theme/colors/colors.dart';
import 'package:nft_tool_app/app/theme/text_and_style/market/market_styles.dart';
import 'package:nft_tool_app/screens/market_place_screen/controller/market_place_controller.dart';

part '../widget/select_tab.dart';
part './nfts_view.dart';
part './collections_view.dart';
part './users_view.dart';

class MarketPlaceView extends GetView<MarketPlaceController> {
  const MarketPlaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: const MyAppBar(
        title: 'Market Place',
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(paddingXL, paddingXL, paddingXL, 0),
        child: Obx(() {
          if (controller.loadingStatus != LoadingStatus.loaded) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Searchbar ve Filter Button
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: SearchBarWidget(
                          textEditingController: controller.searchBarTextEditingController,
                          hintText: controller.selectHintText().value)),
                  SizedBox(width: SizeConfig.width * .03),
                  CRoundedButton(
                    kHeight: sizeXXXL,
                    kWidth: sizeXXXL,
                    borderRadius: radiusM,
                    widget: SvgPicture.asset(
                      filtersIcon,
                      color: defaultWhiteColor,
                    ),
                    color: defaultWhiteColor.withOpacity((0.1 / 2)),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.height * .03),

              ///Sekmelerin bulunduğu widget
              const _Tabs(),
              SizedBox(height: SizeConfig.height * .02),

              ///Sekmelerin sayfalarının bulunduğu widget
              Expanded(
                child: AnimatedIndexedStack(
                  index: controller.selectedTab.value,
                  children: const [_NftsView(), _CollectionsView(), _UsersView()],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
