import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/constants/colors.dart';

class CRoundedButton extends StatelessWidget {
  final bool? isOutlined;
  final bool? isDisabled;
  final String? title;
  final Widget? widget;
  final Color? color;
  final VoidCallback onTap;
  final double? borderRadius;
  final double kHeight;
  final double? kWidth;
  const CRoundedButton({
    Key? key,
    this.isDisabled,
    this.isOutlined,
    this.color,
    this.title,
    this.widget,
    this.kWidth,
    this.borderRadius,
    required this.kHeight,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeight,
      width: kWidth,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double?>(0),
            backgroundColor: MaterialStateProperty.all(
              isDisabled == true
                  ? lightGrey
                  : isOutlined == true
                      ? Colors.transparent
                      : color ?? greenColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder?>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20)),
                  side: BorderSide(
                    color: isDisabled == true
                        ? lightGrey
                        : isOutlined == null
                            ? color ?? greenColor
                            : color!,
                    width: 1,
                  )),
            ),
          ),
          child: widget ??
              Text(
                title ?? 'Title or widget not added',
              )),
    );
  }
}
