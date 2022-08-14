part of '../view/market_place_view.dart';

class SearchAndFilterButton extends StatelessWidget {
  const SearchAndFilterButton({
    Key? key,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 4,
            child:
                SearchBarWidget(textEditingController: textEditingController, hintText: hintText)),
        SizedBox(width: SizeConfig.width * .03),
        CRoundedButton(
          kHeight: sizeXXXL,
          kWidth: sizeXXXL,
          borderRadius: radiusS,
          widget: SvgPicture.asset(
            filtersIcon,
            color: defaultWhiteColor,
          ),
          color: defaultWhiteColor.withOpacity((0.1 / 2)),
          onTap: () {},
        ),
      ],
    );
  }
}
