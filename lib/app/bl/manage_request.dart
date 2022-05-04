import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/status/http_status.dart';

import 'package:nft_tool_app/app/model/abstract_base_model.dart';
import 'package:nft_tool_app/app/model/enums/general_enums.dart';
import 'package:nft_tool_app/app/model/header/session_header_model.dart';

import 'package:nft_tool_app/app/model/status/base_http_model.dart';
import 'package:nft_tool_app/core/services/http_client_service.dart';

class RequestManager extends SessionHeaderModel {
  RequestManager() : super(token: 'TOKEN EKLENECEK');

  Future<BaseHttpModel> getMethod<T extends IBaseModel, C extends IBaseModel>(
      T model, C errorModel, String endPointUrl) async {
    try {
      var response = await HttpClientService().get(endPointUrl, header: createHeader());
      if (response!.statusCode == HttpStatus.ok) {
        T responseModel = await model.jsonParser(jsonDecode(utf8.decode(response.bodyBytes)));
        return BaseHttpModel<T>(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        C responseModel = await errorModel.backgroundJsonParser(response.bodyBytes);

        return BaseHttpModel<C>(status: BaseModelStatus.Error, data: responseModel);
      }
    } catch (e) {
      log(e.toString(), name: '🚨 Api Error: getMethod 🚨');
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel> getListMethod<T extends IBaseModel, C extends IBaseModel>(
      T model, C errorModel, String endPointUrl) async {
    try {
      var response = await HttpClientService().get(endPointUrl, header: createHeader());
      if (response!.statusCode == HttpStatus.ok) {
        List<T> responseModel = await model
            .jsonParser(jsonDecode(utf8.decode(response.bodyBytes)).map<T>((el) => model.fromJson(el)).toList());
        return BaseHttpModel<List<T>>(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        C responseModel = await errorModel.backgroundJsonParser(response.bodyBytes);

        return BaseHttpModel<C>(status: BaseModelStatus.Error, data: responseModel);
      }
    } catch (e) {
      log(e.toString(), name: '🚨 Api Error: getMethod 🚨');
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel> postMethod<T extends IBaseModel, C extends IBaseModel>(
      T model, C errorModel, String endPointUrl, Map<String, dynamic> body) async {
    try {
      var response = await HttpClientService().post(
        endPointUrl,
        header: createHeader(),
        apiParameters: body,
      );
      if (response!.statusCode == HttpStatus.ok) {
        T responseModel = await model.backgroundJsonParser(response.bodyBytes);
        return BaseHttpModel<T>(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        C responseModel = await errorModel.backgroundJsonParser(response.bodyBytes);

        return BaseHttpModel<C>(status: BaseModelStatus.Error, data: responseModel);
      }
    } catch (e) {
      log(e.toString(), name: 'Api Error: postMethodError');
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }
}
