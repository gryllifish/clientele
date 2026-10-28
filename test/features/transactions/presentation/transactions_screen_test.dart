import 'package:clients_app/shared/widgets/app_bottom_nav.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

Finder navTab(String label) =>
    find.descendant(of: find.byType(AppBottomNav), matching: find.text(label));

Future<void> openPaymentsTab(WidgetTester tester) =>
    tester.tap(navTab('Payments'));

void main() {
  testWidgets('the Payments tab shows every client payment', (tester) async {
    await pumpApp(tester);

    await openPaymentsTab(tester);
    await tester.pumpAndSettle();

    expect(
      find.text('Payments\nreceived.', findRichText: true),
      findsOneWidget,
    );
    expect(find.text(r'$600'), findsOneWidget);
    expect(find.text('3 payments'), findsOneWidget);
    expect(find.text('Today'), findsOneWidget);
    // A tab is a root: there is nothing to go back to.
    expect(find.byTooltip('Back'), findsNothing);
  });

  testWidgets('Home tab returns to the dashboard', (tester) async {
    await pumpApp(tester);
    await openPaymentsTab(tester);
    await tester.pumpAndSettle();

    await tester.tap(navTab('Home'));
    await tester.pumpAndSettle();

    expect(find.text('Client 1'), findsOneWidget);
  });

  testWidgets('a profile opens the payments of that client only', (
    tester,
  ) async {
    await pumpApp(tester);
    await tester.tap(find.text('Client 1'));
    await tester.pumpAndSettle();

    expect(find.text('Payments from Client 1'), findsOneWidget);
    expect(find.text(r'$100 · 1 payment in 30 days'), findsOneWidget);

    await tester.tap(find.text('Payments from Client 1'));
    await tester.pumpAndSettle();

    expect(find.text(r'$100'), findsOneWidget);
    expect(find.text('1 payment'), findsOneWidget);
    expect(find.byTooltip('Show all clients'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Client profile'), findsOneWidget);
  });

  testWidgets('clearing the client filter shows every payment', (
    tester,
  ) async {
    await pumpApp(tester);
    await tester.tap(find.text('Client 1'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Payments from Client 1'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Show all clients'));
    await tester.pumpAndSettle();

    expect(find.text('3 payments'), findsOneWidget);
    expect(find.byTooltip('Show all clients'), findsNothing);
  });

  testWidgets('with reduce motion, the total shows without counting', (
    tester,
  ) async {
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
    await pumpApp(tester);

    await openPaymentsTab(tester);
    // Two frames: one to switch the page, one for the instant animations.
    await tester.pump();
    await tester.pump();

    expect(find.text(r'$600'), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
