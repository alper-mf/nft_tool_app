import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nft_tool_app/screens/auth/otp_screen/controller/otp_controller.dart';
import 'package:nft_tool_app/screens/auth/otp_screen/view/otp_view.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OtpController(),
      builder: (_) => const OtpView(),
    );
  }
}
