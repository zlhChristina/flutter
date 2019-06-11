import 'package:dio/dio.dart';
import 'package:first_flutter/ui/base/BaseStatefulWidget.dart';
import 'package:first_flutter/ui/base/BaseWidget.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> with BaseWidget {
  /// 网络请求的token，用于界面退出的时候取消网络请求
  CancelToken cancelToken;

  String get TAG;

  bool isDisposed = false;

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }

  @override
  void initState() {
    super.initState();
    cancelToken = CancelToken();
  }

  @override
  void dispose() {
    isDisposed = true;
    cancelToken?.cancel();
    super.dispose();
  }

  Widget buildWidget(BuildContext context);
}
