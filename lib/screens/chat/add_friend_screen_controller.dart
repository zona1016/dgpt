import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_self_info_view_model.dart';
import 'package:tencent_cloud_chat_uikit/data_services/friendShip/friendship_services.dart';
import 'package:tencent_cloud_chat_uikit/data_services/services_locatar.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';

class AddFriendScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<AddFriendScreenController>(() => AddFriendScreenController(), fenix: false, permanent: true);
  }
}

class AddFriendScreenController extends BaseController {
  final FriendshipServices friendshipServices =
  serviceLocator<FriendshipServices>();
  V2TimConversation? selectedConversation;
  final TUISelfInfoViewModel selfInfoViewModel =
  serviceLocator<TUISelfInfoViewModel>();

  @override
  void onInit() {
    super.onInit();
  }

}
