import 'package:base_project/base/base_controller.dart';
import 'package:base_project/base/base_state.dart';
import 'package:base_project/data/result.dart';
import 'package:base_project/presentation/state/login_state.dart';

class LoginController extends BaseController<LoginState> {
  LoginController() : super(LoginState());

  @override
  Future<Result> loadData() async {
    var clone = state.copyWith();
    clone.viewState = ViewState.Loaded;
    state = clone;
    return Success();
  }

  Future<Result> login() async {
    return Success();
  }
}