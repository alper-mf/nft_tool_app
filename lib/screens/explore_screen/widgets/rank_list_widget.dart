part of '../view/explore_view.dart';

class _RankListHome extends GetView<ExploreController> {
  const _RankListHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loadingStatus != LoadingStatus.loaded) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }

      return Container(
        height: (SizeConfig.height * .11) *
            (controller.coinRankList.value.token!.length < 5
                ? 5
                : controller.coinRankList.value.token!.length),
        margin: const EdgeInsets.fromLTRB(globalPadding, 0, globalPadding, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColorDark.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(generalRadius), topRight: Radius.circular(generalRadius)),
        ),
        child: buildListView(),
      );
    });
  }

  ListView buildListView() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: ((context, index) {
          final item = controller.coinRankList.value.token![index];

          return SlideAnimation(
            itemCount: controller.coinRankList.value.token!.length,
            position: index,
            slideDirection: SlideDirection.fromTop,
            animationController: controller.animationController,
            child: ExpansionTile(
              title: _ListTitle(
                item: item,
                index: index,
              ),
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(paddingM, paddingM, 0, paddingM),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10 art from the collection',
                        style: TextStyle(
                          color: defaultTextWhitecolor.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height * .015,
                      ),
                      SizedBox(
                        height: SizeConfig.height * .15,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: item.rarestNfts!.length,
                          separatorBuilder: (context, int index) => Padding(
                              padding: EdgeInsets.only(
                            right: SizeConfig.width * .03,
                          )),
                          itemBuilder: (context, index) {
                            var e = item.rarestNfts![index];
                            return SizedBox(
                              height: SizeConfig.height * .15,
                              width: SizeConfig.height * .15,
                              child: Image.network(e.imageUrl!),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height * .015,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
        separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.only(top: 0)),
        itemCount: controller.coinRankList.value.token!.length);
  }
}

class _ListTitle extends StatelessWidget {
  const _ListTitle({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final Token item;

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.symbol!,
        style: TextStyle(fontSize: 14, color: defaultTextWhitecolor),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        'view info',
        style: TextStyle(fontSize: 12, color: defaultTextWhitecolor),
      ),
      trailing: SizedBox(
        width: Get.width * .21,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: SizeConfig.height * .025,
                width: SizeConfig.height * .025,
                child: SvgPicture.asset(
                  ethIcon,
                  color: Colors.white.withOpacity(0.5),
                )),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                double.parse(item.usdPrice!).toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: defaultTextWhitecolor),
              ),
            ),
          ],
        ),
      ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            (index + 1).toString() + '. ',
            style: TextStyle(fontSize: 12, color: defaultTextWhitecolor),
          ),
          const SizedBox(width: 5),
          SizedBox(
            height: 32,
            width: 32,
            child: item.imageUrl!.isVectorFileName
                ? SvgPicture.network(item.imageUrl!)
                : Image.network(item.imageUrl!),
          ),
        ],
      ),
    );
  }
}
