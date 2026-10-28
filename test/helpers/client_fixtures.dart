import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';

final fixedNow = DateTime(2026, 5, 24, 9);

Client buildClient({
  required int id,
  required DateTime onboardedAt,
  required int hotScore,
}) => Client(
  id: id,
  name: 'Client $id',
  role: 'Role $id',
  photoAsset: 'assets/images/clients/client_0$id.jpg',
  onboardedAt: onboardedAt,
  hotScore: hotScore,
);

/// Ids 1..5 in default order.
/// Onboarding order: 3, 1, 5, 4, 2. Hot order: 4, 2, 5, 1, 3.
final List<Client> sampleClients = [
  buildClient(id: 1, onboardedAt: DateTime(2025, 10, 5), hotScore: 6),
  buildClient(id: 2, onboardedAt: DateTime(2026, 5, 20), hotScore: 9),
  buildClient(id: 3, onboardedAt: DateTime(2024, 1, 15), hotScore: 2),
  buildClient(id: 4, onboardedAt: DateTime(2026, 5, 2), hotScore: 10),
  buildClient(id: 5, onboardedAt: DateTime(2026, 2, 11), hotScore: 7),
];

final sampleProfile = ClientProfile(
  clientId: 1,
  location: 'Brooklyn, NY',
  totalValue: 18400,
  projectCount: 12,
  rating: 4.9,
  nextSession: ClientSession(
    startsAt: DateTime(2026, 5, 27, 10, 30),
    duration: const Duration(minutes: 60),
  ),
  latestNote: 'Final concepts are approved.',
);
