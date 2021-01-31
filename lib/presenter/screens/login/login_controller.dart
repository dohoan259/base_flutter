import 'package:base_project/base/result.dart';
import 'package:base_project/data/login_state.dart';
import 'file:///D:/software_project/FlutterProject/base_project/lib/base/base_controller.dart';

class LoginController extends BaseController<LoginState> {
  LoginController() : super(LoginState());

  Future<Result> login() async {
    return Result();
  }
}