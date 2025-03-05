import '../../../shared/domain/repositories/hive_repository.dart';
import '../../domain/repositories/recent_search_repository.dart';
import '../models/recent_search_model.dart';

class RecentSearchRepositoryImpl implements RecentSearchRepository {
  final HiveRepository<RecentSearchModel> hiveRepository;
  const RecentSearchRepositoryImpl(this.hiveRepository);

  // [CREATE]
  @override
  Future<void> createRecentSearch(RecentSearchModel search) async =>
      await hiveRepository.create(search);

  // [READ]
  @override
  Future<List<RecentSearchModel>> getRecentSearches() async =>
      await hiveRepository.readAll();

  // [UPDATE]
  @override
  Future<void> updateRecentSearch(RecentSearchModel recentSearch) async =>
      await hiveRepository.update(recentSearch.query, recentSearch);

  // [DELETE]
  @override
  Future<void> clearRecentSearches() async => await hiveRepository.deleteAll();

  @override
  Future<void> deleteRecentSearch(String query) async =>
      await hiveRepository.delete(query);
}
