import 'package:base_project/base/base_controller.dart';
import 'package:base_project/base/base_state.dart';
import 'package:base_project/base/result.dart';
import 'package:base_project/data/home_state.dart';

class HomeController extends BaseController<UninitializedState> {
  HomeController() : super(HomeState()..count = 0);

  Future<Result> loadData() async {
    state = UninitializedState();
    await Future.delayed(Duration(seconds: 2));
    var clone = HomeState();
    clone.count++;
    state = clone;

    return Result();
  }

  Future<Result> increase() async {
    HomeState clone = (state as HomeState).copyWith(processing: true);
    state = clone;
    clone = (state as HomeState).copyWith();
    await Future.delayed(Duration(seconds: 3));
    clone.count++;
    state = clone.copyWith(processing: false);
    return Result();
  }
}