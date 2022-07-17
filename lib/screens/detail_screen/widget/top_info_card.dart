part of '../view/detail_view.dart';

class _TopInfoCard extends StatelessWidget {
  final String text =
      'Azuki starts with a collection of 10,000 avatars that give you membership access to The Garden: a corner of the internet where artists, builders, and web3 enthusiasts meet to create a decentralized future. Azuki holders receive access to exclusive drops, experiences, and more.';
  const _TopInfoCard({
    Key? key,
  }) : super(key: key);

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
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.height * .013),
                    child: SvgPicture.asset(
                      ethIcon,
                      color: defaultTextWhitecolor.withOpacity(0.8),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.width * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Azuki',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: defaultTextWhitecolor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.width * .045,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * .005,
                    ),
                    Text(
                      'Creator',
                      style: TextStyle(
                        color: defaultTextWhitecolor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.width * .035,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Azuki #6184',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: defaultTextWhitecolor,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.width * .045,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height * .005,
                ),
                Text(
                  '%2.20',
                  style: TextStyle(
                    color: defaultTextWhitecolor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.width * .035,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: SizeConfig.height * .03),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: TextStyle(color: defaultTextWhitecolor),
        )
      ],
    );
  }
}
