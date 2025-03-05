import '../../data/models/recent_search_model.dart';

abstract interface class RecentSearchRepository {
  Future<void> createRecentSearch(RecentSearchModel query);
  Future<List<RecentSearchModel>> getRecentSearches();
  Future<void> deleteRecentSearch(String query);
  Future<void> clearRecentSearches();
  Future<void> updateRecentSearch(RecentSearchModel recentSearch);
}
