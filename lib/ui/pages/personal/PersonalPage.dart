import 'package:first_flutter/ui/AppNavigator.dart';
import 'package:first_flutter/ui/res/AppColors.dart';
import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: InkWell(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/ic_personal_background.png',
                  height: 220,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'images/ic_head.png',
                        height: 80,
                        width: 80,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "用户账号:",
                            style: TextStyle(color: AppColors.colorWhite),
                          ),
                          Text("烟花一冷",
                              style: TextStyle(color: AppColors.colorWhite)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                    ],
                  ),
                  height: 220,
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                ),
              ],
            ),
            onTap: () {
              AppNavigator.toLoginPage(context);
            },
          ),
        ),
        personalItem("我的收藏", 'images/ic_store_collect.png', true, context),
        personalItem("设置", "images/ic_setting.png", true, context),
        personalItem("退出登录", "images/ic_logout.png", false, context),
      ],
    );
  }

  Widget personalItem(name, icon, isShowLine, context) {
    Widget line = isShowLine
        ? Container(
            color: Colors.grey,
            height: 1,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          )
        : Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          );
    return Material(
      child: Ink(
        child: InkWell(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      icon,
                      height: 25,
                      width: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    ),
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                      ),
                    ),
                    Image.asset(
                      "images/ic_rightArrow.png",
                      width: 12,
                      height: 24,
                    ),
                  ],
                ),
                line,
              ],
            ),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            color: AppColors.colorWhite,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
