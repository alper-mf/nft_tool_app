part of '../view/explore_view.dart';

class _HomeTitleWidget extends StatelessWidget {
  const _HomeTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(globalPadding, 0, globalPadding, 0),
      child: Text(
        'Explore Collection',
        style: TextStyle(
          fontSize: Get.width * .085,
          fontWeight: FontWeight.w500,
          color: defaultTextWhitecolor.withOpacity(0.8),
        ),
      ),
    );
  }
}
