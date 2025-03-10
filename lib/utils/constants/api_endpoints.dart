class ApiEndpoints {
  //System
  static const String checkForceUpdate = "/api/v1/check-force-update";

  // auth
  static const String logout = "/api/sysAuth/logout";
  static const String resetPassword = "/api/sysUser/resetPwd";
  static const String changePwd = "/api/sysUser/changePwd";

  static const String aiPulseGoogleAuthGetBindCode = "/api/aiPulseGoogleAuth/getBindCode";
  static const String aiPulseGoogleAuthBind = "/api/aiPulseGoogleAuth/bind";
  static const String aiPulseGoogleAuthUnBind = "/api/aiPulseGoogleAuth/unBind";
  static const String aiPulseGoogleAuthHasBind = "/api/aiPulseGoogleAuth/hasBind";

  static const String aiPulseTotalAmountTotal = "/api/aiPulseTotal/amountTotal";
  static const String aiPulseTotalDirectTop = "/api/aiPulseTotal/directTop";
  static const String aiPulseTotalLayerTotal = "/api/aiPulseTotal/lyaerTotal";
  static const String aiPulseTotalLayerHashrateTotal = "/api/aiPulseTotal/layerHashrateTotal";
  static const String aiPulseTotalRecommendAwardTotal = "/api/aiPulseTotal/recommendAwardTotal";
  static const String aiPulseTotalRecommendAwardUserList = "/api/aiPulseTotal/recommendAwardUserList";

  // user
  static const String userRegister = "/api/user/userRegister";
  static const String userLogin = "/api/user/userLogin";
  static const String userTeamHashrateCountTotal = "/api/user/userTeamHashrateCountTotal";
  static const String userTeamMemberList = "/api/user/userTeamMemberList";
  static const String userHasTradingPwd = "/api/user/hasTradingPwd";
  static const String userChangePwd = "/api/user/userChangePwd";
  static const String userResetPwdSend = "/api/user/resetPwdSend";
  static const String userResetPwdSubmit = "/api/user/resetPwdSubmit";
  static const String userChangeTradingPwd = "/api/user/userChangeTradingPwd";
  static const String userResetTradingPwdSend = "/api/user/resetTradingPwdSend";
  static const String userResetTradingPwdSubmit = "/api/user/resetTradingPwdSubmit";
  static const String userUpdateInfo = "/api/user/userUpdateInfo";
  static const String userInfo = "/api/user/userInfo";
  static const String userTeamDataTotal = "/api/user/userTeamDataTotal";
  static const String userSetLang = "/api/user/setLang/";
  static const String userRecommandUserInfo = "/api/user/recommandUserInfo";

  // aiPulse
  static const String aiPulseAddressPage = "/api/aiPulseAddress/page";
  static const String aiPulseAddressDetail = " /api/aiPulseAddress/detail";
  static const String aiPulseAddressDropdownData = "/api/aiPulseAddress/dropdownData";
  static const String aiPulseAddressUserPage = "/api/aiPulseAddress/userPage";

  static const String aiPulseChatGptSend = "/api/aiPulseChatGpt/send";
  static const String aiPulseChatGptUserPage = "/api/aiPulseChatGpt/userPage";
  static const String aiPulseChatGptChatMessageHistoryList = "/api/aiPulseChatGpt/chatMessageHistoryList";
  static const String aiPulseChatGptClearHistory = "/api/aiPulseChatGpt/clearHistory";

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
  static const String aiPulseFlowTypeList = "/api/aiPulseFlow/flowTypeList";

  static const String aiPulseHashratePage = "/api/aiPulseHashrate/page";
  static const String aiPulseHashrateEnableHashrateList = "/api/aiPulseHashrate/enableHashrateList";
  static const String aiPulseHashrateDetail = "/api/aiPulseHashrate/detail";

  static const String aiPulseKycPage = "/api/aiPulseKyc/page";
  static const String aiPulseKycDetail = "/api/aiPulseKyc/detail";
  static const String aiPulseKycDropdownData = "/api/aiPulseKyc/dropdownData";
  static const String aiPulseKycUserKyc = "/api/aiPulseKyc/userKyc";
  static const String aiPulseKycApply = "/api/aiPulseKyc/apply";

  static const String aiPulseCommonResetPwdVerifyCode = "/api/aiPulseCommon/resetPwdVerifyCode";
  static const String aiPulseCommonResetTradingPwdVerifyCode = "/api/aiPulseCommon/resetTradingPwdVerifyCode";
  static const String aiPulseCommonUploadImageFile = "/api/aiPulseCommon/uploadImageFile";
  static const String aiPulseCommonUpdateInfoVerifyCode = "/api/aiPulseCommon/updateInfoVerifyCode";

  static const String aiPulseMerchantPage = "/api/aiPulseMerchant/page";
  static const String aiPulseMerchantDetail = "/api/aiPulseMerchant/detail";
  static const String aiPulseMerchantEnableList = "/api/aiPulseMerchant/enableList";

  static const String aiPulsePlanPage = "/api/aiPulsePlan/page";
  static const String aiPulsePlanDetail = "/api/aiPulsePlan/planDetail";
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
  static const String aiPulseWalletTransfer = "/api/aiPulseWallet/transfer";

  static const String aiPulseWithdrawalPage = "/api/aiPulseWithdrawal/page";
  static const String aiPulseWithdrawalDetail = "/api/aiPulseWithdrawal/detail";
  static const String aiPulseWithdrawalDropdownData = "/api/aiPulseWithdrawal/dropdownData";
  static const String aiPulseWithdrawalWithdrawal = "/api/aiPulseWithdrawal/withdrawal";
  static const String aiPulseWithdrawalAudit = "/api/aiPulseWithdrawal/audit";
  static const String aiPulseWithdrawalUserPage = "/api/aiPulseWithdrawal/userPage";
  static const String aiPulseWithdrawalLastAddress = "/api/aiPulseWithdrawal/lastAddress";
  static const String aiPulseCommonFundList = "/api/aiPulseCommon/fundList";

  static const String configValueCode = "/api/config/configValue/{code}";

  static const String noticeUserNoticeList = "/api/notice/userNoticeList";

  static const String aiPulseSalaryAwardUserPage = "/api/aiPulseSalaryAward/userPage";

  // 用户职称信息
  static const String aiPulseUserJobTitleUserJobTitle = "/api/aiPulseUserJobTitle/userJobTitle";
  static const String aiPulseJobTitleEnableJobTitleList = "/api/aiPulseJobTitle/enableJobTitleList";

  // 留言
  static const String aiPulseMessageUserPage = "/api/aiPulseMessage/userPage";
  static const String aiPulseMessageUserAdd = "/api/aiPulseMessage/userAdd";
}
