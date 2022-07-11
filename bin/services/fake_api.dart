import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

import 'api_models.dart';

class FakeApi implements ApiModels {
  @override
  Future<String> getCategoryList(String url) async {
    final targetFile = File(path.join(path.dirname(Platform.script.toFilePath()), url));

    if (await targetFile.exists()) return await targetFile.readAsString();

    return 'Error';
  }
}
