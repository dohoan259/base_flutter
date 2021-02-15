import 'package:base_project/base/base_controller.dart';
import 'package:base_project/base/base_state.dart';
import 'package:base_project/data/result.dart';
import 'package:base_project/presentation/state/home_state.dart';

class HomeController extends BaseController<HomeState> {
  HomeController() : super(HomeState());

  @override
  Future<Result> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    HomeState clone = state.copyWith();
    clone.viewState = ViewState.Error;
    state = clone;

    return ErrorResult();
  }

  @override
  Future<void> reload() async {
    state = state.copyWith(viewState: ViewState.Uninitialized);
    await Future.delayed(Duration(seconds: 2));
    HomeState clone = state.copyWith();
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