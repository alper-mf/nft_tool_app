import 'package:flutter/material.dart';
import 'package:nft_tool_app/app/constants/padding_const.dart';
import 'package:nft_tool_app/app/extensions/widget_extension.dart';
import 'package:nft_tool_app/app/init/size_config.dart';

/// Drawer - turkcell icon - masa icon şekinde işletme ekranının appbarı
///
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleWidget;
  final String? title;
  final double? elevation;
  final Widget? actionWidget;
  final Widget? actionLeading;
  final double? actionPadding;
  final String? imageURL;
  final Key? appBarKey;
  final double? leadingWidth;
  final Color? backgroundColor;

  const MyAppBar({
    Key? key,
    this.titleWidget,
    this.elevation,
    this.title,
    this.backgroundColor,
    this.imageURL,
    this.actionWidget,
    this.actionPadding,
    this.actionLeading,
    this.appBarKey,
    this.leadingWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      key: appBarKey,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      leading: actionLeading,
      title: title != null
          ? Text(title!)
          : titleWidget ??
              Image.network(
                imageURL!,
                height: (SizeConfig.appBarHeight / 100) * 58,
              ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: actionPadding ?? globalPadding),
          child: actionWidget,
        ).isVisible(actionWidget != null),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
