import 'package:aida/screens/chat/add_friend_detail_screen.dart';
import 'package:aida/screens/chat/add_friend_screen_controller.dart';
import 'package:aida/screens/chat/profile_screen.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/data_services/core/tim_uikit_wide_modal_operation_key.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitAddFriend/tim_uikit_add_friend.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitAddFriend/tim_uikit_send_application.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/wide_popup.dart';

class AddFriendScreen extends GetView<AddFriendScreenController> {
  const AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        title: TIM_t("添加好友"),
        color: BaseColors.primaryColor,
      ),
      body: TIMUIKitAddFriend(onTapAlreadyFriendsItem: (V2TimUserFullInfo friendInfo) async {
        final checkFriend = await controller.friendshipServices.checkFriend(
            userIDList: [friendInfo.userID!],
            checkType: FriendTypeEnum.V2TIM_FRIEND_TYPE_SINGLE);
        if (checkFriend != null) {
          final res = checkFriend.first;
          if (res.resultCode == 0 && res.resultType != 0) {
            ToastUtils.showToast(title: TIM_t("该用户已是好友"));
            return;
          }
        }

        if (friendInfo.userID! == controller.selfInfoViewModel.loginInfo?.userID) {
          ToastUtils.showToast(title: TIM_t("该用户已是好友"));
          return;
        }
        final isDesktopScreen =
            TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;

        if (isDesktopScreen) {
          TUIKitWidePopup.showPopupWindow(
            operationKey: TUIKitWideModalOperationKey.addFriend,
            context: context,
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.4,
            title: TIM_t("添加好友"),
            child: (closeFuncSendApplication) => SendApplication(
                isShowDefaultGroup: false,
                friendInfo: friendInfo,
                model: controller.selfInfoViewModel),
          );
        } else {
          Get.toNamed(AppRoutes.addFriendDetail, arguments: AddFriendDetailScreenArgs(
            friendInfo: friendInfo,
            selfInfoViewModel: controller.selfInfoViewModel
          ));
        }
      }),
    );
  }
}
