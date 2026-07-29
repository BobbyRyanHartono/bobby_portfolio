import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bobby_portfolio/core/constants/test_keys.dart';
import 'package:bobby_portfolio/bobby_portfolio_app.dart';

void main() {
  testWidgets('BobbyPortfolioApp renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: BobbyPortfolioApp(key: TestKeys.app),
      ),
    );

    // Allow mock async data futures to resolve
    await tester.pumpAndSettle();

    // Verify main app title text is rendered
    expect(find.text('Samuel Bobby Ryan Hartono'), findsWidgets);
  });
}
