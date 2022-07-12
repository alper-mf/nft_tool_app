import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/bl/manage_request.dart';
import 'package:nft_tool_app/app/dialogs/loading/loading_progress.dart';
import 'package:nft_tool_app/app/model/enums/general_enums.dart';
import 'package:nft_tool_app/app/model/response/coin_rank_list.dart';
import 'package:nft_tool_app/app/model/status/base_http_model.dart';
import 'package:nft_tool_app/screens/home_screen/controller/home_controller.dart';

class ExploreController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final Rx<CoinRankModel> coinRankList = Rx(CoinRankModel());
  late Rx<LoadingStatus> _loadingStatus;

  ExploreController() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _loadingStatus = LoadingStatus.init.obs;
  }

  //Loading Status Controller
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  //Current Context
  BuildContext get context => Get.find<HomeController>().context;

  //Initialize Api Methods And Others
  Future<void> ready() async {
    try {
      loadingStatus = LoadingStatus.loading;
      LoadingProgress.showLoading(context);
      await Future.wait<void>(
        [
          _getCategories(),
          _getTokenList(),
        ],
      );
      loadingStatus = LoadingStatus.loaded;
      LoadingProgress.done(context);
    } on String catch (e) {
      loadingStatus = LoadingStatus.error;
      LoadingProgress.done(context);
      //  tryAgainMessage(e);
      print(e);
    } catch (e) {
      loadingStatus = LoadingStatus.error;
      LoadingProgress.done(context);
      print(e);
      //  tryAgainMessage(AppLocalization.getLabels.defaultErrorMessage);
    } finally {
      print('Herşey OK');
    }
  }

  //Kategori listesini getirir.
  Future<void> _getCategories() async {
    BaseHttpModel response = await RequestManager().getCategories();
    if (response.status == BaseModelStatus.ok) {
      //  userInfo = response.data;
      //Get.find<SessionService>().setUserInfo(userInfo);
    } else {
      throw response.message ?? 'Kategori çekilemedi.';
    }
  }

  //Token listesini getirir.
  Future<void> _getTokenList() async {
    BaseHttpModel response = await RequestManager().getTokenList();
    if (response.status == BaseModelStatus.ok) {
      coinRankList.value = response.data;
    } else {
      throw response.message ?? 'Token çekilemedi.';
    }
  }

  @override
  void onReady() {
    super.onReady();
    ready();
  }
}
