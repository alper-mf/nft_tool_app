part of '../view/detail_view.dart';

class _BottomButtons extends StatelessWidget {
  final int? buyPrice;
  final VoidCallback? buyOnTap;
  final VoidCallback? placeAbidOnTap;
  const _BottomButtons({Key? key, this.buyPrice, this.buyOnTap, this.placeAbidOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * .12,
      child: GlassWidget(
          sigma: 14,
          radius: 0,
          padding: paddingXL,
          widget: Row(
            children: [
              Expanded(
                child: CRoundedButton(
                  borderRadius: radiusS,
                  kHeight: SizeConfig.height * .067,
                  title: 'Buy for $buyPrice ETH',
                  onTap: buyOnTap!,
                ),
              ),
              SizedBox(width: SizeConfig.width * .03),
              Expanded(
                child: CRoundedButton(
                  borderRadius: radiusS,
                  kHeight: SizeConfig.height * .067,
                  color: searchBarBorderColor,
                  title: 'Place a bid',
                  onTap: placeAbidOnTap!,
                ),
              ),
            ],
          )),
    );
  }
}
