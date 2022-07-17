part of '../view/detail_view.dart';

class _RarirtyProperties extends StatelessWidget {
  final List<Rarirty> rarirtyList;
  const _RarirtyProperties({Key? key, required this.rarirtyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Properties',
            style: s14w700Dark(context).copyWith(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.width * .045,
              color: defaultTextWhitecolor.withOpacity(0.7),
            )),
        SizedBox(height: SizeConfig.height * .02),
        Wrap(
          runSpacing: SizeConfig.height * .02,
          spacing: SizeConfig.width * .04,
          children: List.generate(rarirtyList.length, (index) {
            final item = rarirtyList[index];
            return Container(
              padding: const EdgeInsets.all(paddingM),
              decoration: BoxDecoration(
                  border: Border.all(color: lightGrey),
                  borderRadius: const BorderRadius.all(Radius.circular(radiusM))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.traitType!.toUpperCase(),
                    style: s12w400Dark(context).copyWith(fontSize: SizeConfig.height * .015),
                  ),
                  SizedBox(height: SizeConfig.height * (.01 / 2)),
                  Text(
                    item.value!.capitalizeFirst!,
                    style: s14w700Dark(context).copyWith(
                      fontSize: SizeConfig.height * .02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.height * (.01 / 2)),
                  Text(
                    item.rarirtyPercent! + ' rarirty',
                    style: s12w400Dark(context).copyWith(
                        fontSize: SizeConfig.height * .018,
                        fontWeight: FontWeight.bold,
                        color: defaultTextWhitecolor.withOpacity(0.7)),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
