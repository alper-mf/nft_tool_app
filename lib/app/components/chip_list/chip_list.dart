import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

class ChipList extends StatelessWidget {
  final Color? selectedColor;
  final Color? backgroundColor;
  const ChipList({
    Key? key,
    required this.chipList,
    this.selectedColor,
    this.backgroundColor,
  }) : super(key: key);

  final List<String> chipList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * .05,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 15),
        scrollDirection: Axis.horizontal,
        itemCount: chipList.length,
        itemBuilder: (context, index) {
          String item = chipList[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: _ChipWidget(
              text: item,
              index: index,
              color: backgroundColor,
            ),
          );
        },
      ),
    );
  }
}

class _ChipWidget extends StatelessWidget {
  final String? text;
  final int? index;
  final Color? color;
  const _ChipWidget({Key? key, this.text, this.index, this.color = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          text!,
          style: const TextStyle(fontSize: 12),
        ),
      ),
      decoration: BoxDecoration(
        color: index! == 2 ? Colors.green : color ?? chipDefaultColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
