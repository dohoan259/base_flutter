import 'package:base_project/data/error_entity.dart';

abstract class Result {}

class Success extends Result {

  Success({this.data});

  final dynamic data;
}

class ErrorResult extends Result {

  ErrorResult({this.errorEntity});

  final ErrorEntity errorEntity;
}