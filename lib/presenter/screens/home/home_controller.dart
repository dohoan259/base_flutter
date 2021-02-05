import 'package:base_project/base/base_controller.dart';
import 'package:base_project/base/base_state.dart';
import 'package:base_project/base/result.dart';
import 'package:base_project/data/home_state.dart';

class HomeController extends BaseController<HomeState> {
  HomeController() : super(HomeState());

  Future<Result> initState() async {
    state = state.copyWith(viewState: ViewState.Uninitialized);
    await Future.delayed(Duration(seconds: 2));
    HomeState clone = state.copyWith();
    clone.count++;
    clone.viewState = ViewState.Loaded;
    state = clone;

    return Success(data: state.count);
  }

  Future<Result> increase() async {
    HomeState clone = state.copyWith(processing: true);
    state = clone;
    await Future.delayed(Duration(seconds: 1));
    clone = state.copyWith();
    clone.count++;
    state = clone.copyWith(processing: false);
    return Success(data: state.count);
  }
}