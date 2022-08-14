import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nft_tool_app/app/init/size_config.dart';
import 'package:nft_tool_app/screens/auth/otp_screen/controller/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Obx(
        () => Container(
            height: SizeConfig.height,
            width: SizeConfig.width,
            color: Colors.transparent,
            child: Column(
              children: [
                controller.textFieldGenerator()!,
                ElevatedButton(
                    onPressed: () {
                      print(controller.pins.join());
                    },
                    child: Text('Button')),
              ],
            )),
      ),
    );
  }
}
