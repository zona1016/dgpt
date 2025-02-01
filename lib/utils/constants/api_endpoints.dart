class ApiEndpoints {
  //System
  static const String checkForceUpdate = "/api/v1/check-force-update";

  // auth
  static const String resetPwd = '/api/sysUser/resetPwd';
  static const String getUserInfo = "/api/sysAuth/userInfo";
  static const String logout = "/api/sysAuth/logout";
  static const String resetPassword = "/api/sysUser/resetPwd";
  static const String changePwd = "/api/sysUser/changePwd";

  // user
  static const String register = "/api/user/userRegister";
  static const String login = "/api/user/userLogin";

  // aiPulse
  static const String aiPulseBanner = "/api/aiPulseBanner/page";
  static const String aiPulseDeposit = "/api/aiPulseDeposit/page";

  static const String userHashrate = "/api/aiPulseUserHashrate/userHashrate";


}
