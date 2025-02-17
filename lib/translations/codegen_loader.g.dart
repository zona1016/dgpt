// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "app_name": "Ai Pulse",
  "error": {
    "required": "The {} field is required.",
    "required_checkbox": "Please check the '{}' checkbox.",
    "min_max_digit_number": "Please enter {} - {} characters, consisting of letters and numbers.",
    "min_number": "The amount must be at least {}.",
    "max_number": "The amount must not exceed {}.",
    "not_same": "The two entries do not match.",
    "size": "Please enter {} characters.",
    "min_max": "Please enter {} - {} characters.",
    "email": "Please enter a valid email address.",
    "number": "Only numbers are allowed.",
    "number_min_max": "Please enter a value between {} and {}.",
    "file_type": "Supported file format is '{}'.",
    "file_size": "File size cannot exceed '{}'.",
    "password_limit": "The password must contain a combination of uppercase letters, lowercase letters, numbers, and symbols, and be at least 6 characters long.",
    "password_not_match": "Passwords do not match",
    "select_ticket_before_using_promo": "Please select a ticket before using the promo code",
    "please_enter_email": "Please enter an email",
    "discount_percent_cap": "Discount percentage cannot be greater than 100",
    "select_expire_date": "Please select an expiry date",
    "select_event_start_date": "Please select the event start date",
    "end_date_must_not_before_start_date": "End date must not be before the start date",
    "ticket_total_required": "Total tickets are required and must be greater than 1",
    "ticket_limit_time_required": "Ticket limit time range is required and must not be later than the event start time",
    "select_image": "Please select an image",
    "select_event_location": "Please select the event location",
    "select_start_date": "Please select the start date",
    "select_end_date": "Please select the end date",
    "select_event_type": "Please select the event type",
    "add_ticket_type": "Please add a ticket type",
    "add_promo_code": "Please add a promo code",
    "add_gift": "Please add a gift",
    "kyc_complete_profile": "Please complete your profile before proceed to KYC",
    "no_internet_connection": "No internet connection",
    "unknown_error": "Unknown error",
    "too_many_attempts": "Too many attempts. Please try again later.",
    "invalid_phone_number": "Invalid phone number",
    "invalid_verification_code": "Invalid verification code. Please try again.",
    "no_verification_id": "Please get the verification code first",
    "fill_all_required": "Please fill all the required fields",
    "order_expired": "The order has expired",
    "order_expired_and_cancelled": "The order expired and was automatically cancelled.",
    "connection_timeout": "Connection timed out"
  },
  "button": {
    "start": "Start",
    "news": "News",
    "back_home": "Back to Home",
    "cancel": "Cancel",
    "save": "Save",
    "done": "Done",
    "discard": "Discard",
    "verify": "Verify",
    "retry": "Retry",
    "ok": "Ok",
    "change": "Change",
    "resend": "Resend",
    "clear": "Clear",
    "confirm": "Confirm",
    "get_started": "Get Started",
    "next": "Next",
    "back": "Back",
    "delete_account": "Delete Account",
    "logout": "Logout",
    "register": "Register",
    "back_to_home": "Back to Home",
    "forgot_password": "Forgot Password?",
    "login": "Login",
    "create_account": "Create Account",
    "reset_password": "Reset Password",
    "reset": "Reset",
    "complete": "Complete",
    "download": "Download",
    "share": "Share",
    "remove": "Remove",
    "pay": "Pay",
    "same_as_buyer": "Same as buyer",
    "show_ticket": "Show Ticket",
    "edit": "Edit",
    "create_event": "Create Event",
    "back_to_edit": "Back to Edit",
    "handle_check_in": "Check-In",
    "cancel_event": "Cancel\nEvent",
    "collapse": "Less",
    "expand": "More",
    "completed_payment": "I have completed the payment",
    "send_verification_code": "Send",
    "select_date": "Select Date",
    "preview": "Preview",
    "add": "Add",
    "check_in": "Check In",
    "undo_check_in": "Undo Check In",
    "reject": "Reject",
    "approve": "Approve",
    "copy": "Copy",
    "pay_deposit": "Pay Deposit",
    "continue_payment": "Continue To Pay",
    "proceed_to_pay": "Go to pay",
    "copy_address": "Copy Address",
    "continue": "Continue",
    "skip": "Skip",
    "view_personality": "Click to view character settings",
    "submit": "Submit",
    "view_all": "View All",
    "enroll_now": "Enroll Now",
    "review": "Review",
    "start_tutorial": "Start Tutorial",
    "click_to_view": "Click to view",
    "upload": "Upload",
    "update": "Update Now",
    "later": "Later",
    "publish": "Publish",
    "delete": "Delete",
    "follow": "Follow",
    "send": "Send",
    "block": "Block",
    "unblock": "Unblock",
    "share_now": "Share Now",
    "join_now": "Join Now",
    "complete_now": "Complete Now"
  },
  "home": {
    "welcome_to_AI_PULSE": "Welcome To AI PULSE",
    "notice": "Notice",
    "invite": "Invite",
    "teaching": "Tutorial",
    "enterprise": "About Us",
    "not_activated": "Not activated",
    "activated": "Activated",
    "hourly_income": "Hourly income",
    "total_income": "Total\nincome",
    "recommend_friends": "Recommend friends",
    "unlock_unlimited_rewards": "Unlock unlimited rewards",
    "copy_invitation_link": "Copy invitation link",
    "download_save_image": "Download and save image",
    "seamless_computing_power_through_DePIN_network_for_AI": "Seamless computational capability,\nprovided for artificial intelligence,\nthrough the DePIN network. ",
    "did_not_receive_resend": "Didn't receive? Resend",
    "verify_email": "Verify email",
    "forgot_password": "Forgot password?",
    "enter_email_and_verification_code_to_retrieve": "Please enter your email and verification code to retrieve.",
    "select_country_or_region_for_document_issuance": "Select the country or region for document issuance",
    "select_document_type": "Select document type",
    "capture_passport_photo_requirements": "Capture your passport photo. The photo needs to be:",
    "requirement_bright_and_clear": "1. Bright and clear (good quality)",
    "requirement_no_cropping": "2. No cropping (all edges and corners of the document should be visible)",
    "upload_document": "Upload document",
    "waiting_for_certification": "Waiting for certification",
    "certified": "Certified",
    "no_account_register": "No account? Register now",
    "enter_email_and_password_to_login": "Please enter your email and password to login.",
    "enter_password": "Please enter your password",
    "confirm_password_again": "Confirm your password again",
    "login_agree_terms": "By logging in, you agree to the",
    "user_agreement": "User Agreement",
    "privacy_policy": "Privacy Policy",
    "did_not_receive_resend_again": "Didn't receive? Resend",
    "email_registration": "Email registration",
    "fill_information_to_register": "Please fill in the information to complete the registration.",
    "enter_invitation_code": "Enter your invitation code",
    "click_send_and_enter_email_code": "Click send and enter the email verification code.",
    "email_verification_code": "Email verification code",
    "continue_agree_terms": "By continuing, you agree to the",
    "registration_successful": "Registration successful!",
    "system_prompt": "System Prompt",
    "update_notification": "Update",
    "service_prompt": "Service",
    "system_announcement": "System",
    "contact_us": "Contact us",
    "company_introduction": "Company introduction",
    "verification_email_sent_message": "We have sent a verification message to your email, address: {}, please enter the code to complete the verification.",
    "passport": "PP",
    "id_card": "ID",
    "driver_license": "DL",
    "residence_permit": "RP",
    "fund_password_has_been_successfully_set": "Fund password has been successfully set"
  },
  "hashrate": {
    "details": "Details",
    "connecting_computing_power_center": "Connecting to Hashrate center",
    "please_wait": "Please wait",
    "computing_power_rental_in_progress": "Hashrate rental in progress",
    "enter_account_password": "Enter account password",
    "enter_transaction_password": "Enter your transaction password",
    "product_details": "Product details",
    "in_progress": "In progress",
    "rental": "Rental",
    "rented": "Rented",
    "computing_power_rental": "Rental",
    "computing_power_level": "Hashrate level",
    "income_analysis": "Income analysis",
    "help_friends_achieve_level": "Help {} friends achieve level {}",
    "team_members": "Team members",
    "direct_referral_count": "Direct referral count",
    "rent_to_earn": "Rent to earn",
    "contract_details": "Contract details",
    "rental_funds": "Rental funds",
    "rental_income": "Rental income",
    "daily_income": "Daily income",
    "income_details": "Income details",
    "team_computing_power_bonus": "Team bonus",
    "invitation_bonus": "Invitation bonus",
    "salary": "Salary",
    "team_data": "Team data",
    "price_per_unit": "Price per unit"
  },
  "profile": {
    "place_enter_a_nickname": "Place enter a nickname",
    "total_assets_usdt": "My total assets (USDT)",
    "computing_power_wallet": "Rental Account",
    "cash_wallet": "Cash Account",
    "withdraw": "Withdraw",
    "my_orders": "My orders",
    "share": "Share",
    "customer_service": "Customer service",
    "language_selection": "Language selection",
    "about_us": "About Us",
    "profile_account": "Profile account",
    "nickname": "Nickname",
    "email": "Email",
    "phone_number": "Phone number",
    "mobile_number": "Mobile number",
    "change_password": "Change your password",
    "enter_old_new_and_confirm_password": "Please enter your old password, new password, and confirm the new password",
    "enter_old_password": "Enter old password",
    "enter_new_password": "Enter new password",
    "reenter_new_password": "Re-enter new password",
    "email_verification": "Email verification",
    "enter_verification_code": "Enter verification code",
    "forgot_transaction_password": "Forgot transaction password",
    "click_continue_receive_email": "Click 'Continue', and your email will receive a message",
    "reset_transaction_password": "Reset transaction password",
    "enter_old_transaction_password": "Enter old transaction password",
    "enter_new_transaction_password": "Enter new transaction password",
    "reenter_new_transaction_password": "Re-enter new transaction password",
    "settings": "Settings",
    "profile_details": "Profile details",
    "change_login_password": "Change login password",
    "my_assets": "My assets",
    "deposit": "Deposit",
    "transfer_assets": "Transfer",
    "withdraw_assets": "Withdraw",
    "fund_records": "Fund records",
    "transfer_records": "Transfer records",
    "amount": "Amount",
    "enter_amount": "Enter amount",
    "confirm_deposit": "Confirm deposit",
    "tips": "Tips",
    "minimum_deposit_amount": "1. Minimum deposit amount is 10 USDT",
    "tutorial_center": "Tutorial center",
    "successfully_changed_the_fund_password": "Successfully changed the fund password",
    "successfully_reset_the_fund_password": "Successfully reset the fund password",
    "password_changed_successfully": "Password changed successfully",
    "password_reset_successfully": "Password reset successfully",
    "reset_login_password_tip": "For the security of your funds and information, please reset your login password.",
    "logout_success": "Logout Success! ",
    "login_success": "Login Success! ",
    "payment_method": "Payment method",
    "reset_mailbox": "Reset Mailbox",
    "fa_settings": "2FA Settings"
  },
  "ai": {
    "how_do_I_make_an_HTTP": "How do I make an HTTP?",
    "ask_any_question": "Feel free to ask any question!",
    "welcome_to_use": "Welcome to use",
    "aip_ai_description": "AIP-AI: Driving the future of LLM models. Your all-in-one AI assistant, helping seamlessly integrate intelligence and innovation."
  },
  "tip": {
    "copy_success": "Copy success",
    "no_data": "No Data"
  },
  "tab": {
    "rental": "Rental",
    "home": "Home",
    "statement": "Statement",
    "profile": "Profile"
  }
};
static const Map<String,dynamic> zh_Hans = {
  "app_name": "Ai Pulse",
  "error": {
    "required": "{} 输入内容不能为空",
    "required_checkbox": "请勾选 '{}'",
    "min_max_digit_number": "请输入 {} - {} 位, 由字母和数字组成",
    "min_number": "金额必须至少为{}。",
    "max_number": "金额不能超过{}。",
    "not_same": "两次输入不一致",
    "size": "请输入 {} 位",
    "min_max": "请输入 {} - {} 位",
    "email": "请输入正确邮箱",
    "number": "只能输入数字",
    "number_min_max": "请输入 {} - {}",
    "file_type": "支持的文件格式为'{}'.",
    "file_size": "文件大小不能超过'{}'.",
    "password_limit": "密码必须是大写字母、小写字母、数字、符号组合，且至少6个字符长。",
    "password_not_match": "密码不一致",
    "select_ticket_before_using_promo": "请先选择门票再使用优惠码",
    "please_enter_email": "请输入邮箱",
    "discount_percent_cap": "减免比例不能大于100",
    "select_expire_date": "请选择截止日期",
    "select_event_start_date": "请选择活动开始时间",
    "end_date_must_not_before_start_date": "结束时间不得早于开始时间",
    "ticket_total_required": "门票总数为必选项, 且大于1",
    "ticket_limit_time_required": "门票限制项中限制起止为必选项, 且不得晚于活动开始时间",
    "select_image": "请选择图片",
    "select_event_location": "请选择活动地点",
    "select_start_date": "请选择开始时间",
    "select_end_date": "请选择结束时间",
    "select_event_type": "请选择活动类别",
    "add_ticket_type": "请添加票形式",
    "add_promo_code": "请添加优惠券",
    "add_gift": "请添加优礼品",
    "kyc_complete_profile": "请完善您的个人资料以继续验证",
    "no_internet_connection": "无网络连接",
    "unknown_error": "未知错误",
    "too_many_attempts": "尝试次数过多，请稍后再试。",
    "invalid_phone_number": "无效的电话号码",
    "invalid_verification_code": "验证码无效。请重试。",
    "no_verification_id": "请先获取验证码",
    "fill_all_required": "请填写所有必填字段",
    "order_expired": "订单已过期",
    "order_expired_and_cancelled": "订单过期并已自动取消",
    "connection_timeout": "请求超时"
  },
  "button": {
    "start": "开始",
    "news": "新闻",
    "back_home": "返回首页",
    "cancel": "取消",
    "save": "保存",
    "done": "完成",
    "discard": "放弃",
    "verify": "验证",
    "retry": "重试",
    "ok": "好的",
    "change": "更改",
    "resend": "重发",
    "clear": "清除",
    "confirm": "确定",
    "get_started": "立即开始",
    "next": "下一步",
    "back": "上一步",
    "delete_account": "删除账户",
    "logout": "退出登录",
    "register": "创建账户",
    "back_to_home": "回到首页",
    "forgot_password": "忘记密码？",
    "login": "登录",
    "create_account": "注册",
    "reset_password": "重置密码",
    "reset": "重置",
    "complete": "完成",
    "download": "下载",
    "share": "分享",
    "remove": "移除",
    "pay": "付款",
    "same_as_buyer": "与购买人信息相同",
    "show_ticket": "展示票",
    "edit": "编辑",
    "create_event": "创建活动",
    "back_to_edit": "返回编辑",
    "handle_check_in": "签到",
    "cancel_event": "取消\n活动",
    "collapse": "收起",
    "expand": "展开",
    "completed_payment": "我已完成付款",
    "send_verification_code": "发送验证码",
    "select_date": "选择日期",
    "preview": "预览",
    "add": "添加",
    "approve": "批准",
    "reject": "拒绝",
    "undo_check_in": "撤消登记",
    "check_in": "登记",
    "copy": "复制",
    "pay_deposit": "支付定金",
    "proceed_to_pay": "前往支付",
    "continue_payment": "继续付款",
    "copy_address": "复制\n地址",
    "continue": "继续",
    "skip": "跳过",
    "view_personality": "点击前往查看人设",
    "submit": "提交",
    "view_all": "查看全部",
    "enroll_now": "立即报名",
    "review": "评价",
    "start_tutorial": "开始教程",
    "click_to_view": "点击查看",
    "upload": "上传",
    "update": "立即更新",
    "later": "稍后",
    "publish": "发布",
    "delete": "删除",
    "follow": "关注",
    "send": "发送",
    "block": "屏蔽",
    "unblock": "取消屏蔽",
    "share_now": "立即分享",
    "join_now": "立即参加",
    "complete_now": "立即完成"
  },
  "home": {
    "welcome_to_AI_PULSE": "AI PULSE欢迎您",
    "notice": "通告",
    "invite": "邀请",
    "teaching": "教学",
    "enterprise": "企业",
    "not_activated": "未激活",
    "activated": "已激活",
    "hourly_income": "每小时收益",
    "total_income": "总收益",
    "recommend_friends": "推荐好友",
    "unlock_unlimited_rewards": "解锁无限奖励",
    "copy_invitation_link": "复制邀请链接",
    "download_save_image": "下载保存图片",
    "seamless_computing_power_through_DePIN_network_for_AI": "通过DePIN网络为人工智能\n提供无缝计算能力链接。",
    "did_not_receive_resend": "没有收到？重新发送 ",
    "verify_email": "验证邮箱",
    "forgot_password": "忘记密码？",
    "enter_email_and_verification_code_to_retrieve": "请输入您的邮箱及验证码以完成找回。",
    "select_country_or_region_for_document_issuance": "选择签发您文件的国家或区域",
    "select_document_type": "选择您的文件类型",
    "capture_passport_photo_requirements": "拍摄您的护照照片。照片需要：",
    "requirement_bright_and_clear": "1. 明亮且清晰（质量好）",
    "requirement_no_cropping": "2. 无裁剪（文件的所有边角需清晰可见）",
    "upload_document": "上传文件",
    "waiting_for_certification": "等待通过认证",
    "certified": "已认证",
    "no_account_register": "没有账号?去注册",
    "enter_email_and_password_to_login": "请输入您的邮箱和密码以完成登录。",
    "enter_password": "请输入您的密码",
    "confirm_password_again": "再次确认您的密码",
    "login_agree_terms": "登录即表示同意",
    "user_agreement": "用户协议",
    "privacy_policy": "隐私政策",
    "did_not_receive_resend_again": "未收到？重新发送 ",
    "email_registration": "邮箱注册",
    "fill_information_to_register": "请填写相关信息以完成注册。",
    "enter_invitation_code": "请输入您的邀请码",
    "click_send_and_enter_email_code": "点击发送和输入邮箱验证码。",
    "email_verification_code": "邮箱验证码",
    "continue_agree_terms": "继续即表示同意",
    "registration_successful": "注册成功！",
    "update_notification": "更新提示",
    "system_prompt": "系统提示",
    "service_prompt": "服务提示",
    "system_announcement": "系统通告",
    "contact_us": "联系我们",
    "company_introduction": "公司介绍",
    "verification_email_sent_message": "我们已经发送一条验证信息至您的邮箱，邮箱地址为{},请输入验证码以完成验证。",
    "passport": "护照",
    "id_card": "身份证",
    "driver_license": "驾驶证",
    "residence_permit": "居留证",
    "fund_password_has_been_successfully_set": "资金密码设置成功"
  },
  "hashrate": {
    "details": "详情",
    "connecting_computing_power_center": "正在链接算力中心",
    "please_wait": "请稍等",
    "computing_power_rental_in_progress": "算力租借进行中",
    "enter_account_password": "输入账户密码",
    "enter_transaction_password": "请输入您的账户交易密码",
    "product_details": "产品详情",
    "in_progress": "进行中",
    "rental": "租借",
    "rented": "已租借",
    "computing_power_rental": "算力租借",
    "computing_power_level": "算力等级",
    "income_analysis": "收益分析",
    "help_friends_achieve_level": "帮助{}位好友成为等级{}",
    "team_members": "团队人数",
    "direct_referral_count": "直推人数",
    "rent_to_earn": "租借以获得",
    "contract_details": "合约详情",
    "rental_funds": "租借资金",
    "rental_income": "租借收益",
    "daily_income": "日收益",
    "income_details": "收益明细",
    "team_computing_power_bonus": "团队算力奖",
    "invitation_bonus": "邀请奖",
    "salary": "薪资",
    "team_data": "团队数据",
    "price_per_unit": "每个单位价格"
  },
  "profile": {
    "place_enter_a_nickname": "请输入昵称",
    "total_assets_usdt": "我的总资产(USDT)",
    "computing_power_wallet": "租赁账户",
    "cash_wallet": "现金账户",
    "withdraw": "提款",
    "my_orders": "我的订单",
    "share": "分享",
    "customer_service": "客服",
    "language_selection": "语言选择",
    "about_us": "关于我们",
    "profile_account": "个人资料账户",
    "nickname": "昵称",
    "email": "邮箱",
    "phone_number": "手机号",
    "mobile_number": "手机号码",
    "change_password": "更改您的密码",
    "enter_old_new_and_confirm_password": "请输入您的旧密码，新密码和再次确认新的密码",
    "enter_old_password": "请输入旧密码",
    "enter_new_password": "请输入新密码",
    "reenter_new_password": "请再次输入新密码",
    "email_verification": "邮箱验证",
    "enter_verification_code": "输入验证码",
    "forgot_transaction_password": "忘记资金密码",
    "click_continue_receive_email": "点击‘继续’，您的邮箱将会收到一封邮件",
    "reset_transaction_password": "重置资金密码",
    "enter_old_transaction_password": "请输入旧的资金密码",
    "enter_new_transaction_password": "请输入新的资金密码",
    "reenter_new_transaction_password": "请再次输入新的资金密码",
    "settings": "设定",
    "profile_details": "个人资料详情",
    "change_login_password": "更改登入密码",
    "my_assets": "我的资产",
    "deposit": "充值",
    "transfer_assets": "转移资产",
    "withdraw_assets": "提现",
    "fund_records": "资金记录",
    "transfer_records": "转账记录",
    "amount": "数额",
    "enter_amount": "请输入金额",
    "confirm_deposit": "确认充值",
    "tips": "贴士",
    "minimum_deposit_amount": "1. 最低充值数额为 10 USDT",
    "tutorial_center": "教程中心",
    "successfully_changed_the_fund_password": "修改资金密码成功",
    "successfully_reset_the_fund_password": "重置资金密码成功",
    "password_changed_successfully": "修改密码成功",
    "password_reset_successfully": "重置密码成功",
    "reset_login_password_tip": "为了您的资金及信息安全，请重置登录密码。",
    "logout_success": "退出成功! ",
    "login_success": "登录成功! ",
    "payment_method": "支付方式",
    "reset_mailbox": "重置邮件箱",
    "fa_settings": "2FA设置"
  },
  "ai": {
    "how_do_I_make_an_HTTP": "如何发起 HTTP 请求？",
    "ask_any_question": "请尽管发问任何问题！",
    "welcome_to_use": "欢迎使用",
    "aip_ai_description": "AIP-AI：驱动未来LLM模型。您全方位的人工智能助手，助力智能与创新无缝融合。"
  },
  "tip": {
    "copy_success": "复制成功",
    "no_data": "暂无数据"
  },
  "income": {
    "copy_success": "复制成功",
    "no_data": "暂无数据"
  },
  "tab": {
    "rental": "算力租借",
    "home": "首页",
    "statement": "交易明细",
    "profile": "个人资料"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "zh_Hans": zh_Hans};
}
