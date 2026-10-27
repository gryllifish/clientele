import 'dart:convert';

import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/features/clients/data/models/client_dto.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clients_local_data_source.g.dart';

/// Reads clients from the bundled JSON mock.
class ClientsLocalDataSource {
  const ClientsLocalDataSource({
    required this._bundle,
    required this._now,
  });

  static const assetPath = 'assets/data/clients.json';

  /// Date the mock JSON was written against. Demo-only: dates are shifted by
  /// `now - authoredAt` so relative stats ("This month") always have data.
  static final authoredAt = DateTime.utc(2026, 5, 24, 10);

  final AssetBundle _bundle;
  final DateTime _now;

  /// Throws [StorageException] or [ParsingException].
  Future<List<ClientDto>> fetchClients() async {
    final String raw;
    try {
      raw = await _bundle.loadString(assetPath);
    } on Exception catch (error) {
      throw StorageException('Could not read $assetPath', cause: error);
    }

    try {
      final offset = _now.difference(authoredAt);
      return (jsonDecode(raw) as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(ClientDto.fromJson)
          .map((dto) => dto.copyWith(onboardedAt: dto.onboardedAt.add(offset)))
          .toList();
    } on Object catch (error) {
      // Malformed JSON surfaces as FormatException or TypeError.
      throw ParsingException('Invalid clients JSON', cause: error);
    }
  }
}

@riverpod
ClientsLocalDataSource clientsLocalDataSource(Ref ref) =>
    ClientsLocalDataSource(bundle: rootBundle, now: ref.watch(nowProvider));
