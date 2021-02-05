import 'package:base_project/base/error_entity.dart';
import 'package:flutter/foundation.dart';

abstract class Result {}

class Success extends Result {

  Success({this.data});

  final dynamic data;
}

class ErrorResult extends Result {

  ErrorResult({this.errorEntity});

  final ErrorEntity errorEntity;
}