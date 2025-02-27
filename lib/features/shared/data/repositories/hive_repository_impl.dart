import 'package:hive_ce/hive.dart';

import '../../../../config/log/app_logger.dart';
import '../../../../injection_container.dart';
import '../../domain/repositories/hive_repository.dart';
import '../models/hive_base_model.dart';

class HiveRepositoryImpl<T extends HiveBaseModel> implements HiveRepository<T> {
  final Box<Map<dynamic, dynamic>> box;
  final T Function() createInstance;

  HiveRepositoryImpl(this.box, this.createInstance);

  final AppLogger _appLogger = getIt.get<AppLogger>();

  @override
  Future<void> create(T item) async {
    try {
      await box.put(item.key, item.toJson());
    } catch (e) {
      _appLogger.e("ReadAll error: $e");
      rethrow;
    }
  }

  @override
  Future<T?> read(dynamic key) async {
    try {
      final map = box.get(key);
      if (map == null) return null;

      final instance = createInstance();
      return instance.fromJson(Map<String, dynamic>.from(map));
    } catch (e) {
      _appLogger.e("Read error: $e");
      rethrow;
    }
  }

  @override
  Future<List<T>> readAll() async {
    try {
      return box.values.map((map) {
        T instance = createInstance();
        instance = instance.fromJson(Map<String, dynamic>.from(map));
        return instance;
      }).toList();
    } catch (e) {
      _appLogger.e("ReadAll error: $e");
      rethrow;
    }
  }

  @override
  Future<List<T>> readAllByKey(key, value) async {
    try {
      return box.values.where((element) {
        return element[key] != null && element[key] == value;
      }).map((map) {
        T instance = createInstance();
        instance = instance.fromJson(Map.from(map));
        return instance;
      }).toList();
    } catch (e) {
      _appLogger.e("ReadAllByKey error: $e");
      rethrow;
    }
  }

  @override
  Future<void> update(dynamic key, T item) async {
    try {
      final existingValue = box.get(key);

      if (existingValue == null) {
        throw Exception('Item not found');
      }

      await box.put(key, item.toJson());

      final updatedValue = box.get(key);
      if (updatedValue == null) {
        throw Exception('Update failed');
      }
    } catch (e) {
      _appLogger.e('Cannot update: $e');
      rethrow;
    }
  }

  @override
  Future<void> delete(dynamic key) async {
    try {
      await box.delete(key);
    } catch (e) {
      _appLogger.e('Cannot delete: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      await box.clear();
    } catch (e) {
      rethrow;
    }
  }
}
