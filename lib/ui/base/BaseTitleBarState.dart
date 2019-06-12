import 'package:first_flutter/ui/base/BaseState.dart';
import 'package:first_flutter/ui/base/BaseStatefulWidget.dart';
import 'package:flutter/material.dart';

abstract class BaseTitleBarState<T extends BaseStatefulWidget> extends BaseState<T> {
  bool _enableMenuBtn = false;

  String _menuBtnText = "";

  bool _enableBackBtn = true;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Positioned(
          child: getBackground(),
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
        ),
        new Scaffold(
          appBar: PreferredSize(
            child: AppBar(elevation: 0, backgroundColor: getTitleBarColor(), brightness: getAppBarBrightness()),
            preferredSize: Size.fromHeight(0),
          ),
          body: new Container(
            child: new Column(
              children: <Widget>[_getCustomAppBar(context), new Expanded(child: getContentWidget(context))],
            ),
          ),
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomPadding: isResizeToAvoidBottomPadding(),
        )
      ],
    );
  }

  Widget getBackground() {
    return Container(color: Color(0xfff5f5f5));
  }

  bool isHasTitleBar() {
    return true;
  }

  /// 适配键盘弹起的时候，布局是否跟着弹起，默认true是跟着弹起，改为false之后就不会弹起了
  bool isResizeToAvoidBottomPadding() => false;

  /// 标题栏的主题，黑色或者白色
  Brightness getAppBarBrightness() => Brightness.light;

  /// 标题栏的颜色
  Color getTitleBarColor() {
    return Colors.transparent;
  }

  /// 启用或者禁用返回按钮
  void enableBackBtn(bool flag) {
    setState(() {
      _enableBackBtn = flag;
    });
  }

  /// 隐藏或者显示菜单按钮
  void enableMenuBtn(bool flag, {String menuBtnText}) {
    setState(() {
      _enableMenuBtn = flag;
      if (menuBtnText != null) {
        _menuBtnText = menuBtnText;
      }
    });
  }

  Widget _getCustomAppBar(BuildContext context) {
    if (isHasTitleBar()) {
      return new Container(
        height: dp(context, 48),
        child: new Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            new Row(
              children: <Widget>[
                _getBackBtn(context),
                Expanded(
                  child: Container(),
                ),
                _getMenuBtn(context)
              ],
            ),
            new Text(getPageTitle(context),
                style: TextStyle(
                    color: const Color(0xff212121),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: sp(context, 17.0)))
          ],
        ),
        color: getTitleBarColor(),
      );
    } else {
      return Container();
    }
  }

  Widget _getMenuBtn(BuildContext context) {
    if (_enableMenuBtn) {
      return new Container(
        height: dp(context, 48),
        width: dp(context, 68),
        child: FlatButton(
            onPressed: () {
              onMenuBtnClick(context);
            },
            child: new Text(_menuBtnText,
                style: TextStyle(
                    color: const Color(0xffa6a6a6),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: sp(context, 12.0)))),
      );
    } else {
      return Container();
    }
  }

  Widget _getBackBtn(BuildContext context) {
    if (_enableBackBtn) {
      return new Container(
        width: dp(context, 68),
        height: dp(context, 48),
        child: FlatButton(
            onPressed: () {},
            child: Image.asset(
              '',
              width: dp(context, 48),
              height: dp(context, 48),
            )),
      );
    } else {
      return Container();
    }
  }

  /// 点击了菜单按钮的时候
  void onMenuBtnClick(BuildContext context) {}

  Widget getContentWidget(BuildContext context);

  String getPageTitle(BuildContext context) => "";
}
