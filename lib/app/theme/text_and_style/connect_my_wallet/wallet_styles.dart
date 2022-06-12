import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/theme/colors/colors.dart';

class WalletTextStyles {
  WalletTextStyles._();

  static final TextStyle normalTexts = TextStyle(
    fontSize: SizeConfig.width * .04,
    color: defaultWhiteColor,
  );

  static final TextStyle boldTexts = TextStyle(
      fontSize: SizeConfig.width * .04, color: defaultWhiteColor, fontWeight: FontWeight.bold);

  static final TextStyle h2 = TextStyle(
      fontSize: SizeConfig.width * .06, color: textFirstColor, fontWeight: FontWeight.bold);

  static final TextStyle dialogTitle = TextStyle(
      fontSize: SizeConfig.width * .04, color: themeFirstColor, fontWeight: FontWeight.bold);

  static final TextStyle sheetTitle = TextStyle(
    fontSize: SizeConfig.width * .04,
    color: defaultWhiteColor.withOpacity(0.7),
  );
  static final TextStyle sheetSubtitle = TextStyle(
    fontSize: SizeConfig.width * .03,
    color: defaultWhiteColor.withOpacity(0.6),
  );
}
