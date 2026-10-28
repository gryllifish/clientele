import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';

/// A client of the signed-in user.
@freezed
abstract class Client with _$Client {
  const factory Client({
    required int id,
    required String name,
    required String role,

    /// Bundled image path, e.g. `assets/images/clients/client_01.jpg`.
    required String photoAsset,
    required DateTime onboardedAt,

    /// How active the relationship is right now; higher is hotter.
    required int hotScore,
  }) = _Client;

  const Client._();

  /// Whether this client was onboarded in the same calendar month as [date].
  bool wasOnboardedInMonthOf(DateTime date) =>
      onboardedAt.year == date.year && onboardedAt.month == date.month;

  /// Whether [query] appears in the name or role, ignoring case and
  /// surrounding spaces. A blank query matches every client.
  bool matches(String query) {
    final needle = query.trim().toLowerCase();
    return needle.isEmpty ||
        name.toLowerCase().contains(needle) ||
        role.toLowerCase().contains(needle);
  }
}
