import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sengiala_component_library/sengiala_component_library.dart';

void main() {
  testWidgets('SdcButton renders and handles interaction', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: SdcTheme.light(),
        home: Scaffold(
          body: SdcButton(label: 'Simpan', onPressed: () => pressed = true),
        ),
      ),
    );

    expect(find.text('Simpan'), findsOneWidget);
    await tester.tap(find.byType(SdcButton));
    expect(pressed, isTrue);
  });

  testWidgets('SdcButton disables interaction while loading', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SdcButton(label: 'Simpan', loading: true, onPressed: () {})),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
  });
}
