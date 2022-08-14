import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/constants/padding_and_radius_const.dart';
import 'package:nft_tool_app/app/theme/text_and_style/general_style/my_text_style.dart';
import 'package:nft_tool_app/screens/home_screen/controller/home_controller.dart';

class OtpController extends GetxController {
  late final int? fields;
  late final RxList<String> _pins;
  late final RxList<FocusNode> _focusNodes;
  late final RxList<TextEditingController> _textEditingController;
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  OtpController([int? fieldCount]) {
    fields = fieldCount ?? 4;
    _pins = List.generate(fields!, (index) => '').obs;
    _focusNodes = List.generate(fields!, (index) => FocusNode()).obs;
    _textEditingController = List.generate(fields!, (index) => TextEditingController()).obs;
  }

  ///Pins get and setter controller.
  List<String> get pins => _pins;

  ///FocusNodes get and setter controller.
  List<FocusNode> get focusNode => _focusNodes;

  ///TextEditingController get and setter controller.
  List<TextEditingController> get textEditingController => _textEditingController;

  //Current Context
  BuildContext get context => Get.find<HomeController>().context;

  ///Ekranda gözükecek olan Text Fields ları oluşturur.
  Widget? textFieldGenerator() {
    List<Widget> _textFields =
        List.generate(fields!, (index) => buildField(index, context, index == 0));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: _textFields,
    );
  }

  ///TextField Oluşturur.
  Widget buildField(int index, BuildContext context, [bool autoFocus = false]) {
    final String? lastDigit = _textEditingController[index].text;
    _focusNodes[index].addListener(() {
      if (_focusNodes[index].hasFocus) {}
    });

    return Container(
      width: 50,
      margin: const EdgeInsets.only(right: paddingM),
      child: TextField(
        controller: _textEditingController[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        autofocus: autoFocus,
        style: s16w400Dark(context),
        focusNode: _focusNodes[index],
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: paddingM),
            filled: _pins[index].isNotEmpty ? true : false,
            fillColor: Colors.grey,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.blue,
            )),
            counterText: '',
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(radiusXS)),
            hintStyle:
                s12w700Dark(context).copyWith(fontSize: Get.width * .05, color: Colors.black38),
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusXS),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ))),
        onChanged: (String str) {
          _pins[index] = str;

          if (index + 1 != fields) {
            _focusNodes[index].unfocus();
            if (lastDigit != null && _pins[index] == '') {
              if (index != 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          } else {
            _focusNodes[index].unfocus();
            if (lastDigit != null && _pins[index] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            }
          }
          if (_pins.every((String? digit) => digit != null && digit != '')) {
            //widget.onSubmit(_pin.join());
            _pins.join();
          }
        },
        onSubmitted: (String str) {
          if (_pins.every((String? digit) => digit != null && digit != '')) {
            //    widget.onSubmit(_pin.join());
            _pins.join();
          }
        },
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
    for (var element in _textEditingController) {
      element.clear();
    }
    _pins.clear();
    _focusNodes.clear();
  }
}
