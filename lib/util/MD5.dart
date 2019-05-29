import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class MD5 {

  static String generateMD5(String str){
    var content=new Utf8Encoder().convert(str);
    var digest=md5.convert(content);
    return hex.encode(digest.bytes);
  }
}