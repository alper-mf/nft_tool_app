import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/theme/text_and_style/general_style/my_text_style.dart';

class MarketStyles {
  static TextStyle normalTexts(BuildContext context) => s12w400Dark(context).copyWith(fontSize: 12);

  static TextStyle boldTexts(BuildContext context) =>
      s16w700Dark(context).copyWith(fontSize: 16, fontWeight: FontWeight.w700);
}
