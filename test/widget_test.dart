import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ercan_ant/app/app.dart';

void main() {
  testWidgets('uygulama baslangic ekranini olusturur', (tester) async {
    await tester.pumpWidget(const ErcanAntApp());
    await tester.pump();

    expect(find.text('ERCAN ANT'), findsWidgets);

    await tester.pumpWidget(const SizedBox());
  });
}
