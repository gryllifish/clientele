import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Clientele'**
  String get appTitle;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning,'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon,'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening,'**
  String get greetingEvening;

  /// No description provided for @totalClients.
  ///
  /// In en, this message translates to:
  /// **'Total clients'**
  String get totalClients;

  /// No description provided for @clientsThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get clientsThisMonth;

  /// No description provided for @addClient.
  ///
  /// In en, this message translates to:
  /// **'Add client'**
  String get addClient;

  /// No description provided for @yourClients.
  ///
  /// In en, this message translates to:
  /// **'Your clients'**
  String get yourClients;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterOldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get filterOldest;

  /// No description provided for @filterNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get filterNewest;

  /// No description provided for @filterHot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get filterHot;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navPayments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get navPayments;

  /// No description provided for @navClients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get navClients;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @errorLoadData.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load your data.'**
  String get errorLoadData;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get errorUnexpected;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @brandMark.
  ///
  /// In en, this message translates to:
  /// **'fl.'**
  String get brandMark;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get moreOptions;

  /// No description provided for @openClientProfile.
  ///
  /// In en, this message translates to:
  /// **'Open {name}\'s profile'**
  String openClientProfile(String name);

  /// No description provided for @clientProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Client profile'**
  String get clientProfileTitle;

  /// No description provided for @workingTogetherSince.
  ///
  /// In en, this message translates to:
  /// **'Working together since {year}'**
  String workingTogetherSince(String year);

  /// No description provided for @roleAtLocation.
  ///
  /// In en, this message translates to:
  /// **'{role} · {location}'**
  String roleAtLocation(String role, String location);

  /// No description provided for @totalValue.
  ///
  /// In en, this message translates to:
  /// **'Total value'**
  String get totalValue;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @nextSession.
  ///
  /// In en, this message translates to:
  /// **'Next session'**
  String get nextSession;

  /// No description provided for @sessionTime.
  ///
  /// In en, this message translates to:
  /// **'{time} · {minutes} min'**
  String sessionTime(String time, int minutes);

  /// No description provided for @latestNote.
  ///
  /// In en, this message translates to:
  /// **'Latest note'**
  String get latestNote;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find that client.'**
  String get errorNotFound;

  /// No description provided for @valuePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'–'**
  String get valuePlaceholder;

  /// No description provided for @transactionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get transactionsTitle;

  /// No description provided for @transactionsPeriod.
  ///
  /// In en, this message translates to:
  /// **'Last 30 days'**
  String get transactionsPeriod;

  /// No description provided for @transactionsHeadline.
  ///
  /// In en, this message translates to:
  /// **'Payments\nreceived'**
  String get transactionsHeadline;

  /// No description provided for @periodTotal.
  ///
  /// In en, this message translates to:
  /// **'30-day total'**
  String get periodTotal;

  /// No description provided for @changeFromPrevious.
  ///
  /// In en, this message translates to:
  /// **'{percent} vs prior period'**
  String changeFromPrevious(String percent);

  /// No description provided for @latestPayments.
  ///
  /// In en, this message translates to:
  /// **'Latest payments'**
  String get latestPayments;

  /// No description provided for @transactionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 payment} other{{count} payments}}'**
  String transactionCount(int count);

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No payments in the last 30 days.'**
  String get noTransactions;

  /// No description provided for @transactionSemantics.
  ///
  /// In en, this message translates to:
  /// **'{title}: {amount} from {client}, {date}'**
  String transactionSemantics(
    String title,
    String amount,
    String client,
    String date,
  );

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or role'**
  String get searchHint;

  /// No description provided for @closeSearch.
  ///
  /// In en, this message translates to:
  /// **'Close search'**
  String get closeSearch;

  /// No description provided for @noClientsMatch.
  ///
  /// In en, this message translates to:
  /// **'No clients match “{query}”.'**
  String noClientsMatch(String query);

  /// No description provided for @notInDemo.
  ///
  /// In en, this message translates to:
  /// **'Not part of this demo'**
  String get notInDemo;

  /// No description provided for @paymentsFromClient.
  ///
  /// In en, this message translates to:
  /// **'Payments from {name}'**
  String paymentsFromClient(String name);

  /// No description provided for @clientPaymentsSummary.
  ///
  /// In en, this message translates to:
  /// **'{amount} · {count, plural, =0{no payments} =1{1 payment} other{{count} payments}} in 30 days'**
  String clientPaymentsSummary(String amount, int count);

  /// No description provided for @showAllClients.
  ///
  /// In en, this message translates to:
  /// **'Show all clients'**
  String get showAllClients;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
