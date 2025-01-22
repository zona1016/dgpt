import 'package:dgpt/screens/auth/login_screen.dart';
import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/screens/auth/register_screen.dart';
import 'package:dgpt/screens/auth/register_screen_controller.dart';
import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/screens/main/main_screen.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/qr_code/qr_code_screen.dart';
import 'package:dgpt/screens/qr_code/qr_code_screen_controller.dart';
import 'package:dgpt/screens/splash/splash_screen.dart';
import 'package:dgpt/screens/splash/splash_screen_controller.dart';
import 'package:dgpt/screens/task/task_history_screen.dart';
import 'package:dgpt/screens/task/task_history_screen_controller.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  AppRoutes._();

  static String splash = "/splash";
  static String login = "/login";
  static String register = "/register";
  static String home = "/home";
  static String main = "/main";
  static String taskHistory = "/task_history";
  static String qrCode = "/qr_code";

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
        name: qrCode,
        page: () => const QrCodeScreen(),
        binding: QrCodeScreenBindings()
    ),
  ];
}
