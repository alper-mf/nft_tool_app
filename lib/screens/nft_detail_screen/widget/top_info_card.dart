part of '../view/detail_view.dart';

class _TopInfoCard extends StatelessWidget with NftDetailsStyles {
  final ItemDetail itemDetail;
  const _TopInfoCard({Key? key, required this.itemDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.height * .07,
                  width: SizeConfig.height * .07,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: cardColorDark,
                  ),
                  child: ClipOval(child: ImageNetworkViewer(imageUrl: itemDetail.ownerLogo!)),
                ),
                SizedBox(width: SizeConfig.width * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemDetail.owner ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: s14w700Dark(context).copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: SizeConfig.height * .005,
                    ),
                    Text(
                      itemDetail.isCreator != null
                          ? itemDetail.isCreator!
                              ? 'Creator'
                              : 'Owner'
                          : 'Creator',
                      style: s12w400Dark(context)
                          .copyWith(color: defaultTextWhitecolor.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${itemDetail.owner} #${itemDetail.nftNumber} ',
                    overflow: TextOverflow.ellipsis,
                    style: s14w700Dark(context).copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: SizeConfig.height * .005,
                ),
                Text('%2.20',
                    style: s12w400Dark(context)
                        .copyWith(color: defaultTextWhitecolor.withOpacity(0.5))),
              ],
            ),
          ],
        ),
        SizedBox(height: SizeConfig.height * .03),
        Text(
          itemDetail.description ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: s12w400Dark(context).copyWith(color: defaultTextWhitecolor.withOpacity(0.9)),
        )
      ],
    );
  }
}
