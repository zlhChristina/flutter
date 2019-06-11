import 'package:first_flutter/redux/AppState.dart';
import 'package:first_flutter/redux/BaseAction.dart';
import 'package:first_flutter/ui/dialog/LoadingDialog.dart';
import 'package:first_flutter/util/StringUtil.dart';
import 'package:first_flutter/util/ToastUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class IBaseWidget {
  void showToast(String msg);

  void showLoading(BuildContext context, {String msg, bool cancelable = true});

  void hideLoading(BuildContext context);

  double dp(BuildContext context, double size);

  double sp(BuildContext context, double size);

  void dispatchAction<T extends BaseAction>(T t);
}

class BaseWidget implements IBaseWidget {
  static ScreenUtil screenUtil;

  @override
  void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void showLoading(BuildContext context, {String msg, bool cancelable = true}) {
    String text;
    if (StringUtil.isEmpty(msg)) {
      text = "正在加载中";
    } else {
      text = msg;
    }
    showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (ctx) {
          return new LoadingDialog(text);
        });
  }

  @override
  void showToast(String msg) {
    ToastUtil.showToast(msg);
  }

  @override
  void dispatchAction<T extends BaseAction>(T t) {
    AppReducer.store.dispatch(t);
  }

  @override
  double dp(BuildContext context, double size) {
    if (screenUtil == null) {
      _initScreenUtil(context);
    }
    return ScreenUtil.getInstance().setWidth(size);
  }

  @override
  double sp(BuildContext context, double size) {
    if (screenUtil == null) {
      _initScreenUtil(context);
    }
    return ScreenUtil.getInstance().setSp(size);
  }

  /// 初始化屏幕适配的工具
  void _initScreenUtil(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 414, height: 896, allowFontScaling: true)
      ..init(context);
    screenUtil = ScreenUtil.instance;
  }
}
