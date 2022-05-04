import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/constants/colors.dart';

class ChipList extends StatelessWidget {
  const ChipList({
    Key? key,
    required this.chipList,
  }) : super(key: key);

  final List<String> chipList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
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
  const _ChipWidget({Key? key, this.text, this.index}) : super(key: key);

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
        color: index! == 0 ? Colors.green : chipDefaultColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
