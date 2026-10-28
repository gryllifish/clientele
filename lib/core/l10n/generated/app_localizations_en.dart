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
  String get navPayments => 'Payments';

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

  @override
  String get transactionsTitle => 'Payments';

  @override
  String get transactionsPeriod => 'Last 30 days';

  @override
  String get transactionsHeadline => 'Payments\nreceived';

  @override
  String get periodTotal => '30-day total';

  @override
  String changeFromPrevious(String percent) {
    return '$percent vs prior period';
  }

  @override
  String get latestPayments => 'Latest payments';

  @override
  String transactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count payments',
      one: '1 payment',
    );
    return '$_temp0';
  }

  @override
  String get today => 'Today';

  @override
  String get noTransactions => 'No payments in the last 30 days.';

  @override
  String transactionSemantics(
    String title,
    String amount,
    String client,
    String date,
  ) {
    return '$title: $amount from $client, $date';
  }

  @override
  String get searchHint => 'Search by name or role';

  @override
  String get closeSearch => 'Close search';

  @override
  String noClientsMatch(String query) {
    return 'No clients match “$query”.';
  }

  @override
  String get notInDemo => 'Not part of this demo';

  @override
  String paymentsFromClient(String name) {
    return 'Payments from $name';
  }

  @override
  String clientPaymentsSummary(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count payments',
      one: '1 payment',
      zero: 'no payments',
    );
    return '$amount · $_temp0 in 30 days';
  }

  @override
  String get showAllClients => 'Show all clients';
}
