import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'api_models.dart';

class FakeApi implements ApiModels {
  String errorMessage(String val) {
    return '''{
        "title": "Error",
        "message": $val
      }''';
  }

  @override
  Future<String> getString(String url) async {
    final targetFile = File(path.join(path.dirname(Platform.script.toFilePath()), url));
    try {
      return await targetFile.readAsString();
    } catch (e) {
      return errorMessage(e.toString());
    }
  }
}
