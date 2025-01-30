import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_response.freezed.dart';
part 'pagination_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginationResponse<T> with _$PaginationResponse<T> {
  const PaginationResponse._();

  factory PaginationResponse({
    @JsonKey(name: 'page') @Default(1) int currentPage,
    @JsonKey(name: 'pageSize') @Default(20) int pageSize,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'totalPages') @Default(0) int totalPages,
    @JsonKey(name: 'hasPrevPage') @Default(false) bool hasPrevPage,
    @JsonKey(name: 'hasNextPage') @Default(false) bool hasNextPage,
    @Default([]) @JsonKey(name: 'items') List<T> list,
  }) = _PaginationResponse<T>;

  factory PaginationResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationResponseFromJson<T>(json, fromJsonT);

  //workaround refer https://github.com/rrousselGit/freezed/issues/882 for more details
  Map<String, dynamic> toJson(Object? Function(T p1) toJsonT) {
    return super.toJson(toJsonT);
  }

  bool get hasLoadMore => hasPrevPage && hasNextPage;
}
