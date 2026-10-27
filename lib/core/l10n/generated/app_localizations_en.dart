// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Clients';

  @override
  String get greetingMorning => 'Good morning,';

  @override
  String get greetingAfternoon => 'Good afternoon,';

  @override
  String get greetingEvening => 'Good evening,';

  @override
  String get totalClients => 'Total clients';

  @override
  String get clientsThisMonth => 'This month';

  @override
  String get addClient => 'Add client';

  @override
  String get yourClients => 'Your clients';

  @override
  String get filterAll => 'All';

  @override
  String get filterOldest => 'Oldest';

  @override
  String get filterNewest => 'Newest';

  @override
  String get filterHot => 'Hot';

  @override
  String get navHome => 'Home';

  @override
  String get navInsights => 'Insights';

  @override
  String get navClients => 'Clients';

  @override
  String get navSettings => 'Settings';

  @override
  String get errorLoadData => 'We couldn\'t load your data.';

  @override
  String get errorUnexpected => 'Something went wrong.';

  @override
  String get retry => 'Retry';
}
