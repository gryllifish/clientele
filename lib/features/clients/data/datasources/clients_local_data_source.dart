import 'dart:convert';

import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/utils/demo_dates.dart';
import 'package:clients_app/features/clients/data/models/client_dto.dart';
import 'package:clients_app/features/clients/data/models/client_profile_dto.dart';
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

  final AssetBundle _bundle;
  final DateTime _now;

  /// See [DemoDates].
  Duration get _offset => DemoDates.offsetFor(_now);

  /// Throws [StorageException] or [ParsingException].
  Future<List<ClientDto>> fetchClients() async {
    final records = await _readRecords();
    return _parse(
      () => records
          .map(ClientDto.fromJson)
          .map((dto) => dto.copyWith(onboardedAt: dto.onboardedAt.add(_offset)))
          .toList(),
    );
  }

  /// Throws [NotFoundException], [StorageException] or [ParsingException].
  Future<ClientProfileDto> fetchClientProfile(int clientId) async {
    final records = await _readRecords();
    final record = _parse(
      () => records.where((record) => record['id'] == clientId).firstOrNull,
    );
    if (record == null) {
      throw NotFoundException('No client with id $clientId');
    }

    return _parse(() {
      final dto = ClientProfileDto.fromJson(
        record['profile'] as Map<String, dynamic>,
      );
      return dto.copyWith(nextSessionAt: dto.nextSessionAt.add(_offset));
    });
  }

  Future<List<Map<String, dynamic>>> _readRecords() async {
    final String raw;
    try {
      raw = await _bundle.loadString(assetPath);
    } on Exception catch (error) {
      throw StorageException('Could not read $assetPath', cause: error);
    }
    return _parse(
      () => (jsonDecode(raw) as List<dynamic>).cast<Map<String, dynamic>>(),
    );
  }

  T _parse<T>(T Function() parse) {
    try {
      return parse();
    } on Object catch (error) {
      // Malformed JSON surfaces as FormatException or TypeError.
      throw ParsingException('Invalid clients JSON', cause: error);
    }
  }
}

@riverpod
ClientsLocalDataSource clientsLocalDataSource(Ref ref) =>
    ClientsLocalDataSource(bundle: rootBundle, now: ref.watch(nowProvider));
