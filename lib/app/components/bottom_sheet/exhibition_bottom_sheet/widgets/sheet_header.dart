part of '../view/exhibition_view.dart';

class _SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  final String title;

  const _SheetHeader(
      {Key? key, required this.fontSize, required this.topMargin, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
