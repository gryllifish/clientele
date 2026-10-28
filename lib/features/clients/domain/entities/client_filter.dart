import 'package:clients_app/features/clients/domain/entities/client.dart';

/// Ways to sort or narrow down the client list.
enum ClientFilter {
  all,
  oldest,
  newest,
  hot;

  /// How many clients the [hot] filter keeps.
  static const hotLimit = 4;

  /// Returns a new unmodifiable list with this filter applied.
  List<Client> apply(List<Client> clients) => List<Client>.unmodifiable(
    switch (this) {
      all => clients,
      oldest => _byOnboarding(clients),
      newest => _byOnboarding(clients).reversed,
      hot => _byHotScore(clients).take(hotLimit),
    },
  );

  static List<Client> _byOnboarding(List<Client> clients) =>
      [...clients]..sort((a, b) => a.onboardedAt.compareTo(b.onboardedAt));

  static List<Client> _byHotScore(List<Client> clients) =>
      [...clients]..sort((a, b) => b.hotScore.compareTo(a.hotScore));
}
