enum AppRoute {
  home(path: '/home'),
  settings(path: '/settings');

  final String path;

  const AppRoute({
    required this.path,
  });
}
