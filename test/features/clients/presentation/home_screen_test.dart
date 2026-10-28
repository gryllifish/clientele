import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('shows every client', (tester) async {
    await pumpApp(tester);

    for (var id = 1; id <= 5; id++) {
      expect(find.text('Client $id'), findsOneWidget);
    }
  });

  testWidgets('Hot keeps the four hottest clients', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Hot'));
    await tester.pumpAndSettle();

    expect(find.text('Client 3'), findsNothing);
    expect(find.text('Client 4'), findsOneWidget);
  });

  testWidgets('search narrows the grid and explains empty results', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.byTooltip('Search'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'role 2');
    await tester.pumpAndSettle();

    expect(find.text('Client 2'), findsOneWidget);
    expect(find.text('Client 1'), findsNothing);

    await tester.enterText(find.byType(TextField), 'nobody');
    await tester.pumpAndSettle();

    expect(find.text('No clients match “nobody”.'), findsOneWidget);
  });

  testWidgets('closing the search restores the grid', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byTooltip('Search'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'nobody');
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Close search'));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsNothing);
    expect(find.text('Client 1'), findsOneWidget);
  });

  testWidgets('tapping a client opens their profile', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Client 1'));
    await tester.pumpAndSettle();

    expect(find.text('Client profile'), findsOneWidget);
    expect(find.text('Final concepts are approved.'), findsOneWidget);
  });

  testWidgets('controls outside the demo explain themselves', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Insights'));
    await tester.pump();

    expect(find.text('Not part of this demo'), findsOneWidget);

    // Let the notice time out so no timer outlives the test.
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
