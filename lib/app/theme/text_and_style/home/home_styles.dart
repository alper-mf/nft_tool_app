import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/app/theme/colors/colors.dart';

class HomeStyles {
  HomeStyles._();

  static final TextStyle normalTexts = TextStyle(
    fontSize: SizeConfig.width * .04,
    color: textFirstColor,
  );

  static final TextStyle boldTexts = TextStyle(
      fontSize: SizeConfig.width * .04, color: textFirstColor, fontWeight: FontWeight.bold);
}
