import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_tool_app/app/extensions/extension_regex.dart';

class ImageNetworkViewer extends StatelessWidget {
  final String imageUrl;
  const ImageNetworkViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !imageUrl.isSvg()
        ? Image.network(
            imageUrl,
            fit: BoxFit.cover,
          )
        : SvgPicture.network(
            imageUrl,
            fit: BoxFit.cover,
          );
  }
}
