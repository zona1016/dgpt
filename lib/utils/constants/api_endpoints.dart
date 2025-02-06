class ApiEndpoints {
  //System
  static const String checkForceUpdate = "/api/v1/check-force-update";

  // auth
  static const String resetPwd = '/api/sysUser/resetPwd';
  static const String getUserInfo = "/api/sysAuth/userInfo";
  static const String logout = "/api/sysAuth/logout";
  static const String resetPassword = "/api/sysUser/resetPwd";
  static const String changePwd = "/api/sysUser/changePwd";

  static const String aiPulseGoogleAuthGetBindCode = "/api/aiPulseGoogleAuth/getBindCode";
  static const String aiPulseGoogleAuthBind = "/api/aiPulseGoogleAuth/bind";
  static const String aiPulseGoogleAuthUnBind = "/api/aiPulseGoogleAuth/unBind";

  // user
  static const String userRegister = "/api/user/userRegister";
  static const String userLogin = "/api/user/userLogin";
  static const String userTeamHashrateCountTotal = "/api/user/userTeamHashrateCountTotal";
  static const String userTeamMemberList = "/api/user/userTeamMemberList";

  // aiPulse
  static const String aiPulseAddressPage = "/api/aiPulseAddress/page";
  static const String aiPulseAddressDetail = " /api/aiPulseAddress/detail";
  static const String aiPulseAddressDropdownData = " /api/aiPulseAddress/dropdownData";
  static const String aiPulseAddressUserPage = " /api/aiPulseAddress/userPage";

  static const String aiPulseBannerUserPage = "/api/aiPulseBanner/userPage";

  static const String aiPulseCommonRegisterVerifyCode = "/api/aiPulseCommon/registerVerifyCode";

  static const String aiPulseDepositPage = "/api/aiPulseDeposit/page";
  static const String aiPulseDepositDetail = "/api/aiPulseDeposit/detail";
  static const String aiPulseDepositDeposit = "/api/aiPulseDeposit/deposit";
  static const String aiPulseDepositUserPage = "/api/aiPulseDeposit/userPage";

  static const String aiPulseFlowPage = "/api/aiPulseFlow/page";
  static const String aiPulseFlowDetail = "/api/aiPulseFlow/detail";
  static const String aiPulseFlowUserPage = "/api/aiPulseFlow/userPage";
  static const String aiPulseFlowIncomeTotal = "/api/aiPulseFlow/userIncomeTotal";
  static const String aiPulseFlowDropdownData = "/api/aiPulseFlow/dropdownData";

  static const String aiPulseHashratePage = "/api/aiPulseHashrate/page";
  static const String aiPulseHashrateDetail = "/api/aiPulseHashrate/detail";

  static const String aiPulseKycPage = "/api/aiPulseKyc/page";
  static const String aiPulseKycDetail = "/api/aiPulseKyc/detail";
  static const String aiPulseKycDropdownData = "/api/aiPulseKyc/dropdownData";
  static const String aiPulseKycUserKyc = "/api/aiPulseKyc/userKyc";
  static const String aiPulseKycApply = "/api/aiPulseKyc/apply";

  static const String aiPulseMerchantPage = "/api/aiPulseMerchant/page";
  static const String aiPulseMerchantDetail = "/api/aiPulseMerchant/detail";
  static const String aiPulseMerchantEnableList = "/api/aiPulseMerchant/enableList";

  static const String aiPulsePlanPage = "/api/aiPulsePlan/page";
  static const String aiPulsePlanDetail = "/api/aiPulsePlan/detail";
  static const String aiPulsePlanPlanList = "/api/aiPulsePlan/planList";

  static const String aiPulseRecommendAwardPage = "/api/aiPulseRecommendAward/page";
  static const String aiPulseRecommendAwardDetail = "/api/aiPulseRecommendAward/detail";
  static const String aiPulseRecommendAwardDropdownData = "/api/aiPulseRecommendAward/dropdownData";
  static const String aiPulseRecommendAwardUserPage = "/api/aiPulseRecommendAward/userPage";

  static const String aiPulseRoiPage = "/api/aiPulseRoi/page";
  static const String aiPulseRoiDetail = "/api/aiPulseRoi/detail";
  static const String aiPulseRoiDropdownData = "/api/aiPulseRoi/dropdownData";
  static const String aiPulseRoiUserPage = "/api/aiPulseRoi/userPage";

  static const String aiPulseUserHashratePage = "/api/aiPulseUserHashrate/page";
  static const String aiPulseUserHashrateDetail = "/api/aiPulseUserHashrate/detail";
  static const String aiPulseUserHashrateDropdownData = "/api/aiPulseUserHashrate/dropdownData";
  static const String aiPulseUserHashrateUserHashrate = "/api/aiPulseUserHashrate/userHashrate";

  static const String aiPulseUserPlanPage = "/api/aiPulseUserPlan/page";
  static const String aiPulseUserPlanDetail = "/api/aiPulseUserPlan/detail";
  static const String aiPulseUserPlanDropdownData = "/api/aiPulseUserPlan/dropdownData";
  static const String aiPulseUserPlanApply = "/api/aiPulseUserPlan/apply";
  static const String aiPulseUserPlanUserPage = "/api/aiPulseUserPlan/userPage";
  static const String aiPulseUserPlanUserPlan = "/api/aiPulseUserPlan/userPlanList";

  static const String aiPulseUserHashrateProgress = "/api/aiPulseUserHashrate/hashrateProgress";

  static const String aiPulseWalletPage = "/api/aiPulseWallet/page";
  static const String aiPulseWalletDetail = "/api/aiPulseWallet/detail";
  static const String aiPulseWalletDropdownData = "/api/aiPulseWallet/dropdownData";
  static const String aiPulseWalletGetUserBalance = "/api/aiPulseWallet/getUserBalance";

  static const String aiPulseWithdrawalPage = "/api/aiPulseWithdrawal/page";
  static const String aiPulseWithdrawalDetail = "/api/aiPulseWithdrawal/detail";
  static const String aiPulseWithdrawalDropdownData = "/api/aiPulseWithdrawal/dropdownData";
  static const String aiPulseWithdrawalWithdrawal = "/api/aiPulseWithdrawal/withdrawal";
  static const String aiPulseWithdrawalAudit = "/api/aiPulseWithdrawal/audit";
  static const String aiPulseWithdrawalUserPage = "/api/aiPulseWithdrawal/userPage";

  static const String configValueCode = "/api/config/configValue/{code}";


}
