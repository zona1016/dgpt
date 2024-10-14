import 'package:aida/screens/chat/add_friend_detail_screen.dart';
import 'package:aida/screens/chat/add_friend_detail_screen_controller.dart';
import 'package:aida/screens/chat/add_friend_screen.dart';
import 'package:aida/screens/chat/add_friend_screen_controller.dart';
import 'package:aida/screens/chat/add_group_screen.dart';
import 'package:aida/screens/chat/add_group_screen_controller.dart';
import 'package:aida/screens/chat/chat_main_screen.dart';
import 'package:aida/screens/chat/chat_main_screen_controller.dart';
import 'package:aida/screens/chat/conversation_screen.dart';
import 'package:aida/screens/chat/conversation_screen_controller.dart';
import 'package:aida/screens/chat/create_group/create_group_introduction_screen.dart';
import 'package:aida/screens/chat/create_group/create_group_introduction_screen_controller.dart';
import 'package:aida/screens/chat/create_group/create_group_screen.dart';
import 'package:aida/screens/chat/create_group/create_group_screen_controller.dart';
import 'package:aida/screens/chat/group_profile_screen.dart';
import 'package:aida/screens/chat/group_profile_screen_controller.dart';
import 'package:aida/screens/chat/profile/profile_setting_screen.dart';
import 'package:aida/screens/chat/profile/profile_setting_screen_controller.dart';
import 'package:aida/screens/chat/profile_screen.dart';
import 'package:aida/screens/chat/profile_screen_controller.dart';
import 'package:aida/screens/chat/search_screen.dart';
import 'package:aida/screens/chat/search_screen_controller.dart';
import 'package:aida/screens/main/main_screen.dart';
import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/screens/qr_code/qr_code_screen.dart';
import 'package:aida/screens/qr_code/qr_code_screen_controller.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  AppRoutes._();

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
  static String profileSetting = "/profile_Setting";

  static final List<GetPage> routes = [
    GetPage(
        name: main,
        page: () => const MainScreen(),
        binding: MainScreenBindings()
    ),
    GetPage(
        name: chat,
        page: () => const ChatMainScreen(),
        binding: ChatMainScreenBindings(),
    ),
    GetPage(
        name: conversation,
        page: () => const ConversationScreen(),
        binding: ConversationScreenBindings()
    ),
    GetPage(
        name: search,
        page: () => const SearchScreen(),
        binding: SearchScreenBindings()
    ),
    GetPage(
        name: profile,
        page: () => const ProfileScreen(),
        binding: ProfileScreenBindings()
    ),
    GetPage(
        name: groupProfile,
        page: () => const GroupProfileScreen(),
        binding: GroupProfileScreenBindings()
    ),
    GetPage(
        name: addFriend,
        page: () => const AddFriendScreen(),
        binding: AddFriendScreenBindings()
    ),
    GetPage(
        name: addGroup,
        page: () => const AddGroupScreen(),
        binding: AddGroupScreenBindings()
    ),
    GetPage(
        name: addFriendDetail,
        page: () => const AddFriendDetailScreen(),
        binding: AddFriendDetailScreenBindings()
    ),
    GetPage(
        name: qrCode,
        page: () => const QrCodeScreen(),
        binding: QrCodeScreenBindings()
    ),
    GetPage(
        name: createGroupIntroduction,
        page: () => const CreateGroupIntroductionScreen(),
        binding: CreateGroupIntroductionScreenBindings()
    ),
    GetPage(
        name: createGroup,
        page: () => const CreateGroupScreen(),
        binding: CreateGroupScreenBindings()
    ),
    GetPage(
        name: profileSetting,
        page: () => const ProfileSettingScreen(),
        binding: ProfileSettingScreenBindings()
    ),
  ];
}
