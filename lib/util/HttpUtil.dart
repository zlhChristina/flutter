import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:first_flutter/constant/BaseResponse.dart';
import 'package:first_flutter/constant/Constant.dart';
import 'package:first_flutter/util/LogUtil.dart';
import 'package:first_flutter/util/StringUtil.dart';
import 'package:first_flutter/util/ToastUtil.dart';

class HttpUtil {
  static Dio dio;
  static const String GET = "get";
  static const String POST = "post";
  static const String TAG = "HttpUtil";

  static Future<dynamic> requestGer(String url,
      {Map<String, Object> params}) async {
    return await request(GET, url, params);
  }

  static Future<dynamic> requestPost(String url,
      {Map<String, Object> params}) async {
    return await request(POST, url, params);
  }

  static Future<dynamic> request(
      String method, String url, Map<String, Object> params) async {
    Map param = getBodyParam(params);
    if (param != null && param.isNotEmpty) {
      LogUtil.i(TAG, "params :" + param.toString());
    }
    url = Constant.baseUrl + url;
    LogUtil.i(TAG, "<GET>:url:$url");
    Response response;
    try {
      if (method == GET) {
        if (param != null && param.isNotEmpty) {
          response = await getDio().get(url, data: params);
        } else {
          response = await getDio().get(url);
        }
      } else {
        if (param != null && param.isNotEmpty) {
          response = await getDio().post(url, data: params);
        } else {
          response = await getDio().post(url);
        }
      }
      var data = response.data is String ? json.decode(response.data) : response.data;
      if (data['errorCode'] >= 0) {
        LogUtil.e(TAG, "data:${data['data']}");
        return Future.value(data['data']);
      } else {
        ToastUtil.showToast(data['errorMsg'] + "($data['errorCode'])");
        return Future.value(null);
      }
    } catch (exception) {
      LogUtil.w(TAG, exception.toString());
    }
    return Future.value(null);
  }

  //获取请求参数
  static Map<String, Object> getBodyParam(Map<String, Object> params) {
    Map<String, Object> param = Map();
    if (params != null) {
      param.addAll(params);
    }
//    param["platform"] = StringUtil.getPlatform();
//    param["phone_imei"] = StringUtil.getPhoneImei();
//    param["version"] = StringUtil.getAppVersion();
    return param;
  }

  static Dio getDio() {
    if (dio == null) {
      var options = Options(receiveTimeout: 6000, connectTimeout: 6000);
      dio = new Dio(options);
    }
    return dio;
  }
}
