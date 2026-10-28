/// Route paths. Features navigate with these constants so they never need
/// to import the router itself.
abstract final class AppRoutes {
  static const home = '/';

  /// Nested under [home], so back navigation returns to the dashboard.
  static const clientProfile = 'clients/:$clientIdParam';
  static const clientIdParam = 'id';

  static String clientProfilePath(int clientId) => '/clients/$clientId';
}
