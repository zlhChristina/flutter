class StringUtil {

  static bool isEmpty(String str) {
    return str == null || str.trim() == "";
  }

  static String getPlatform() {
    return "android";
  }

  static String getAppVersion() {
    return "1.0";
  }

  static String getPhoneImei() {
    return "";
  }
}
