// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostel_management/main.dart';

void main() {
  testWidgets('App loads Login Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HostelApp());

    // Verify that Login text is present
    expect(find.text("Login"), findsOneWidget);
  });
}
