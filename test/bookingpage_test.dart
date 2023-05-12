import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yourmuaa/view/bookingmua.dart';

void main() {
  testWidgets('Harus ada text form untuk input nama dan nomor',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BookingPage(),
    ));
    Finder inputForm = find.byType(TextFormField);
    expect(inputForm, findsNWidgets(3));
  });

  testWidgets('harus ada radio button', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BookingPage(),
    ));
    Finder radioButt = find.byType(ListTile);
    expect(radioButt, findsNWidgets(2));
  });
}
