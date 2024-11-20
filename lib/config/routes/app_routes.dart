enum AppRoute {
  home('/'),
  profile('/profile'),
  settings('/settings'),
  login('/login');

  final String path;
  const AppRoute(this.path);
}
