import 'package:freezed_annotation/freezed_annotation.dart';

enum UIState { initial, loading, partialSuccess, success, error }

enum AppLoadingState {
  normal,
  pullToRefresh,
  loadMore,
  background,
  backgroundWithoutError
}

enum PaymentType {
  eventDeposit,
  eventPendingDeposit,
  eventPayment,
  tutorialPayment,
  communityPayment,
}

enum FeedPrivacy {
  @JsonValue(0)
  public,
  @JsonValue(1)
  follower,
  @JsonValue(2)
  onlyMe
}

enum PostMessageType { comment, reply }

enum PostMediaType { image, video }

extension FeedPrivacyExtension on FeedPrivacy {
  int get value {
    switch (this) {
      case FeedPrivacy.public:
        return 0;
      case FeedPrivacy.follower:
        return 1;
      case FeedPrivacy.onlyMe:
        return 2;
    }
  }
}

