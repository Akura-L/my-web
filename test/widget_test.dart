import 'package:flutter_test/flutter_test.dart';

import 'package:my_profile/main.dart';

void main() {
  testWidgets('Portfolio app loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyPortfolioApp());

    expect(find.text('Louis Alvin\nAkura'), findsOneWidget);
    expect(find.text('Explore my work'), findsOneWidget);
  });
}
