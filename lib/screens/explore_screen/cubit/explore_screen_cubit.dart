import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_screen_state.dart';

class ExploreScreenCubit extends Cubit<ExploreScreenState> {
  ExploreScreenCubit() : super(ExploreScreenInitial());
}
