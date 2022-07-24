part of '../view/market_place_view.dart';

class _NftsView extends GetView<MarketPlaceController> {
  const _NftsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = 'https://img.seadn.io/files/486ffcefdee19440c2b80048ed0c4f4d.png?fit=max&w=600';
    return SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: SizeConfig.height * (.01 / 2.8) / 5),
            itemCount: 12,
            itemBuilder: (context, index) {
              return _NftCard(
                url: text,
                nftName: 'Azuki #2027',
                owner: 'Azuki',
                priceType: 'ETH',
                price: 0.02,
                highestBid: 0.03,
                nftId: 1,
                onTap: (i) => controller.onTapNft(1),
              );
            }));
  }
}

class _NftCard extends StatelessWidget {
  const _NftCard({
    Key? key,
    this.url,
    this.nftName,
    this.owner,
    this.price,
    this.priceType,
    this.highestBid,
    this.onTap,
    this.nftId,
  }) : super(key: key);

  final String? url;
  final String? owner;
  final String? nftName;
  final double? price;
  final String? priceType;
  final double? highestBid;
  final int? nftId;
  final Function(int nftId)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(nftId!),
      splashColor: greenColor,
      hoverColor: greenColor,
      child: Container(
        padding: const EdgeInsets.all(paddingXS),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusXXS),
            border: Border.all(color: defaultWhiteColor.withOpacity(0.2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radiusXXS),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(url!),
                    )),
              ),
            ),
            SizedBox(height: SizeConfig.height * .01),
            Text(
              owner ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MarketStyles.boldTexts(context).copyWith(
                color: defaultWhiteColor.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            Text(
              nftName ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MarketStyles.boldTexts(context)
                  .copyWith(color: defaultWhiteColor.withOpacity(0.8)),
            ),
            SizedBox(height: SizeConfig.height * .01),
            GlassWidget(
                sigma: 8,
                radius: radiusXXXS,
                padding: 0,
                widget: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Price',
                            style: MarketStyles.boldTexts(context).copyWith(
                              color: defaultWhiteColor.withOpacity(0.5),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            price.toString(),
                            style: MarketStyles.boldTexts(context).copyWith(
                              color: defaultWhiteColor.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Highest Bid',
                            style: MarketStyles.boldTexts(context).copyWith(
                              color: defaultWhiteColor.withOpacity(0.5),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            highestBid.toString(),
                            style: MarketStyles.boldTexts(context).copyWith(
                              color: defaultWhiteColor.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
