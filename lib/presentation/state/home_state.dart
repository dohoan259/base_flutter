import 'package:base_project/base/base_state.dart';

// ignore: must_be_immutable
class HomeState extends BaseState{

  HomeState();

  int count = 0;

  @override
  BaseState copyWith({viewState, processing, count}) {
    var newState = HomeState();
    newState.viewState = viewState ?? this.viewState;
    newState.processing = processing ?? this.processing;
    newState.count = count ?? this.count;

    return newState;
  }
}