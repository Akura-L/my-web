import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_profile/main.dart';

void main() {
  testWidgets('Portfolio app loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyPortfolioApp());

    // Verify that the app loads with the profile name
    expect(find.text('Akura Louis Alvin'), findsOneWidget);
  });
}
