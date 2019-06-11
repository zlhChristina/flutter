import 'package:first_flutter/model/CategoryResp.dart';
import 'package:first_flutter/ui/pages/category/PmbokPage.dart';
import 'package:first_flutter/ui/pages/detail/ArticleDetailPage.dart';
import 'package:first_flutter/ui/pages/login/LoginPage.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Future<Object> _buildRoute(BuildContext context, Widget widget) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static Future<dynamic> toLoginPage(BuildContext context) {
    return _buildRoute(context, new LoginPage());
  }

  static Future<dynamic> toArticleDetailPage(BuildContext context) {
    return _buildRoute(context, new ArticleDetailPage());
  }

  static Future<dynamic> toPmboxPage(BuildContext context, CategoryInfo info) {
    return _buildRoute(context, new PmboxPage(info));
  }
}
