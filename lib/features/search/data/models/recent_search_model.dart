import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recent_search.dart';

part 'recent_search_model.g.dart';

@JsonSerializable()
class RecentSearchModel extends RecentSearch {
  const RecentSearchModel({
    required super.query,
    required super.searchedAt,
    super.userEmail,
    super.searchCount,
    super.foodCategory,
  });

  factory RecentSearchModel.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecentSearchModelToJson(this);
}
