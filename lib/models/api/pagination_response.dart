import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_response.freezed.dart';
part 'pagination_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginationResponse<T> with _$PaginationResponse<T> {
  const PaginationResponse._();

  factory PaginationResponse({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(0) int perPage,
    @JsonKey(name: 'total') @Default(0) int total,
    @Default([]) @JsonKey(name: 'data') List<T> list,
  }) = _PaginationResponse<T>;

  factory PaginationResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationResponseFromJson<T>(json, fromJsonT);

  //workaround refer https://github.com/rrousselGit/freezed/issues/882 for more details
  Map<String, dynamic> toJson(Object? Function(T p1) toJsonT) {
    return super.toJson(toJsonT);
  }

  bool get hasLoadMore => currentPage != lastPage && currentPage < lastPage;
}
