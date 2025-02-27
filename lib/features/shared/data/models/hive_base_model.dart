abstract interface class HiveBaseModel<T> {
  dynamic get key;
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> map);
}
