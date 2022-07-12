import 'package:background_json_parser/background_json_parser.dart';

class TestUser extends IBaseModel<TestUser> {
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

  @override
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
