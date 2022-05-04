part of '../view/explore_view.dart';

class _RankListHome extends GetView<ExploreController> {
  const _RankListHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(globalPadding, 0, globalPadding, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(generalRadius), topRight: Radius.circular(generalRadius)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Obx(
                () => ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      CoinRankModel item = controller.coinRankList[index];
                      var price = double.parse(item.usdPrice!);
                      return SlideAnimation(
                        itemCount: controller.coinRankList.length,
                        position: index,
                        slideDirection: SlideDirection.fromTop,
                        animationController: controller.animationController,
                        child: ListTile(
                          title: Text(
                            item.name!,
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: const Text(
                            'view info',
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: SizedBox(
                            width: Get.width * .21,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 14,
                                    width: 14,
                                    child: SvgPicture.asset(
                                      ethIcon,
                                      color: Colors.white.withOpacity(0.5),
                                    )),
                                const SizedBox(width: 5),
                                Text(
                                  price.toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                (index + 1).toString() + '. ',
                                style: const TextStyle(fontSize: 12),
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
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.only(top: 0)),
                    itemCount: controller.coinRankList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
