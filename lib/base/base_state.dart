import 'package:base_project/base/error_model.dart';
import 'package:equatable/equatable.dart';

class UninitializedState extends Equatable{
  @override
  String toString() => 'Uninitialized';

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ErrorState extends UninitializedState {
  final ErrorModel errorModel;

  ErrorState({this.errorModel});

  @override
  String toString() => 'errorModel';

  @override
  List<Object> get props => [errorModel];
}



// ignore: must_be_immutable
abstract class BaseState extends UninitializedState{
  bool processing = false;
  BaseState copyWith();

  @override
  // TODO: implement props
  List<Object> get props => [processing];
}

enum ViewState { Uninitialized, Loaded, Error }