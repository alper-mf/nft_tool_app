import 'package:nft_tool_app/app/model/enums/general_enums.dart';

class BaseHttpModel<T> {
  BaseModelStatus status;
  T? data;
  String? message;
  String? errorCode;

  BaseHttpModel({required this.status, this.data, this.message, this.errorCode});
}
