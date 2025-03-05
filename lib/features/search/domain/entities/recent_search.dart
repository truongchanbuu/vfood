import 'package:equatable/equatable.dart';

class RecentSearch extends Equatable {
  final String query;
  final DateTime searchedAt;
  final String? userEmail;
  final int searchCount;
  final String? foodCategory;

  const RecentSearch({
    required this.query,
    required this.searchedAt,
    this.userEmail,
    this.searchCount = 0,
    this.foodCategory,
  });

  RecentSearch copyWith({
    String? query,
    DateTime? searchedAt,
    String? userEmail,
    int? searchCount,
    String? foodCategory,
  }) {
    return RecentSearch(
      query: query ?? this.query,
      searchedAt: searchedAt ?? this.searchedAt,
      userEmail: userEmail ?? this.userEmail,
      searchCount: searchCount ?? this.searchCount,
      foodCategory: foodCategory ?? this.foodCategory,
    );
  }

  @override
  List<Object?> get props => [
        query,
        searchedAt,
        userEmail,
        searchCount,
        foodCategory,
      ];
}
