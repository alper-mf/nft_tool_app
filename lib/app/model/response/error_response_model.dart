import '../abstract_base_model.dart';

class ErrorResponseModel extends IBaseModel {
  String? message;

  @override
  fromJson(Map json) {
    throw UnimplementedError();
  }
}
