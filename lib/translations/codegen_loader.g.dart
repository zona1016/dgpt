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
  "app_name": "AIDAV2",
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
    "password_limit": "Password must be alplhanumeric and at least 8 characters long.",
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
  }
};
static const Map<String,dynamic> zh_Hans = {
  "app_name": "AIDAV2",
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
    "password_limit": "密码必须是字母和数字的组合，且至少8个字符长。",
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
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "zh_Hans": zh_Hans};
}
