import 'package:clients_app/features/clients/domain/entities/client.dart';

final fixedNow = DateTime(2026, 5, 24, 9);

Client buildClient({
  required int id,
  required DateTime onboardedAt,
  bool isHot = false,
}) => Client(
  id: id,
  name: 'Client $id',
  role: 'Role $id',
  photoAsset: 'assets/images/clients/client_0$id.jpg',
  onboardedAt: onboardedAt,
  isHot: isHot,
);

/// Ids 1..4 in default order; onboarding order is 3, 1, 4, 2.
final List<Client> sampleClients = [
  buildClient(id: 1, onboardedAt: DateTime(2025, 10, 5), isHot: true),
  buildClient(id: 2, onboardedAt: DateTime(2026, 5, 20)),
  buildClient(id: 3, onboardedAt: DateTime(2024, 1, 15), isHot: true),
  buildClient(id: 4, onboardedAt: DateTime(2026, 5, 2)),
];
