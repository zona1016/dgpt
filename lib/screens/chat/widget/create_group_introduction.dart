import 'package:aida/main.dart';
import 'package:aida/screens/chat/create_group_screen.dart';
import 'package:aida/screens/chat/widget/create_group.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tencent_cloud_chat_uikit/data_services/core/tim_uikit_wide_modal_operation_key.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/wide_popup.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateGroupIntroduction extends StatefulWidget {
  final ValueChanged<V2TimConversation>? directToChat;
  final VoidCallback? closeFunc;
  const CreateGroupIntroduction({Key? key, this.directToChat, this.closeFunc}) : super(key: key);

  static final groupTypeNameMap = {
    GroupType.Work: "好友工作群（Work）",
    GroupType.Public: "陌生人社交群（Public）",
    GroupType.Meeting: "临时会议群（Meeting）",
    // GroupType.AVChatRoom: "直播群（AVChatRoom）",
    GroupType.Community: "社群（Community）",
  };

  static final groupTypeDescriptionMap = {
    GroupType.Work: "类似普通微信群，创建后仅支持已在群内的好友邀请加群，且无需被邀请方同意或群主审批。",
    GroupType.Public:
    "类似 QQ 群，创建后群主可以指定群管理员，用户搜索群 ID 发起加群申请后，需要群主或管理员审批通过才能入群。",
    GroupType.Meeting: "创建后可以随意进出，且支持查看入群前消息；适合用于音视频会议场景、在线教育场景等与实时音视频产品结合的场景。",
    // GroupType.AVChatRoom: "创建后可以随意进出，没有群成员数量上限，但不支持历史消息存储；适合与直播产品结合，用于弹幕聊天场景。",
    GroupType.Community:
    "创建后可以随意进出，最多支持10w人，支持历史消息存储，用户搜索群 ID 发起加群申请后，无需管理员审批即可进群。",
  };

  static final groupTypeColorMap = {
    GroupType.Work: const Color(0xFF00449E),
    GroupType.Public: const Color(0xFF147AFF),
    GroupType.Meeting: const Color(0xFFF38787),
    // GroupType.AVChatRoom: const Color(0xFF8783F0),
    GroupType.Community: const Color(0xFF3371CD),
  };

  static final groupTypeImageMap = {
    GroupType.Work: 'assets/image/base/chat_work.png',
    GroupType.Public: 'assets/image/base/chat_public.png',
    GroupType.Meeting: 'assets/image/base/chat_meeting.png',
    // GroupType.AVChatRoom: const Color(0xFF8783F0),
    GroupType.Community: 'assets/image/base/chat_community.png',
  };

  @override
  State<CreateGroupIntroduction> createState() =>
      _CreateGroupIntroductionState();
}

class _CreateGroupIntroductionState extends State<CreateGroupIntroduction> {
  void createGroupFunc(GroupTypeForUIKit type) {
    final isWideScreen =
        TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;

    if (isWideScreen) {
      if(widget.closeFunc != null){
        widget.closeFunc!();
      }

      TUIKitWidePopup.showPopupWindow(
        operationKey: TUIKitWideModalOperationKey.chooseContacts,
        context: context,
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.4,
        title: TIM_t("选择联系人"),
        onSubmit: () {
          createGroupKey.currentState?.onSubmit();
        },
        child: (closeFunc) => CreateGroup(
          key: createGroupKey,
          convType: type,
          directToChat: widget.directToChat,
        ),
      );
    } else {
      Get.toNamed(AppRoutes.createGroup, arguments: CreateGroupScreenArgs(convType: type));
    }
  }

  handleTapTooltipItem(String groupType) {
    switch (groupType) {
      case GroupType.Work:
        createGroupFunc(GroupTypeForUIKit.work);
        break;
      case GroupType.Public:
        createGroupFunc(GroupTypeForUIKit.public);
        break;
      case GroupType.Meeting:
        createGroupFunc(GroupTypeForUIKit.meeting);
        break;
      case GroupType.AVChatRoom:
        createGroupFunc(GroupTypeForUIKit.chat);
        break;
      case GroupType.Community:
        launchUrl(
          Uri.parse("https://zhiliao.qq.com/#/"),
          mode: LaunchMode.externalApplication,
        );
        break;
    }
  }

  Widget renderGroupItem(String groupType) {
    return Container(
      decoration: BoxDecoration(
        color: BaseColors.primaryColor,
        borderRadius: BorderRadius.circular(5)
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () {
          handleTapTooltipItem(groupType);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                CreateGroupIntroduction.groupTypeImageMap[groupType]!,
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TIM_t(CreateGroupIntroduction.groupTypeNameMap[groupType]!),
                        style: const TextStyle(
                            fontSize: 16,
                            color: BaseColors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 13),
                      Text(
                        TIM_t(CreateGroupIntroduction
                            .groupTypeDescriptionMap[groupType]!),
                        style: const TextStyle(
                          fontSize: 12,
                          color: BaseColors.weakTextColor,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<DefaultThemeData>(context).theme;

    Widget createGroupList() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              renderGroupItem(GroupType.Work),
              renderGroupItem(GroupType.Public),
              renderGroupItem(GroupType.Meeting),
              // renderGroupItem(GroupType.AVChatRoom, TUITheme.light),
              renderGroupItem(GroupType.Community),
            ],
          ),
        ),
      );
    }

    return TUIKitScreenUtils.getDeviceWidget(
        context: context,
        desktopWidget: createGroupList(),
        defaultWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                renderGroupItem(GroupType.Work),
                renderGroupItem(GroupType.Public),
                renderGroupItem(GroupType.Meeting),
                // renderGroupItem(GroupType.AVChatRoom, TUITheme.light),
                renderGroupItem(GroupType.Community),
              ],
            ),
          ),
        )
    );
  }
}
