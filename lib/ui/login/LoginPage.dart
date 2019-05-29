import 'package:first_flutter/constant/Constant.dart';
import 'package:first_flutter/util/HttpUtil.dart';
import 'package:first_flutter/util/ToastUtil.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {

  TextEditingController username = new TextEditingController(text: 'yangchong');
  TextEditingController pwd = new TextEditingController(text: '123456');
  Map<String, Object> map = new Map();

  void login() {
    String name = username.text;
    String password = pwd.text;
    if (name.length == 0) {
      ToastUtil.showToast('请先输入姓名');
      return;
    }
    if (password.length == 0) {
      ToastUtil.showToast('请先输入密码');
      return;
    }
    map['username'] = name;
    map['password'] = password;
    HttpUtil.requestPost(Constant.LOGIN, params: map)
        .then((data) {
      if (data != null) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/ic_head.png',
              height: 100,
              width: 100,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "请输入用户名",
                    border: InputBorder.none,
                    prefixText: "用户名:   "),
                controller: username,
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: new Border.all(color: Colors.grey, width: 1)),
              height: 45,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(left: 15),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "请输入密码",
                    border: InputBorder.none,
                    prefixText: "密   码:   "),
                controller: pwd,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: new Border.all(color: Colors.grey, width: 1)),
              height: 45,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
            ),
            new Container(
              child: new FlatButton(
                onPressed: () {
                  login();
                },
                child: new Center(child: new Text("登录")),
//                color: Colors.blue,
                disabledColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              width: 120,
              height: 45,
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 30),
      ),
    );
  }
}
