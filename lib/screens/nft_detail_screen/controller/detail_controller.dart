import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/bl/manage_request.dart';
import 'package:nft_tool_app/app/dialogs/loading/loading_progress.dart';
import 'package:nft_tool_app/app/model/enums/general_enums.dart';
import 'package:nft_tool_app/app/model/response/nft_detail.dart';
import 'package:nft_tool_app/app/model/status/base_http_model.dart';

class NftDetailController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  late Rx<LoadingStatus> _loadingStatus;
  late Rx<NftDetailModel> _nftDetailModel;
  late int nftId;

  NftDetailController(int id) {
    _loadingStatus = LoadingStatus.init.obs;
    _nftDetailModel = Rx(NftDetailModel());
    nftId = id;
  }

  //Loading Status Controller
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  //Current Context
  BuildContext get context => scaffoldKey.currentContext!;

  //Set and get NftDetailModel
  NftDetailModel get nftDetailModel => _nftDetailModel.value;

  set nftDetailModel(NftDetailModel model) {
    _nftDetailModel.firstRebuild;
    _nftDetailModel.value = model;
  }

  //Initialize Api Methods And Others
  Future<void> ready() async {
    try {
      loadingStatus = LoadingStatus.loading;
      LoadingProgress.showLoading(context);
      await Future.wait<void>(
        [
          _getNftDetail(),
        ],
      );
      loadingStatus = LoadingStatus.loaded;
      LoadingProgress.done(context);
    } on String catch (e) {
      loadingStatus = LoadingStatus.error;
      LoadingProgress.done(context);
      //  tryAgainMessage(e);
      log(e);
    } catch (e) {
      loadingStatus = LoadingStatus.error;
      LoadingProgress.done(context);
      log(e.toString());
      //  tryAgainMessage(AppLocalization.getLabels.defaultErrorMessage);
    } finally {
      log('Herşey OK');
    }
  }

  //Token listesini getirir.
  Future<void> _getNftDetail() async {
    BaseHttpModel response = await RequestManager().getNftDetailModel(nftId);
    if (response.status == BaseModelStatus.ok) {
      nftDetailModel = response.data;
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
