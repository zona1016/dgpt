import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  @JsonKey(name: "id", defaultValue: 0)
  final int? id;
  @JsonKey(name: "uid", defaultValue: 0)
  final int? uid;
  @JsonKey(name: "name", defaultValue: '')
  final String? name;
  @JsonKey(name: "email", defaultValue: '')
  final String? email;
  @JsonKey(name: "phone", defaultValue: '')
  final String? phone;
  @JsonKey(name: "email_verified_at")
  final String? emailVerifiedAt;
  @JsonKey(name: "profile_img")
  final String? profileImg;
  @JsonKey(name: "cover_img")
  final String? coverImg;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "nickname")
  final String? nickname;
  @JsonKey(name: "google_id")
  final String? googleId;
  @JsonKey(name: "apple_id")
  final String? appleId;
  @JsonKey(name: "ref_code")
  final String? refCode;
  @JsonKey(name: "user_ref")
  final String? userRef;
  @JsonKey(name: "bio")
  final String? bio;
  @JsonKey(name: "dob")
  final String? dob;
  @JsonKey(name: "badge")
  final String? badge;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "label")
  final String? label;
  @JsonKey(name: "life_path_num")
  final String? lifePathNum;
  @JsonKey(name: "personality")
  final String? personality;
  @JsonKey(name: "web_url")
  final String? webUrl;
  @JsonKey(name: "twitter_url")
  final String? twitterUrl;
  @JsonKey(name: "linkedin_url")
  final String? linkedinUrl;
  @JsonKey(name: "fb_url")
  final String? fbUrl;
  @JsonKey(name: "ig_url")
  final String? igUrl;
  @JsonKey(name: "last_login_date")
  final String? lastLoginDate;
  @JsonKey(name: "kyc")
  final String? kyc;
  @JsonKey(name: "badges")
  final List<dynamic>? badges;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "following")
  final int? following;
  @JsonKey(name: "follower")
  final int? follower;
  @JsonKey(name: "followed_by_user")
  final bool? followedByUser;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "level")
  final int? level;
  @JsonKey(name: "level_img")
  final String? levelImg;
  @JsonKey(name: "interests")
  final List<dynamic>? interests;

  UserInfo ({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.profileImg,
    this.coverImg,
    this.username,
    this.nickname,
    this.googleId,
    this.appleId,
    this.refCode,
    this.userRef,
    this.bio,
    this.dob,
    this.badge,
    this.gender,
    this.label,
    this.lifePathNum,
    this.personality,
    this.webUrl,
    this.twitterUrl,
    this.linkedinUrl,
    this.fbUrl,
    this.igUrl,
    this.lastLoginDate,
    this.kyc,
    this.badges,
    this.status,
    this.following,
    this.follower,
    this.followedByUser,
    this.createdAt,
    this.updatedAt,
    this.level,
    this.levelImg,
    this.interests,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(this);
  }
}


