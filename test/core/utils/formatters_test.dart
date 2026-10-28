import 'package:clients_app/core/utils/formatters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('en');
    await initializeDateFormatting('es');
  });

  final session = DateTime(2024, 5, 27, 10, 30);

  test('shortDate is locale-aware', () {
    expect(Formatters.shortDate(session, 'en'), 'Mon, 27 May');
    expect(Formatters.shortDate(session, 'es'), 'lun, 27 may');
  });

  test('compactUsd abbreviates thousands', () {
    expect(Formatters.compactUsd(18400, 'en'), r'$18.4K');
  });

  test('monthDay is locale-aware', () {
    expect(Formatters.monthDay(session, 'en'), 'May 27');
    expect(Formatters.monthDay(session, 'es'), '27 may');
  });

  test('usd shows whole dollars with grouping', () {
    expect(Formatters.usd(24820, 'en'), r'$24,820');
    expect(Formatters.incomeUsd(4200, 'en'), r'+$4,200');
  });

  test('percent shows one decimal and drops the sign', () {
    expect(Formatters.percent(0.126, 'en'), '12.6%');
    expect(Formatters.percent(-0.05, 'en'), '5.0%');
  });

  test('rating always shows one decimal', () {
    expect(Formatters.rating(5, 'en'), '5.0');
    expect(Formatters.rating(4.9, 'es'), '4,9');
  });

  test('twoDigits pads single digits', () {
    expect(Formatters.twoDigits(6), '06');
    expect(Formatters.twoDigits(24), '24');
  });
}
