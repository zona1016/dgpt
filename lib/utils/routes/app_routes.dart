import 'package:dgpt/screens/ai/ai_detail_screen.dart';
import 'package:dgpt/screens/ai/ai_detail_screen_controller.dart';
import 'package:dgpt/screens/ai/ai_guidance_screen.dart';
import 'package:dgpt/screens/ai/ai_guidance_screen_controller.dart';
import 'package:dgpt/screens/ai/ai_start_screen.dart';
import 'package:dgpt/screens/ai/ai_start_screen_controller.dart';
import 'package:dgpt/screens/income/activated_users_screen.dart';
import 'package:dgpt/screens/income/activated_users_screen_controller.dart';
import 'package:dgpt/screens/income/hashrate_leasing_screen.dart';
import 'package:dgpt/screens/income/hashrate_leasing_screen_controller.dart';
import 'package:dgpt/screens/income/invitation_award_screen.dart';
import 'package:dgpt/screens/income/invitation_award_screen_controller.dart';
import 'package:dgpt/screens/income/team_hashrate_award_screen.dart';
import 'package:dgpt/screens/income/team_hashrate_award_screen_controller.dart';
import 'package:dgpt/screens/setting/change_language_screen.dart';
import 'package:dgpt/screens/setting/change_language_screen_controller.dart';
import 'package:dgpt/screens/setting/change_password_screen.dart';
import 'package:dgpt/screens/setting/email_code_screen.dart';
import 'package:dgpt/screens/setting/email_code_screen_controller.dart';
import 'package:dgpt/screens/setting/forget_password_screen.dart';
import 'package:dgpt/screens/setting/forget_password_screen_controller.dart';
import 'package:dgpt/screens/setting/kyc_screen.dart';
import 'package:dgpt/screens/setting/kyc_screen_controller.dart';
import 'package:dgpt/screens/auth/login_screen.dart';
import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/screens/auth/register_screen.dart';
import 'package:dgpt/screens/auth/register_screen_controller.dart';
import 'package:dgpt/screens/hashrate/hashrate_loading_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_loading_screen_controller.dart';
import 'package:dgpt/screens/hashrate/hashrate_password_input_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_password_input_screen_controller.dart';
import 'package:dgpt/screens/home/analyze_screen.dart';
import 'package:dgpt/screens/home/analyze_screen_controller.dart';
import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/screens/home/node_partner_screen.dart';
import 'package:dgpt/screens/home/node_partner_screen_controller.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_detail_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_detail_screen_controller.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_screen_controller.dart';
import 'package:dgpt/screens/income/income_screen.dart';
import 'package:dgpt/screens/income/income_screen_controller.dart';
import 'package:dgpt/screens/main/main_screen.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/notice/system_detail_message_screen.dart';
import 'package:dgpt/screens/notice/system_detail_message_screen_controller.dart';
import 'package:dgpt/screens/notice/system_message_screen.dart';
import 'package:dgpt/screens/notice/system_message_screen_controller.dart';
import 'package:dgpt/screens/profile/about_us_screen.dart';
import 'package:dgpt/screens/profile/about_us_screen_controller.dart';
import 'package:dgpt/screens/qr_code/qr_code_screen.dart';
import 'package:dgpt/screens/qr_code/qr_code_screen_controller.dart';
import 'package:dgpt/screens/setting/account_profile_screen.dart';
import 'package:dgpt/screens/setting/account_profile_screen_controller.dart';
import 'package:dgpt/screens/setting/change_password_screen_controller.dart';
import 'package:dgpt/screens/setting/email_verification_screen.dart';
import 'package:dgpt/screens/setting/email_verification_screen_controller.dart';
import 'package:dgpt/screens/setting/forgot_fund_psd_screen.dart';
import 'package:dgpt/screens/setting/forgot_fund_psd_screen_controller.dart';
import 'package:dgpt/screens/setting/my_device_screen.dart';
import 'package:dgpt/screens/setting/my_device_screen_controller.dart';
import 'package:dgpt/screens/setting/change_fund_psd_screen.dart';
import 'package:dgpt/screens/setting/change_fund_psd_screen_controller.dart';
import 'package:dgpt/screens/setting/reset_fund_psd_screen.dart';
import 'package:dgpt/screens/setting/reset_fund_psd_screen_controller.dart';
import 'package:dgpt/screens/setting/reset_password_screen.dart';
import 'package:dgpt/screens/setting/reset_password_screen_controller.dart';
import 'package:dgpt/screens/setting/setting_fund_psd_screen.dart';
import 'package:dgpt/screens/setting/setting_fund_psd_screen_controller.dart';
import 'package:dgpt/screens/setting/setting_screen.dart';
import 'package:dgpt/screens/setting/setting_screen_controller.dart';
import 'package:dgpt/screens/auth/splash/splash_screen.dart';
import 'package:dgpt/screens/auth/splash/splash_screen_controller.dart';
import 'package:dgpt/screens/task/task_centre_screen.dart';
import 'package:dgpt/screens/task/task_centre_screen_controller.dart';
import 'package:dgpt/screens/task/task_history_screen.dart';
import 'package:dgpt/screens/task/task_history_screen_controller.dart';
import 'package:dgpt/screens/transaction/my_assets_screen.dart';
import 'package:dgpt/screens/transaction/my_assets_screen_controller.dart';
import 'package:dgpt/screens/transaction/order_detail_screen.dart';
import 'package:dgpt/screens/transaction/order_detail_screen_controller.dart';
import 'package:dgpt/screens/transaction/order_screen.dart';
import 'package:dgpt/screens/transaction/order_screen_controller.dart';
import 'package:dgpt/screens/transaction/recharge_detail_screen.dart';
import 'package:dgpt/screens/transaction/recharge_detail_screen_controller.dart';
import 'package:dgpt/screens/transaction/recharge_screen.dart';
import 'package:dgpt/screens/transaction/recharge_screen_controller.dart';
import 'package:dgpt/screens/tutorial/tutorial_detail_screen.dart';
import 'package:dgpt/screens/tutorial/tutorial_detail_screen_controller.dart';
import 'package:dgpt/screens/tutorial/tutorials_screen.dart';
import 'package:dgpt/screens/tutorial/tutorials_screen_controller.dart';
import 'package:dgpt/screens/setting/help_center_screen.dart';
import 'package:dgpt/screens/setting/help_center_screen_controller.dart';
import 'package:dgpt/screens/web/web_screen.dart';
import 'package:dgpt/screens/web/web_screen_controller.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  AppRoutes._();

  static String splash = "/splash";
  static String login = "/login";
  static String register = "/register";
  static String changePassword = "/change_password";
  static String forgetPassword = "/forget_password";
  static String resetPassword = "/reset_password";
  static String emailCode = "/email_code";

  static String home = "/home";
  static String main = "/main";
  static String qrCode = "/qr_code";

  static String taskHistory = "/task_history";
  static String taskCenter = "/task_center";

  static String tutorial = "/tutorial";
  static String tutorialDetail = "/tutorial_detail";

  static String aboutUs = "/about_us";
  static String web = "/web";
  static String nodePartner = "/node_partner";
  static String analyze = "/analyze";

  static String aiGuidance = "/ai_guidance";
  static String aiStart = "/ai_start";
  static String aiDetail = "/ai_detail";

  static String setting = "/setting";
  static String accountProfile = "/account_profile";
  static String myDevice = "/my_device";
  static String helpCenter = "/help_center";
  static String resetFundPsd = "/reset_fund_psd";
  static String changeFundPsd = "/change_fund_psd";
  static String settingFundPsd = "/setting_fund_psd";
  static String forgotFundPsd = "/forgot_fund_psd";
  static String emailVerification = "/email_verification";
  static String changeLanguage = "/change_language";

  static String myAssets = "/my_assets";
  static String order = "/order";
  static String orderDetail = "/order_detail";
  static String recharge = "/recharge";
  static String rechargeDetail = "/recharge_detail";

  static String systemMessage = "/system_message";
  static String systemMessageDetail = "/system_message_detail";

  static String income = "/income";
  static String hashrateLeasing = "/hashrate_leasing";
  static String invitationAward = "/invitation_award";
  static String teamHashrateAwardn = "/team_hashrate_awardn";

  static String activatedUsers = "/activated_users";
  static String hashrateRental = "/hashrate_rental";
  static String hashrateRentalDetail = "/hashrate_rental_detail";
  static String hashratePasswordInput = "/hashrate_password_input";
  static String hashrateLoading = "/hashrate_loading";

  static String kyc = "/kyc";

  static final List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        binding: SplashScreenBindings()
    ),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        binding: LoginScreenBindings()
    ),
    GetPage(
        name: register,
        page: () => const RegisterScreen(),
        binding: RegisterScreenBindings()
    ),
    GetPage(
        name: changePassword,
        page: () => const ChangePasswordScreen(),
        binding: ChangePasswordScreenBindings()
    ),
    GetPage(
        name: forgetPassword,
        page: () => const ForgetPasswordScreen(),
        binding: ForgetPasswordScreenBindings()
    ),
    GetPage(
        name: resetPassword,
        page: () => const ResetPasswordScreen(),
        binding: ResetPasswordScreenBindings()
    ),
    GetPage(
        name: emailCode,
        page: () => const EmailCodeScreen(),
        binding: EmailCodeScreenBindings()
    ),
    GetPage(
        name: main,
        page: () => const MainScreen(),
        binding: MainScreenBindings()
    ),
    GetPage(
        name: home,
        page: () => const HomeScreen(),
        binding: HomeScreenBindings()
    ),
    GetPage(
        name: taskHistory,
        page: () => const TaskHistoryScreen(),
        binding: TaskHistoryScreenBindings()
    ),
    GetPage(
        name: taskCenter,
        page: () => const TaskCentreScreen(),
        binding: TaskCentreScreenBindings()
    ),
    GetPage(
        name: tutorial,
        page: () => const TutorialsScreen(),
        binding: TutorialsScreenBindings()
    ),
    GetPage(
        name: tutorialDetail,
        page: () => const TutorialDetailScreen(),
        binding: TutorialDetailScreenBindings()
    ),
    GetPage(
        name: aboutUs,
        page: () => const AboutUsScreen(),
        binding: AboutUsScreenBindings()
    ),
    GetPage(
        name: web,
        page: () => const WebViewScreen(),
        binding: WebScreenBindings()
    ),
    GetPage(
        name: analyze,
        page: () => const AnalyzeScreen(),
        binding: AnalyzeScreenBindings()
    ),
    GetPage(
        name: nodePartner,
        page: () => const NodePartnerScreen(),
        binding: NodePartnerScreenBindings()
    ),
    GetPage(
        name: aiGuidance,
        page: () => const AiGuidanceScreen(),
        binding: AiGuidanceScreenBindings()
    ),
    GetPage(
        name: aiDetail,
        page: () => const AiDetailScreen(),
        binding: AiDetailScreenBindings()
    ),
    GetPage(
        name: aiStart,
        page: () => const AiStartScreen(),
        binding: AiStartScreenBindings()
    ),
    GetPage(
        name: setting,
        page: () => const SettingScreen(),
        binding: SettingScreenBindings()
    ),
    GetPage(
        name: helpCenter,
        page: () => const HelpCenterScreen(),
        binding: HelpCenterScreenBindings()
    ),
    GetPage(
        name: changeFundPsd,
        page: () => const ChangeFundPsdScreen(),
        binding: ChangeFundPsdScreenBindings()
    ),
    GetPage(
        name: resetFundPsd,
        page: () => const ResetFundPsdScreen(),
        binding: ResetFundPsdScreenBindings()
    ),
    GetPage(
        name: settingFundPsd,
        page: () => const SettingFundPsdScreen(),
        binding: SettingFundPsdScreenBindings()
    ),
    GetPage(
        name: forgotFundPsd,
        page: () => const ForgotFundPsdScreen(),
        binding: ForgotFundPsdScreenBindings()
    ),
    GetPage(
        name: emailVerification,
        page: () => const EmailVerificationScreen(),
        binding: EmailVerificationScreenBindings()
    ),
    GetPage(
        name: changeLanguage,
        page: () => const ChangeLanguageScreen(),
        binding: ChangeLanguageScreenBindings()
    ),
    GetPage(
        name: accountProfile,
        page: () => const AccountProfileScreen(),
        binding: AccountProfileScreenBindings()
    ),
    GetPage(
        name: myDevice,
        page: () => const MyDeviceScreen(),
        binding: MyDeviceScreenBindings()
    ),
    GetPage(
        name: order,
        page: () => const OrderScreen(),
        binding: OrderScreenBindings()
    ),
    GetPage(
        name: orderDetail,
        page: () => const OrderDetailScreen(),
        binding: OrderDetailScreenBindings()
    ),
    GetPage(
        name: recharge,
        page: () => const RechargeScreen(),
        binding: RechargeScreenBindings()
    ),
    GetPage(
        name: rechargeDetail,
        page: () => const RechargeDetailScreen(),
        binding: RechargeDetailScreenBindings()
    ),
    GetPage(
        name: myAssets,
        page: () => const MyAssetsScreen(),
        binding: MyAssetsScreenBindings()
    ),
    GetPage(
        name: kyc,
        page: () => const KycScreen(),
        binding: KycScreenBindings()
    ),
    GetPage(
        name: systemMessage,
        page: () => const SystemMessageScreen(),
        binding: SystemMessageScreenBindings()
    ),
    GetPage(
        name: systemMessageDetail,
        page: () => const SystemDetailMessageScreen(),
        binding: SystemDetailMessageScreenBindings()
    ),
    GetPage(
        name: income,
        page: () => const IncomeScreen(),
        binding: IncomeScreenBindings()
    ),
    GetPage(
        name: hashrateLeasing,
        page: () => const HashrateLeasingScreen(),
        binding: HashrateLeasingScreenBindings()
    ),
    GetPage(
        name: invitationAward,
        page: () => const InvitationAwardScreen(),
        binding: InvitationAwardScreenBindings()
    ),
    GetPage(
        name: teamHashrateAwardn,
        page: () => const TeamHashrateAwardScreen(),
        binding: TeamHashrateAwardScreenBindings()
    ),
    GetPage(
        name: hashrateRental,
        page: () => const HashrateRentalScreen(),
        binding: HashrateRentalScreenBindings()
    ),
    GetPage(
        name: hashrateRentalDetail,
        page: () => const HashrateRentalDetailScreen(),
        binding: HashrateRentalDetailScreenBindings()
    ),
    GetPage(
        name: hashratePasswordInput,
        page: () => const HashratePasswordInputScreen(),
        binding: HashratePasswordInputScreenBindings()
    ),
    GetPage(
        name: hashrateLoading,
        page: () => const HashrateLoadingScreen(),
        binding: HashrateLoadingScreenBindings()
    ),
    GetPage(
        name: activatedUsers,
        page: () => const ActivatedUsersScreen(),
        binding: ActivatedUsersScreenBindings()
    ),
    GetPage(
        name: qrCode,
        page: () => const QrCodeScreen(),
        binding: QrCodeScreenBindings()
    ),
  ];
}
