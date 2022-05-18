import 'package:flutter/material.dart';

class ExpandedEventItem extends StatelessWidget {
  final double? topMargin;
  final double? leftMargin;
  final double? height;
  final bool? isVisible;
  final double? borderRadius;
  final String? title;
  final String? date;

  const ExpandedEventItem({
    Key? key,
    this.topMargin,
    this.height,
    this.isVisible,
    this.borderRadius,
    this.title,
    this.date,
    this.leftMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isVisible!
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: height!).add(const EdgeInsets.all(8)),
                child: _buildContent(),
              )
            : const SizedBox(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Text(title!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            )),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            Text(
              '1 ticket',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date!,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: <Widget>[
            Icon(
              Icons.place,
              color: Colors.grey.shade400,
              size: 16,
            ),
            Text(
              'Science Park 10 25A',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 13,
              ),
            )
          ],
        )
      ],
    );
  }
}
