// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchModel _$RecentSearchModelFromJson(Map<String, dynamic> json) =>
    RecentSearchModel(
      query: json['query'] as String,
      searchedAt: DateTime.parse(json['searchedAt'] as String),
      userEmail: json['userEmail'] as String?,
      searchCount: (json['searchCount'] as num?)?.toInt() ?? 0,
      foodCategory: json['foodCategory'] as String?,
    );

Map<String, dynamic> _$RecentSearchModelToJson(RecentSearchModel instance) =>
    <String, dynamic>{
      'query': instance.query,
      'searchedAt': instance.searchedAt.toIso8601String(),
      'userEmail': instance.userEmail,
      'searchCount': instance.searchCount,
      'foodCategory': instance.foodCategory,
    };
