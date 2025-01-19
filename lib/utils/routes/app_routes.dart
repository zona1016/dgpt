import 'package:dgpt/screens/home/home_screen.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/screens/main/main_screen.dart';
import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:dgpt/screens/qr_code/qr_code_screen.dart';
import 'package:dgpt/screens/qr_code/qr_code_screen_controller.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  AppRoutes._();

  static String home = "/home";
  static String main = "/main";
  static String conversation = "/conversation";
  static String chat = "/chat";
  static String search = "/search";
  static String profile = "/profile";
  static String groupProfile = "/group_profile";
  static String addFriend = "/add_friend";
  static String addGroup = "/add_group";
  static String addFriendDetail = "/add_friend_detail";
  static String qrCode = "/qr_code";
  static String createGroupIntroduction = "/create_group_introduction";
  static String createGroup = "/create_group";
  static String profileQRCode = "/profile_qr_code";
  static String profileDetail = "/profile_detail";
  static String selectedAvatar = "/elected_avatar";
  static String blackList = "/black_list";
  static String newChat = "/new_chat";
  static String newContact = "/new_contact";
  static String profileSettingDetail = "/profile_setting_detail";
  static String help = "/help";
  static String groupList = "/group_list";

  static final List<GetPage> routes = [
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
        name: qrCode,
        page: () => const QrCodeScreen(),
        binding: QrCodeScreenBindings()
    ),
  ];
}
