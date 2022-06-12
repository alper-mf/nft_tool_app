part of '../view/explore_view.dart';

class _RankListHome extends GetView<ExploreController> {
  const _RankListHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: (SizeConfig.height * .11) *
            (controller.coinRankList.length < 5 ? 5 : controller.coinRankList.length),
        margin: const EdgeInsets.fromLTRB(globalPadding, 0, globalPadding, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColorDark.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(generalRadius), topRight: Radius.circular(generalRadius)),
        ),
        child: Expanded(child: buildListView()),
      ),
    );
  }

  ListView buildListView() {
    var imageList = [
      'https://lh3.googleusercontent.com/POesFfbLX3KLQVs6ezfRM8AlQzZLlF9rvmdR5FURUt5IsBCwpw_LN6lqoeUrIoVI5dVDjpviUdDgLsmz7oOph7vB3pxpX1aJytLI=w600',
      'https://lh3.googleusercontent.com/1VgPVf_PBFJuHZB5DNd4-QogyKVj54wb4nEIMe_iCI8URxidbJmKn1fBRfRK80bo13eG4cPYAF5Zc1mj2ZMqdS-SoW5fcBjE0ujD=w600',
      'https://lh3.googleusercontent.com/yB0KEP8rw7Y9zvRNDAvlSV-GRj2UBZDOAeMcCZiBT5g2E_vjtaNFz61REuKJvH2fEMLXfl8I3rMi6kEZzkN3KcvJNWexhz3HV5NdAQ=w600',
      'https://lh3.googleusercontent.com/u-2FnHbaJ3U_KCDlmg2McX9Yfo7brsAzOffqihNXCGkHljA89SPPzwdjQiVSWcsvxCoj_ydBcDNCuZvHEekaYekaMEH4XX32k9US=w600',
    ];
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          CoinRankModel item = controller.coinRankList[index];
          var price = double.parse(item.usdPrice!);
          return SlideAnimation(
            itemCount: controller.coinRankList.length,
            position: index,
            slideDirection: SlideDirection.fromTop,
            animationController: controller.animationController,
            child: ExpansionTile(
              title: _ListTitle(
                item: item,
                price: price,
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
                          itemCount: imageList.length,
                          separatorBuilder: (context, int index) => Padding(
                              padding: EdgeInsets.only(
                            right: SizeConfig.width * .03,
                          )),
                          itemBuilder: (context, index) {
                            var e = imageList[index];
                            return SizedBox(
                              height: SizeConfig.height * .15,
                              width: SizeConfig.height * .15,
                              child: Image.network(
                                e,
                              ),
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
        itemCount: controller.coinRankList.length);
  }
}

class _ListTitle extends StatelessWidget {
  const _ListTitle({
    Key? key,
    required this.item,
    required this.price,
    required this.index,
  }) : super(key: key);

  final CoinRankModel item;
  final double price;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.name!,
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
                price.toString(),
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
