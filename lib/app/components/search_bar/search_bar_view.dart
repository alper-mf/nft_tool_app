import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_tool_app/app/components/search_bar/controller/search_bar_controller.dart';
import 'package:nft_tool_app/app/constants/assets_const.dart';
import 'package:nft_tool_app/app/constants/colors.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  const SearchBarWidget({Key? key, this.textEditingController, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchBarController>(
      init: SearchBarController(textEditingController!),
      builder: (controller) => Container(
          height: 50,
          decoration: BoxDecoration(
              color: searchBarBackgroundColor,
              borderRadius: BorderRadius.circular(radiusM),
              border: Border.all(
                width: 1,
                color: searchBarBorderColor,
              )),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 10),
              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.iconVisibility.value
                      ? const SizedBox()
                      : SizedBox(
                          height: 24,
                          width: 24,
                          child: AnimatedBuilder(
                              animation: controller.animationController!,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(
                                      0,
                                      controller.iconVisibility.value
                                          ? -controller.animationController!.value * -10
                                          : controller.animationController!.value * 10),
                                  child: AnimatedOpacity(
                                    opacity: controller.iconVisibility.value ? 0 : 1,
                                    duration: const Duration(milliseconds: 500),
                                    child: SvgPicture.asset(
                                      searchIcon,
                                      color: searchBarSuffixIconColor,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                );
                              }),
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.w200, color: searchBarTextColor),
                    controller: controller.searchbarTextEditingController,
                    onChanged: (value) => controller.iconAnimationTrigger(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText ?? '',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          color: searchBarHintTextColor,
                        )),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 24,
                width: 24,
                child: AnimatedBuilder(
                    animation: controller.animationController!,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                            0,
                            10 -
                                (!controller.iconVisibility.value
                                    ? -controller.animationController!.value * -10
                                    : controller.animationController!.value * 10)),
                        child: AnimatedOpacity(
                            opacity: controller.iconVisibility.value ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: InkWell(
                              onTap: () => controller.cleanButtonTap(),
                              child: Icon(
                                Icons.close,
                                color: searchBarSuffixIconColor,
                              ),
                            )),
                      );
                    }),
              ),
              const SizedBox(width: 10),
            ],
          )),
    );
  }
}
