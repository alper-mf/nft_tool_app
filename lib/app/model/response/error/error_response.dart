// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'package:background_json_parser/background_json_parser.dart';

class ErrorModel extends IBaseModel<ErrorModel> {
  ErrorModel({
    this.errorCode,
    this.message,
  });

  String? errorCode;
  String? message;

  @override
  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "message": message,
      };

  @override
  ErrorModel fromJson(Map<String, dynamic> json) => ErrorModel(
        errorCode: json["error_code"],
        message: json["message"],
      );
}
