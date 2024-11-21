enum AppRoute {
  home('/'),
  profile('/profile'),
  settings('/settings'),
  explore('/explore'),
  login('/login');

  final String path;
  const AppRoute(this.path);
}
