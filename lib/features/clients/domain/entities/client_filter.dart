import 'package:clients_app/features/clients/domain/entities/client.dart';

/// Ways to sort or narrow down the client list.
enum ClientFilter {
  all,
  oldest,
  newest,
  hot;

  /// Returns a new unmodifiable list with this filter applied.
  List<Client> apply(List<Client> clients) => List<Client>.unmodifiable(
    switch (this) {
      all => clients,
      oldest => _byOnboarding(clients),
      newest => _byOnboarding(clients).reversed,
      hot => clients.where((client) => client.isHot),
    },
  );

  static List<Client> _byOnboarding(List<Client> clients) =>
      [...clients]..sort((a, b) => a.onboardedAt.compareTo(b.onboardedAt));
}
