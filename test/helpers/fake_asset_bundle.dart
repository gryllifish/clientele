import 'dart:convert';

import 'package:flutter/services.dart';

/// Serves a fixed string for any asset key.
class FakeAssetBundle extends CachingAssetBundle {
  FakeAssetBundle(this._content);

  /// Null simulates a missing asset.
  final String? _content;

  @override
  Future<ByteData> load(String key) async => switch (_content) {
    final String content => ByteData.sublistView(utf8.encode(content)),
    null => throw Exception('Asset not found: $key'),
  };
}
