import 'package:base_project/base/base_state.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class BaseController<T extends BaseState> extends StateNotifier<T>
    with LocatorMixin {
  BaseController(T state) : super(state);
}
