import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TicketStatus {
  static const int going = 1;
  static const int pendingApproval = 0;
  static const int rejected = 3;
  static const int checkedIn = 2;
}

class PaymentStatus {
  static const int pending = 1;
  static const int paid = 2;
  static const int failed = 3;
}

class TutorialOrderStatus {
  static const int pending = 0;
  static const int enrolled = 1;
  static const int expired = 2;
}

class PaymentMethod {
  static const String usdt = 'usdt';
  static const String card = 'card';
}

class KYCStatus {
  static const int pending = 10;
  static const int approved = 20;
  static const int rejected = 30;
}

class NotificationType {
  static const int likeFeed = 101;
  static const int likeComment = 102;
  static const int likeReply = 103;
  static const int commentFeed = 104;
  static const int replyComment = 105;
  static const int tagUser = 106;
  static const int shareFeed = 107;
  static const int followUser = 201;
  static const int joinCommunity = 301;
  static const int feedCommunity = 302;
  static const int joinApproval = 303;
  static const int joinSuccess = 304;
  static const int joinReject = 305;
  static const int enrollTutorial = 401;
  static const int reviewTutorial = 402;
}

const int maxMediaCount = 10;
