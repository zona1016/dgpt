// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationResponseImpl<T> _$$PaginationResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$PaginationResponseImpl<T>(
      currentPage: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
      amountTotal: (json['amountTotal'] as num?)?.toInt() ?? 0,
      memberCount: (json['memberCount'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
      hasPrevPage: json['hasPrevPage'] as bool? ?? false,
      hasNextPage: json['hasNextPage'] as bool? ?? false,
      list: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList() ??
          const [],
    );

Map<String, dynamic> _$$PaginationResponseImplToJson<T>(
  _$PaginationResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.currentPage,
      'pageSize': instance.pageSize,
      'total': instance.total,
      'amountTotal': instance.amountTotal,
      'memberCount': instance.memberCount,
      'totalPages': instance.totalPages,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'items': instance.list.map(toJsonT).toList(),
    };
