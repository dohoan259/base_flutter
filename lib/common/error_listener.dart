import 'package:base_project/data/error_entity.dart';

class ErrorListener {
  ErrorListener._privateConstructor();

  static final ErrorListener _instance = ErrorListener._privateConstructor();

  static ErrorListener get instance { return _instance;}

  void handleError(ErrorEntity error) {

  }
}