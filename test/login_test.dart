import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yourmuaa/view/login_page.dart';

void main() {
  testWidgets(
    "Harus ada teks Welcome",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      expect(find.text('Welcome'), findsOneWidget);
    },
  );

  testWidgets('Harus ada text form untuk input nama dan nomor',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));
    Finder inputForm = find.byType(TextFormField);
    expect(inputForm, findsNWidgets(3));
  });

  testWidgets('Harus ada text button login', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));
    Finder login = find.byType(MaterialButton);
    expect(login, findsNWidgets(1));
  });
}
