part of 'explore_screen_cubit.dart';

@immutable
abstract class ExploreScreenState {
  const ExploreScreenState();
}

class ExploreScreenInitial extends ExploreScreenState {
  const ExploreScreenInitial();
}

class ExploreScreenLoading extends ExploreScreenState {
  const ExploreScreenLoading();
}

class ExploreScreenCompleted extends ExploreScreenState {
  final List<CoinRankModel> response;
  const ExploreScreenCompleted(this.response);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ExploreScreenCompleted && listEquals(o.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class ExploreScreenError extends ExploreScreenState {
  final String message;
  const ExploreScreenError(this.message);
}
