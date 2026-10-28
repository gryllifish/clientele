// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Clientele';

  @override
  String get greetingMorning => 'Buenos días,';

  @override
  String get greetingAfternoon => 'Buenas tardes,';

  @override
  String get greetingEvening => 'Buenas noches,';

  @override
  String get totalClients => 'Clientes totales';

  @override
  String get clientsThisMonth => 'Este mes';

  @override
  String get addClient => 'Agregar cliente';

  @override
  String get yourClients => 'Tus clientes';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterOldest => 'Más antiguos';

  @override
  String get filterNewest => 'Más recientes';

  @override
  String get filterHot => 'Destacados';

  @override
  String get navHome => 'Inicio';

  @override
  String get navPayments => 'Pagos';

  @override
  String get navClients => 'Clientes';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get errorLoadData => 'No pudimos cargar tus datos.';

  @override
  String get errorUnexpected => 'Algo salió mal.';

  @override
  String get retry => 'Reintentar';

  @override
  String get brandMark => 'fl.';

  @override
  String get search => 'Buscar';

  @override
  String get back => 'Volver';

  @override
  String get moreOptions => 'Más opciones';

  @override
  String openClientProfile(String name) {
    return 'Abrir el perfil de $name';
  }

  @override
  String get clientProfileTitle => 'Perfil del cliente';

  @override
  String workingTogetherSince(String year) {
    return 'Trabajando juntos desde $year';
  }

  @override
  String roleAtLocation(String role, String location) {
    return '$role · $location';
  }

  @override
  String get totalValue => 'Valor total';

  @override
  String get projects => 'Proyectos';

  @override
  String get rating => 'Valoración';

  @override
  String get nextSession => 'Próxima sesión';

  @override
  String sessionTime(String time, int minutes) {
    return '$time · $minutes min';
  }

  @override
  String get latestNote => 'Última nota';

  @override
  String get errorNotFound => 'No encontramos ese cliente.';

  @override
  String get valuePlaceholder => '–';

  @override
  String get transactionsTitle => 'Pagos';

  @override
  String get transactionsPeriod => 'Últimos 30 días';

  @override
  String get transactionsHeadline => 'Pagos\nrecibidos';

  @override
  String get periodTotal => 'Total en 30 días';

  @override
  String changeFromPrevious(String percent) {
    return '$percent vs. período previo';
  }

  @override
  String get latestPayments => 'Últimos pagos';

  @override
  String transactionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagos',
      one: '1 pago',
    );
    return '$_temp0';
  }

  @override
  String get today => 'Hoy';

  @override
  String get noTransactions => 'No hubo pagos en los últimos 30 días.';

  @override
  String transactionSemantics(
    String title,
    String amount,
    String client,
    String date,
  ) {
    return '$title: $amount de $client, $date';
  }

  @override
  String get searchHint => 'Buscar por nombre o rol';

  @override
  String get closeSearch => 'Cerrar búsqueda';

  @override
  String noClientsMatch(String query) {
    return 'Ningún cliente coincide con “$query”.';
  }

  @override
  String get notInDemo => 'Esto no forma parte de la demo';

  @override
  String paymentsFromClient(String name) {
    return 'Pagos de $name';
  }

  @override
  String clientPaymentsSummary(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagos',
      one: '1 pago',
      zero: 'sin pagos',
    );
    return '$amount · $_temp0 en 30 días';
  }

  @override
  String get showAllClients => 'Ver todos los clientes';
}
