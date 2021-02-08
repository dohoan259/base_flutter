// ignore: must_be_immutable
abstract class BaseState {
  ViewState viewState = ViewState.Uninitialized;
  bool processing = false;
  BaseState copyWith();
}

enum ViewState { Uninitialized, Loaded, Error }
