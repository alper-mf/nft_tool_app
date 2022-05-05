part of '../view/detail_view.dart';

class _TopInfoCard extends StatelessWidget {
  const _TopInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenHeight * .07,
              width: SizeConfig.screenHeight * .07,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: cardColorDark,
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.screenHeight * .013),
                child: SvgPicture.asset(
                  ethIcon,
                  color: globalTextWhiteColor.withOpacity(0.8),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * .02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bored Ape Yacht Club',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: globalTextWhiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.screenWidth * .035,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * .005,
                ),
                Text(
                  'APE',
                  style: TextStyle(
                    color: globalTextWhiteColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.screenWidth * .035,
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
              '\$14.250,00',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: globalTextWhiteColor,
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.screenWidth * .035,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .005,
            ),
            Text(
              '%2.20',
              style: TextStyle(
                color: globalTextWhiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.screenWidth * .035,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
