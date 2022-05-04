import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nft_tool_app/app/constants/http_url.dart';

/// written this class for http client
class HttpClientService {
  final Map<String, String> headers = {
    'content-type': 'application/json',
    'authorization': 'Bearer ' + (''),
    'lang': 'tr'
  };

  /// http get method
  /// [body] Request body
  /// [apiParameters] Request body e dönştürülecek
  /// [body] var ise body body olarak geçerli olacak null ise [apiParameters] yi alıp dönüştürecek
  Future<http.Response?> get(String method,
      {Map<String, dynamic> apiParameters = const {}, Map<String, String>? header, String body = ''}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    //if there is internet
    if (body == '' && apiParameters.isNotEmpty) {
      var bodyValue = '';
      //we convert the parameters in maps to get mathod
      apiParameters.forEach((key, value) {
        bodyValue += '&' + key.toString() + '=' + value.toString();
      });
      //we delete the first character
      if (bodyValue != '') bodyValue = bodyValue.substring(1);
      bodyValue = bodyValue.replaceAll('(', '');
      bodyValue = bodyValue.replaceAll(')', '');
      body = '?' + bodyValue;
    } else if (body != '') {
      body = '/' + body;
    }
    // Sends an HTTP get
    //print('[GET ⬅️]' + HttpUrl.baseUrl + method + body);
    var response = await http.get(Uri.parse(HttpUrl.baseUrl + method + body), headers: header);
    return response;
  }

  /// http post method
  Future<http.Response?> post(String method,
      {required Map<String, dynamic> apiParameters, Map<String, String>? header}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    //we convert the map to json
    var encodedBody = json.encode(apiParameters);

    // Sends an HTTP POST
    var response = await http.post(Uri.parse(HttpUrl.baseUrl + method),
        headers: header, body: encodedBody, encoding: Encoding.getByName('application/json'));
    //returns the resulting Json object.
    //  var responseBody = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      //print(response.body);
      return response;
    } else if (response.statusCode > 200 || response.statusCode < 500) {
      return response;
    } else {
      throw Exception('[POST ERROR ⛑ ] ${response.statusCode},${response.body}');
    }
  }

  /// http delete method
  Future<http.Response?> delete(String method,
      {required Map<String, dynamic> apiParameters, Map<String, String>? header}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    String body = '';
    apiParameters.forEach((key, value) {
      body += '&' + key.toString() + '=' + value.toString();
    });
    //we delete the first character
    if (body != '') body = body.substring(1);
    body = body.replaceAll('(', '');
    body = body.replaceAll(')', '');
    var response = await http.delete(Uri.parse(HttpUrl.baseUrl + method + '?' + body), headers: header);
    return response;
  }

  /// http put method
  Future<http.Response?> put(String method, {required dynamic apiParameters, Map<String, String>? header}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    //if there is internet
    //we convert the map to json
    var encodedBody = json.encode(apiParameters);
    // Sends an HTTP put
    var response = await http.put(Uri.parse(HttpUrl.baseUrl + method),
        headers: header, body: encodedBody, encoding: Encoding.getByName('application/json'));

    if (kDebugMode) {
      print('[PUT 👉]' + HttpUrl.baseUrl + method);
    }
    return response;
  }

  /// http put method
  Future<http.Response?> update(String method,
      {required Map<String, dynamic> apiParameters, Map<String, String>? header}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    //we convert the map to json
    var encodedBody = json.encode(apiParameters);
    // Sends an HTTP put
    var response = await http.post(Uri.parse(HttpUrl.baseUrl + method),
        headers: header, body: encodedBody, encoding: Encoding.getByName('application/json'));
    return response;
  }
}
