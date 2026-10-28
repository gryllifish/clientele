import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets('phones get the app edge to edge', (tester) async {
    await pumpApp(tester);

    expect(tester.getSize(find.byType(Scaffold).first), phoneSize);
  });

  testWidgets('wide screens get a phone-sized frame', (tester) async {
    await pumpApp(tester, size: const Size(1280, 900));

    expect(tester.getSize(find.byType(Scaffold).first), const Size(430, 852));
  });
}
