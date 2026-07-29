import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bobby_portfolio/bobby_portfolio_app.dart';
import 'package:bobby_portfolio/core/constants/test_keys.dart';

void main() {
  testWidgets('Verify all test_ids (Widget Keys) render and interact correctly',
      (WidgetTester tester) async {
    // Set desktop screen size for navigation bar items test
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      const ProviderScope(
        child: BobbyPortfolioApp(key: TestKeys.app),
      ),
    );
    await tester.pumpAndSettle();

    // 1. Verify App root test_id
    expect(find.byKey(TestKeys.app), findsOneWidget);

    // 2. Verify Theme toggle test_id and interaction
    final themeToggleFinder = find.byKey(TestKeys.themeToggle);
    expect(themeToggleFinder, findsOneWidget);

    // Tap theme toggle button
    await tester.tap(themeToggleFinder);
    await tester.pumpAndSettle();

    // 3. Verify Desktop Navigation items test_ids
    expect(find.byKey(TestKeys.navItem('Home')), findsOneWidget);
    expect(find.byKey(TestKeys.navItem('About')), findsOneWidget);
    expect(find.byKey(TestKeys.navItem('Experience')), findsOneWidget);
    expect(find.byKey(TestKeys.navItem('Projects')), findsOneWidget);
    expect(find.byKey(TestKeys.navItem('Skills')), findsOneWidget);
    expect(find.byKey(TestKeys.navItem('Contact')), findsOneWidget);

    // 4. Verify Hero Action buttons test_ids
    expect(find.byKey(TestKeys.heroProjectsButton), findsOneWidget);
    expect(find.byKey(TestKeys.heroContactButton), findsOneWidget);

    // 5. Verify Contact Form test_ids
    // Scroll down to reveal contact section inputs
    await tester.scrollUntilVisible(
      find.byKey(TestKeys.contactNameInput),
      300.0,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    expect(find.byKey(TestKeys.contactNameInput), findsOneWidget);
    expect(find.byKey(TestKeys.contactEmailInput), findsOneWidget);
    expect(find.byKey(TestKeys.contactSubjectInput), findsOneWidget);
    expect(find.byKey(TestKeys.contactMessageInput), findsOneWidget);
    expect(find.byKey(TestKeys.contactSubmitButton), findsOneWidget);

    // Enter test text using test_ids
    await tester.enterText(find.byKey(TestKeys.contactNameInput), 'Tester Bobby');
    await tester.enterText(find.byKey(TestKeys.contactEmailInput), 'test@example.com');
    await tester.enterText(find.byKey(TestKeys.contactSubjectInput), 'Testing agy CLI test_ids');
    await tester.enterText(find.byKey(TestKeys.contactMessageInput), 'Hello from agy cli test!');
    await tester.pumpAndSettle();

    // Verify entered text
    expect(find.text('Tester Bobby'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);

    // Submit form via test_id
    await tester.tap(find.byKey(TestKeys.contactSubmitButton));
    await tester.pumpAndSettle();

    // Verify success banner appears
    expect(find.textContaining('Message sent successfully!'), findsOneWidget);
  });
}
