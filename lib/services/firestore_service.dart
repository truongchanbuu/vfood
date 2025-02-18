import 'package:cloud_firestore/cloud_firestore.dart';

import '../cores/resources/data_state.dart';

abstract interface class FirestoreService<T> {
  CollectionReference get collection;

  Future<DataState<T>> getById({required String id});
  Future<DataState<T>> createById({
    required String id,
    required Map<String, dynamic> data,
  });
  Future<DataState<List<T>>> getAll({
    String? fieldPath,
    dynamic isEqualTo,
    dynamic isGreaterThan,
    dynamic isLessThan,
    int? limit,
    String? orderBy,
    bool? descending,
  });
  Future<DataState<T>> update({
    required String id,
    required Map<String, dynamic> updated,
  });
  Future<DataState<T>> delete({required String id});

  Stream<DataState<T>> watchById({required String id});
  Stream<DataState<List<T>>> watchAll({
    String? fieldPath,
    dynamic isEqualTo,
    int? limit,
    DocumentSnapshot? lastDocument,
  });
}
