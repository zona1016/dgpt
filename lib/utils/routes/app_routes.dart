import 'package:dgpt/screens/ai/ai_detail_screen.dart';
import 'package:dgpt/screens/ai/ai_detail_screen_controller.dart';
import 'package:dgpt/screens/ai/ai_guidance_screen.dart';
import 'package:dgpt/screens/ai/ai_guidance_screen_controller.dart';
import 'package:dgpt/screens/ai/ai_start_screen.dart';
import 'package:dgpt/screens/ai/ai_start_screen_controller.dart';
import 'package:dgpt/screens/auth/change_password_screen.dart';
import 'package:dgpt/screens/auth/change_password_screen_controller.dart';
import 'package:dgpt/screens/auth/kyc_screen.dart';
import 'package:dgpt/screens/auth/kyc_screen_controller.dart';
import 'package:dgpt/screens/auth/login_screen.dart';
import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/screens/auth/register_screen.dart';
import 'package:dgpt/screens/auth/register_screen_controller.dart';
import 'package:dgpt/screens/home/analyze_screen.dart';
import 'package:dgpt/screens/home/analyze_screen_controller.dart';
import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/screens/home/node_partner_screen.dart';
import 'package:dgpt/screens/home/node_partner_screen_controller.dart';
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
import 'package:dgpt/screens/setting/my_device_screen.dart';
import 'package:dgpt/screens/setting/my_device_screen_controller.dart';
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
import 'package:dgpt/screens/tutorial/tutorial_detail_screen.dart';
import 'package:dgpt/screens/tutorial/tutorial_detail_screen_controller.dart';
import 'package:dgpt/screens/tutorial/tutorials_screen.dart';
import 'package:dgpt/screens/tutorial/tutorials_screen_controller.dart';
import 'package:dgpt/screens/us/help_center_screen.dart';
import 'package:dgpt/screens/us/help_center_screen_controller.dart';
import 'package:dgpt/screens/web/web_screen.dart';
import 'package:dgpt/screens/web/web_screen_controller.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  AppRoutes._();

  static String splash = "/splash";
  static String login = "/login";
  static String register = "/register";
  static String changePassword = "/change_password";

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

  static String myAssets = "/my_assets";
  static String order = "/order";
  static String orderDetail = "/order_detail";

  static String systemMessage = "/system_message";
  static String systemMessageDetail = "/system_message_detail";

  static String income = "/income";

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
        name: qrCode,
        page: () => const QrCodeScreen(),
        binding: QrCodeScreenBindings()
    ),
  ];
}
