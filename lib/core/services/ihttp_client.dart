import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nft_tool_app/app/constants/http_url.dart';

/// written this class for http client
///
abstract class IHttpClient {
  late final String baseUrl;

  /// http get method
  Future<http.Response?> get(
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
    String pathBody = '',
  }) async {
    if (pathBody != '') pathBody = '/$pathBody';
    final Uri uri;
    if (baseUrl == HttpUrl.baseUrl) {
      uri = Uri.http(baseUrl, method + pathBody, bodyParam);
    } else {
      uri = Uri.http(baseUrl, method + pathBody, bodyParam);
    }
    final response = await http.get(uri, headers: headerParam);
    return response;
  }

  /// http post method
  Future<http.Response?> post(
    String method, {
    required Map<String, dynamic> bodyParam,
    required Map<String, String>? headerParam,
  }) async {
    final encodedBody = json.encode(bodyParam);
    final Uri uri;
    if (baseUrl == HttpUrl.baseUrl) {
      uri = Uri.https(baseUrl, method);
    } else {
      uri = Uri.http(baseUrl, method);
    }
    final response = await http.post(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }

  /// http delete method
  Future<http.Response?> delete(
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
  }) async {
    final encodedBody = json.encode(bodyParam);
    final Uri uri;
    if (baseUrl == HttpUrl.baseUrl) {
      uri = Uri.https(baseUrl, method);
    } else {
      uri = Uri.http(baseUrl, method);
    }
    final response = await http.delete(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }

  /// http put method
  Future<http.Response?> put(
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
  }) async {
    final encodedBody = json.encode(bodyParam);
    final Uri uri;
    if (baseUrl == HttpUrl.baseUrl) {
      uri = Uri.https(baseUrl, method);
    } else {
      uri = Uri.http(baseUrl, method);
    }
    final response = await http.put(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }

  /// http put method
  Future<http.Response?> update(
    String method, {
    required Map<String, dynamic> bodyParam,
    required Map<String, String>? headerParam,
  }) async {
    final encodedBody = json.encode(bodyParam);
    final Uri uri;
    if (baseUrl == HttpUrl.baseUrl) {
      uri = Uri.https(baseUrl, method);
    } else {
      uri = Uri.http(baseUrl, method);
    }
    final response = await http.post(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }
}
