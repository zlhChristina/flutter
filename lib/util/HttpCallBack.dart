import 'package:first_flutter/util/ToastUtil.dart';

typedef OnSuccess<T> = void Function(T response);

typedef OnFail = void Function({int code, String msg});

typedef OnError = void Function(dynamic e);

class HttpCallback {
  
  OnSuccess onSuccess;

  OnFail onFail;

  OnError onError;

  HttpCallback({this.onSuccess = _onSuccess, this.onFail = _onFail, this.onError = _onError});

  static void _onSuccess(dynamic resp) {}

  static void _onFail({int code, String msg}) {
    ToastUtil.showToast(msg + "($code)");
  }

  static void _onError(dynamic e) {
    ToastUtil.showToast("${e?.toString()}");
  }
}
