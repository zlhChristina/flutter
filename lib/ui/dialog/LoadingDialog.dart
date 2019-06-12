import 'package:first_flutter/ui/res/AppColors.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  final String text;

  LoadingDialog(this.text);

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency, //透明类型
      child: new Center(
          child: new Container(
            width: 250,
            height: 80,
            decoration: BoxDecoration(color: AppColors.toast_bg, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Container(
                  width: 20,
                ),
                new Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
