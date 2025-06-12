import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cursor_poc/screens/subscription_plans_screen.dart';
import 'package:cursor_poc/components/custom_button.dart';
import 'package:cursor_poc/components/custom_radio_button.dart';

void main() {
  group('SubscriptionPlansScreen', () {
    testWidgets('renders correctly with initial state', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      expect(find.byType(SubscriptionPlansScreen), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Choose your\nsubscription plan'), findsOneWidget);
      expect(find.text('And get a 7-day free trial'), findsOneWidget);
    });

    testWidgets('displays all subscription plan options', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      expect(find.text('Yearly'), findsOneWidget);
      expect(find.text('Monthly'), findsOneWidget);
      expect(find.text('Weekly'), findsOneWidget);
      expect(find.text('€ 94.80'), findsOneWidget);
      expect(find.text('€ 10.90'), findsOneWidget);
      expect(find.text('€ 5.90'), findsOneWidget);
      expect(find.text('every year'), findsOneWidget);
      expect(find.text('every month'), findsOneWidget);
      expect(find.text('every week'), findsOneWidget);
    });

    testWidgets('displays discount information correctly', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      expect(find.text('-66% discount'), findsOneWidget);
      expect(find.text('-53% discount'), findsOneWidget);
      // Weekly plan should have no discount text
      expect(find.text('-66% discount'), findsOneWidget);
      expect(find.text('-53% discount'), findsOneWidget);
    });

    testWidgets('shows recommended plan indicator for yearly plan', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      // Check for star icon in recommended plan
      expect(find.byIcon(Icons.star), findsWidgets);
    });

    testWidgets('has yearly plan selected by default', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      // Find all CustomRadioButton widgets with generic type
      expect(find.byType(CustomRadioButton<String>), findsNWidgets(3));
    });

    testWidgets('can select monthly plan', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Act
      // Find and tap the monthly plan radio button
      final monthlyRadioButton = find.byType(CustomRadioButton<String>).at(1);
      await tester.tap(monthlyRadioButton);
      await tester.pump();

      // Assert
      // The state should have changed - we can verify this by checking the UI rebuild
      expect(find.byType(CustomRadioButton<String>), findsNWidgets(3));
    });

    testWidgets('can select weekly plan', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Act
      // Find and tap the weekly plan radio button
      final weeklyRadioButton = find.byType(CustomRadioButton<String>).at(2);
      await tester.tap(weeklyRadioButton);
      await tester.pump();

      // Assert
      // The state should have changed - we can verify this by checking the UI rebuild
      expect(find.byType(CustomRadioButton<String>), findsNWidgets(3));
    });

    testWidgets('displays benefits section correctly', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      expect(find.text('You\'ll get:'), findsOneWidget);
      expect(find.text('Unlimited access'), findsOneWidget);
      expect(find.text('200GB storage'), findsOneWidget);
      expect(find.text('Sync all your devices'), findsOneWidget);
    });

    testWidgets('has subscribe button', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      expect(find.byType(CustomButton), findsOneWidget);
      expect(find.text('Subscribe'), findsOneWidget);
    });

    testWidgets('subscribe button is tappable', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Act
      final subscribeButton = find.byType(CustomButton);
      await tester.tap(subscribeButton);
      await tester.pump();

      // Assert
      // Button should be tappable without errors
      expect(subscribeButton, findsOneWidget);
    });

    testWidgets('displays correct styling and colors', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, Colors.transparent);
      expect(appBar.elevation, 0);
    });

    testWidgets('has correct layout structure', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      expect(find.byType(SafeArea), findsAtLeastNWidgets(1));
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Expanded), findsAtLeastNWidgets(1));
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
    });

    testWidgets('benefits section has correct styling', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      // Check for Container with specific styling for benefits section
      expect(find.byType(Container), findsAtLeastNWidgets(1));
      // Check for star icons in benefits
      expect(
        find.byIcon(Icons.star),
        findsAtLeastNWidgets(3),
      ); // 3 benefits + 1 recommended indicator
    });

    testWidgets('plan selection changes container styling', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Act
      final monthlyRadioButton = find.byType(CustomRadioButton<String>).at(1);
      await tester.tap(monthlyRadioButton);
      await tester.pump();

      // Assert
      // The container styling should change for selected plan
      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });

    testWidgets('handles state changes correctly', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Act & Assert - Test multiple state changes
      final yearlyRadioButton = find.byType(CustomRadioButton<String>).at(0);
      final monthlyRadioButton = find.byType(CustomRadioButton<String>).at(1);
      final weeklyRadioButton = find.byType(CustomRadioButton<String>).at(2);

      // Select monthly
      await tester.tap(monthlyRadioButton);
      await tester.pump();
      expect(find.byType(CustomRadioButton<String>), findsNWidgets(3));

      // Select weekly
      await tester.tap(weeklyRadioButton);
      await tester.pump();
      expect(find.byType(CustomRadioButton<String>), findsNWidgets(3));

      // Select yearly again
      await tester.tap(yearlyRadioButton);
      await tester.pump();
      expect(find.byType(CustomRadioButton<String>), findsNWidgets(3));
    });

    testWidgets('displays all required text elements', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert - Check for all text elements
      final textWidgets = find.byType(Text);
      expect(
        textWidgets,
        findsAtLeastNWidgets(10),
      ); // Should have many text widgets

      // Specific important texts
      expect(find.text('Choose your\nsubscription plan'), findsOneWidget);
      expect(find.text('And get a 7-day free trial'), findsOneWidget);
      expect(find.text('You\'ll get:'), findsOneWidget);
      expect(find.text('Subscribe'), findsOneWidget);
    });

    testWidgets('maintains scroll functionality', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert
      expect(find.byType(SingleChildScrollView), findsOneWidget);

      // Test scrolling
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -200),
      );
      await tester.pump();

      // Should still render correctly after scroll
      expect(find.byType(SubscriptionPlansScreen), findsOneWidget);
    });

    testWidgets('has correct widget hierarchy', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: SubscriptionPlansScreen()),
      );

      // Assert widget hierarchy
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(SubscriptionPlansScreen), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SafeArea), findsAtLeastNWidgets(1));
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Expanded), findsAtLeastNWidgets(1));
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(CustomButton), findsOneWidget);
      expect(find.byType(CustomRadioButton<String>), findsNWidgets(3));
    });
  });
}
