import 'package:base_project/base/base_state.dart';
import 'package:base_project/base/result.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class BaseController<T extends BaseState> extends StateNotifier<T>
    with LocatorMixin {
  BaseController(T state) : super(state);

  Future<Result> initState();

  void reload() {
    var clone = state.copyWith();
    clone.viewState = ViewState.Uninitialized;
    state = clone;
    initState();
  }
}
