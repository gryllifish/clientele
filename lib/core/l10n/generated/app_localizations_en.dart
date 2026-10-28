// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Clientele';

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

  @override
  String get brandMark => 'fl.';

  @override
  String get search => 'Search';

  @override
  String get back => 'Back';

  @override
  String get moreOptions => 'More options';

  @override
  String openClientProfile(String name) {
    return 'Open $name\'s profile';
  }

  @override
  String get clientProfileTitle => 'Client profile';

  @override
  String workingTogetherSince(String year) {
    return 'Working together since $year';
  }

  @override
  String roleAtLocation(String role, String location) {
    return '$role · $location';
  }

  @override
  String get totalValue => 'Total value';

  @override
  String get projects => 'Projects';

  @override
  String get rating => 'Rating';

  @override
  String get nextSession => 'Next session';

  @override
  String sessionTime(String time, int minutes) {
    return '$time · $minutes min';
  }

  @override
  String get latestNote => 'Latest note';

  @override
  String get errorNotFound => 'We couldn\'t find that client.';

  @override
  String get valuePlaceholder => '–';
}
