import 'package:base_project/base/base_state.dart';
import 'package:base_project/data/result.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class BaseController<T extends BaseState> extends StateNotifier<T>
    with LocatorMixin {
  BaseController(T state) : super(state);

  Future<Result> loadData();

  Future<void> reload() async {
    var clone = state.copyWith();
    clone.viewState = ViewState.Uninitialized;
    state = clone;
    initState();
  }
}
