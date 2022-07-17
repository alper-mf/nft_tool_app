import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:nft_tool_app/app/constants/http_url.dart';
import 'package:nft_tool_app/app/model/enums/general_enums.dart';
import 'package:nft_tool_app/app/model/enums/http_enum.dart';
import 'package:nft_tool_app/app/model/header/session_header_model.dart';
import 'package:nft_tool_app/app/model/response/categories.dart';
import 'package:nft_tool_app/app/model/response/coin_rank_list.dart';
import 'package:nft_tool_app/app/model/response/nft_detail.dart';
import 'package:nft_tool_app/app/model/status/base_http_model.dart';
import 'package:nft_tool_app/core/exception/http_error_exception.dart';
import 'package:nft_tool_app/core/services/http_client.dart';

class RequestManager extends SessionHeaderModel {
  RequestManager() : super(token: 'TOKEN EKLENECEK');

  ///Home Categori Listesi Çekilir
  Future<BaseHttpModel<CategoriesModel>> getCategories() async {
    try {
      var response = await HttpClient()
          .request(HttpMethod.get, HttpUrl.categories, headerParam: createHeader());

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = await CategoriesModel().backgroundJsonParser(response.body);
        return BaseHttpModel<CategoriesModel>(status: BaseModelStatus.ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.notFound) {
        return BaseHttpModel(status: BaseModelStatus.notFound);
      } else {
        //ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(response.body));
        return BaseHttpModel(status: BaseModelStatus.error, message: response.body);
      }
    } on HttpError catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }

  ///Home Token Listesi Çekilir
  Future<BaseHttpModel<CoinRankModel>> getTokenList() async {
    try {
      var response = await HttpClient()
          .request(HttpMethod.get, HttpUrl.tokenList, headerParam: createHeader());

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = await CoinRankModel().backgroundJsonParser(response.body);
        return BaseHttpModel<CoinRankModel>(status: BaseModelStatus.ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.notFound) {
        return BaseHttpModel(status: BaseModelStatus.notFound);
      } else {
        //ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(response.body));
        return BaseHttpModel(status: BaseModelStatus.error, message: response.body);
      }
    } on HttpError catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }

  ///Get NFT Detail model
  Future<BaseHttpModel<NftDetailModel>> getNftDetailModel(int nftId) async {
    try {
      var response = await HttpClient()
          .request(HttpMethod.get, HttpUrl.nftDetail(nftId), headerParam: createHeader());

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = await NftDetailModel().backgroundJsonParser(response.body);
        return BaseHttpModel<NftDetailModel>(status: BaseModelStatus.ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.notFound) {
        return BaseHttpModel(status: BaseModelStatus.notFound);
      } else {
        return BaseHttpModel(status: BaseModelStatus.error, message: response.body);
      }
    } on HttpError catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }
}
