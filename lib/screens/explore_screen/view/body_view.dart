part of './explore_view.dart';

class _BodyView extends GetView<ExploreController> {
  const _BodyView({
    Key? key,
    required this.searchBarTextEditingController,
    required this.chipList,
  }) : super(key: key);

  final TextEditingController searchBarTextEditingController;
  final List<String> chipList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * .15),
            const _HomeTitleWidget(),
            SearchBarWidget(textEditingController: searchBarTextEditingController),
            ChipList(chipList: chipList),
            const SizedBox(height: 15),
            const _RankListHome(),
          ],
        ),
      ),
    );
  }
}
