import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nft_tool_app/app/constants/http_url.dart';
import 'package:nft_tool_app/app/model/enums/http_enum.dart';

import 'ihttp_client.dart';
import '../exception/http_error_exception.dart';

/// written this class for http client
class HttpClient extends IHttpClient {
  HttpClient({String? baseUrl}) {
    if (baseUrl == null) {
      this.baseUrl = HttpUrl.baseUrl;
    } else {
      this.baseUrl = baseUrl;
    }
  }

  /// http get method
  Future<http.Response?> request(
    HttpMethod httpMethod,
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
    String pathBody = '',
  }) async {
    http.Response? response = await _request(
      httpMethod,
      method,
      headerParam,
      bodyParam,
      pathBody,
    ).catchError(_httpErrorHandler);
    _logS(baseUrl + '/' + method, headerParam, response!.body, bodyParam.toString());
    if (response.statusCode >= HttpStatus.clientClosedRequest &&
        response.statusCode < HttpStatus.networkConnectTimeoutError) {
      throw ServerError();
    }
    return response;
  }

  Future<http.Response?> _request(
    HttpMethod httpMethod,
    String method,
    Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam,
    String pathBody,
  ) async {
    final http.Response? response;
    switch (httpMethod) {
      case HttpMethod.get:
        response = await get(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
          pathBody: pathBody,
        );
        break;
      case HttpMethod.post:
        response = await post(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
      case HttpMethod.put:
        response = await put(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
      case HttpMethod.delete:
        response = await delete(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
      case HttpMethod.update:
        response = await update(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
    }
    return response;
  }

  _httpErrorHandler(error, stackTrace) {
    if (error is SocketException) {
      throw InternetError();
    } else if (error is FormatException) {
      throw HttpError();
    } else {
      throw HttpError();
    }
  }

  void _logS(String url, Map<String, String>? header, String responseBody, String requestBody) {
    log('_______________________________ Http Start ________________________________',
        name: 'Http');
    log('Api Request Url: ' + url);
    log('Header: ' + jsonEncode(header), name: 'Http');
    log('Request: ' + requestBody, name: 'Http');
    log('Rsponse: ' + responseBody, name: 'Http');
    log('________________________________ Http End _________________________________',
        name: 'Http');
  }
}
