import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_tool_app/app/dialogs/loading/loading_progress.dart';
import 'package:nft_tool_app/app/model/enums/general_enums.dart';

class MarketPlaceController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  late Rx<LoadingStatus> _loadingStatus;
  final RxInt selectedTab = 0.obs;

  late TextEditingController searchBarTextEditingController;

  MarketPlaceController() {
    _loadingStatus = LoadingStatus.init.obs;
    searchBarTextEditingController = TextEditingController();
  }

  //Loading Status Controller
  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  //Current Context
  BuildContext get context => scaffoldKey.currentContext!;

  //Initialize Api Methods And Others
  Future<void> ready() async {
    try {
      loadingStatus = LoadingStatus.loading;
      LoadingProgress.showLoading(context);
      await Future.wait<void>(
        [
          //
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

  //Tab index set etmek için kullanılır.
  selectTab(int index) => selectedTab.value = index;

  //Select Search Hint Text
  RxString selectHintText() {
    if (selectedTab.value == 0) return 'Search by NFTs'.obs;
    if (selectedTab.value == 1) return 'Search by Collections'.obs;
    if (selectedTab.value == 2) return 'Search by Users'.obs;
    return ''.obs;
  }

  @override
  void onReady() {
    super.onReady();
    ready();
  }
}
