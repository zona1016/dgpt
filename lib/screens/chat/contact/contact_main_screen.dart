import 'package:aida/screens/chat/chat_main_screen.dart';
import 'package:aida/screens/chat/contact/contact_main_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:aida/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitContact/tim_uikit_contact.dart';

class ContactMainScreen extends GetView<ContactMainScreenController> {
  const ContactMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBar: BaseAppBar(
          automaticallyImplyLeading: false,
          title: '',
          flexibleSpace: _topBar(context),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TIMUIKitContact(
                topList: [
                  TopListItem(
                      name: TIM_t('新的联系人'),
                      id: "newContact",
                      icon: Image.asset('assets/image/contact/new_friend.png'),
                      onTap: () {
                        Get.toNamed(AppRoutes.newContact);
                      }),
                  TopListItem(
                      name: TIM_t('我的群聊'),
                      id: "groupList",
                      icon: Image.asset('assets/image/contact/group.png'),
                      onTap: () {
                        Get.toNamed(AppRoutes.groupList);
                      }),
                ],
                onTapItem: (V2TimFriendInfo item) {
                  Get.toNamed(AppRoutes.chat, arguments: ChatMainScreenArgs(selectedConversation: V2TimConversation(
                      conversationID: "c2c_${item.userID}",
                      userID: item.userID,
                      showName: item.friendRemark ?? item.userProfile?.nickName,
                      type: 1)));
                },
                emptyBuilder: (context) => Center(
                  child: Text(TIM_t('无联系人')),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _topBar(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15)
              .copyWith(top: MediaQuery.of(context).padding.top),
          child: Row(
            children: [
              Text(
                TIM_t('通讯录'),
                style: fontSFProBold.copyWith(
                    fontSize: 20, color: BaseColors.primaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(child: Container()),
              PopupMenuButton<int>(
                icon: Image.asset(
                  "assets/image/base/user_add.png",
                  width: 22,
                  height: 22,
                ),
                offset: const Offset(0, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: BaseColors.primaryColor,
                      width: 0.5,
                    )),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/base/chat_addF.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          TIM_t('添加好友'),
                          style: fontSFProMedium.copyWith(
                              fontSize: 14, color: BaseColors.weakTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/base/chat_addG.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          TIM_t('添加群聊'),
                          style: fontSFProMedium.copyWith(
                              fontSize: 14, color: BaseColors.weakTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/base/chat_creatG.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          TIM_t('创建群聊'),
                          style: fontSFProMedium.copyWith(
                              fontSize: 14, color: BaseColors.weakTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  // 点击菜单项的处理逻辑
                  if (value == 1) {
                    Get.toNamed(AppRoutes.addFriend);
                  } else if (value == 2) {
                    Get.toNamed(AppRoutes.addGroup);
                  } else if (value == 3) {
                    Get.toNamed(AppRoutes.createGroupIntroduction);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
