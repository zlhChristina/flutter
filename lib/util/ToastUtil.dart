import 'package:first_flutter/util/StringUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast(String msg, {Toast duration = Toast.LENGTH_SHORT}) {
    if (StringUtil.isEmpty(msg)) {
      return;
    }
    Fluttertoast.showToast(
        msg: msg, toastLength: duration, gravity: ToastGravity.BOTTOM);
  }
}
