// ignore: must_be_immutable
abstract class BaseState {
  ViewState viewState;
  bool processing = false;
  BaseState copyWith();
}

enum ViewState { Uninitialized, Loaded, Error }