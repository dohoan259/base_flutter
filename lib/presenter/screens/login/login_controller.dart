import 'package:base_project/base/base_state.dart';
import 'package:base_project/base/result.dart';
import 'package:base_project/data/login_state.dart';
import 'file:///D:/software_project/FlutterProject/base_project/lib/base/base_controller.dart';

class LoginController extends BaseController<LoginState> {
  LoginController() : super(LoginState());

  @override
  Future<Result> initState() async {
    var clone = state.copyWith();
    clone.viewState = ViewState.Loaded;
    state = clone;
    return Success();
  }

  Future<Result> login() async {
    return Success();
  }
}