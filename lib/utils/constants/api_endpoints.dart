class ApiEndpoints {
  //System
  static const String checkForceUpdate = "/api/v1/check-force-update";

  // auth
  static const String login = "/api/user/userLogin";
  static const String getUserInfo = "/api/sysAuth/userInfo";
  static const String logout = "/api/sysAuth/logout";
  static const String resetPassword = "/api/sysUser/resetPwd";

  // user
  static const String register = "/api/user/userRegister";

  // aiPulseBanner
  static const String aiPulseBanner = "/api/aiPulseBanner/page";

}
