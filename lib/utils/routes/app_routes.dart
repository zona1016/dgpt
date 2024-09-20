import 'package:aida/screens/auth/landing_screen.dart';
import 'package:aida/screens/auth/welcome_screen.dart';
import 'package:aida/screens/main/main_screen.dart';
import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  AppRoutes._();

  static String welcome = "/welcome";
  static String main = "/main";
  static String landing = "/landing";
  static String editInterest = "/edit-interest";
  static String login = "/landing";
  static String register = "/edit-interest";

  static final List<GetPage> routes = [
    GetPage(
      name: welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
        name: main,
        page: () => const MainScreen(),
        binding: MainScreenBindings()),
    GetPage(
      name: landing,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: editInterest,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: register,
      page: () => const LandingScreen(),
    ),
  ];
}
