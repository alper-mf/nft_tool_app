part of '../view/market_place_view.dart';

class _Tabs extends GetView<MarketPlaceController> {
  const _Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          _SelectedTab(
            index: 0,
            selectedIndex: controller.selectedTab.value,
            tabText: 'NFTs',
            onTap: () => controller.selectTab(0),
          ),
          SizedBox(width: SizeConfig.width * .03),
          _SelectedTab(
            index: 1,
            selectedIndex: controller.selectedTab.value,
            tabText: 'Collections',
            onTap: () => controller.selectTab(1),
          ),
          SizedBox(width: SizeConfig.width * .03),
          _SelectedTab(
            index: 2,
            selectedIndex: controller.selectedTab.value,
            tabText: 'Users',
            onTap: () => controller.selectTab(2),
          ),
        ],
      ),
    );
  }
}

class _SelectedTab extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String tabText;
  final VoidCallback onTap;
  const _SelectedTab(
      {Key? key,
      required this.index,
      required this.selectedIndex,
      required this.tabText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.black.withOpacity(0.2),
        child: GlassWidget(
          sigma: 12,
          radius: 1,
          padding: 0,
          color: index != selectedIndex ? Colors.transparent : null,
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: sizeXXXL,
                child: Center(
                    child: Text(
                  tabText,
                  style: MarketStyles.normalTexts(context),
                )),
              ),
              Container(
                height: 2,
                color: defaultWhiteColor.withOpacity(index != selectedIndex ? (0.1 / 2) : 0.3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
