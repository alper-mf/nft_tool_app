import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:nft_tool_app/screens/explore_screen/cubit/explore_repository.dart';
import '../../../app/model/response/test_model.dart';
part 'explore_screen_state.dart';

class ExploreScreenCubit extends Cubit<ExploreScreenState> {
  final ExploreRepositoryController _exploreRepositoryController;
  ExploreScreenCubit(this._exploreRepositoryController) : super(const ExploreScreenInitial());

  Future<void> getTokenRankList() async {
    try {
      emit(const ExploreScreenLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final response = await _exploreRepositoryController.getList();
      emit(ExploreScreenCompleted(response));
    } on NetworkError catch (e) {
      emit(ExploreScreenError(e.message));
    }
  }
}
