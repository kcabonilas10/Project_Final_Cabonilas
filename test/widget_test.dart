// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_cabonilas/main.dart';

void main() {
  testWidgets('Recipe app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RecipeApp());

    // Verify that the app starts with the home screen
    expect(find.text('Culinary Delight'), findsOneWidget);

    // Verify that we have category chips
    expect(find.byType(Chip), findsWidgets);

    // Add more specific tests as needed
  });
}