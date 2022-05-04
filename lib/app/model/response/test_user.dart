import 'package:nft_tool_app/app/model/abstract_base_model.dart';

class TestUser extends IBaseModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  TestUser({this.userId, this.id, this.title, this.body});

  TestUser.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  TestUser fromJson(Map json) {
    return TestUser.fromJson(json);
  }
}
