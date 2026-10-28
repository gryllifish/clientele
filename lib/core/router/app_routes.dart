/// Route paths. Features navigate with these constants so they never need
/// to import the router itself.
abstract final class AppRoutes {
  static const home = '/';

  /// Nested under [home], so back navigation returns to the dashboard.
  static const clientProfile = 'clients/:$clientIdParam';
  static const clientIdParam = 'id';

  /// Second tab. Pushed from a profile with [paymentsClientParam], it shows
  /// only that client's payments and back returns to the profile.
  static const payments = '/payments';
  static const paymentsClientParam = 'client';

  static String paymentsPath({int? clientId}) => switch (clientId) {
    final int id => '$payments?$paymentsClientParam=$id',
    null => payments,
  };

  static String clientProfilePath(int clientId) => '/clients/$clientId';
}
