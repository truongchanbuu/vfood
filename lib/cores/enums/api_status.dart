enum ApiStatus {
  success(200),
  created(201),
  notFound(404);

  final int code;
  const ApiStatus(this.code);
}
