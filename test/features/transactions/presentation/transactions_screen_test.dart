import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

Future<void> openTransactions(WidgetTester tester) async {
  await tester.tap(find.text('Client 1'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('NEXT SESSION'));
}

void main() {
  testWidgets('the next session card opens the statement', (tester) async {
    await pumpApp(tester);

    await openTransactions(tester);
    await tester.pumpAndSettle();

    expect(
      find.text('Payments\nreceived.', findRichText: true),
      findsOneWidget,
    );
    expect(find.text(r'$600'), findsOneWidget);
    expect(find.text('3 transactions'), findsOneWidget);
    expect(find.text('Today'), findsOneWidget);
  });

  testWidgets('with reduce motion, the total shows without counting', (
    tester,
  ) async {
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
    await pumpApp(tester);

    await openTransactions(tester);
    // Two frames: one to push the page, one for the instant animations.
    await tester.pump();
    await tester.pump();

    expect(find.text(r'$600'), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
