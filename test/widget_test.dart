import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prelim_app/main.dart';
import 'package:prelim_app/screens/newsfeed_screen.dart';
import 'package:prelim_app/screens/notification_screen.dart';

void main() {
  testWidgets('Bottom nav switches to the profile screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    for (final text in [
      'Abegail O. Huerte', '3 posts', 'Iloilo City', 'Add to story', 'Edit profile',
      'You locked your profile', 'Learn more', 'All', 'Photos', 'Reels',
      'Personal details', 'Iloilo City, Philippines', 'Pavia, Iloilo', 'January 15, 2000',
    ]) {
      expect(find.text(text), findsOneWidget, reason: text);
    }
  });

  testWidgets('Profile screen fits a small phone without overflow', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(320 * 3, 568 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('Notifications show icon by type and unread as selected', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotificationScreen()));

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('liked your post.'), findsOneWidget);
    expect(find.byIcon(Icons.person_add), findsOneWidget);

    // John Doe is unread -> selected; Michael Cruz is read -> not selected.
    ListTile tile(String name) =>
        tester.widget(find.ancestor(of: find.text(name), matching: find.byType(ListTile)));
    expect(tile('John Doe').selected, isTrue);
    expect(tile('Michael Cruz').selected, isFalse);

    await tester.scrollUntilVisible(find.text('Bea Villanueva'), 300);
    expect(find.text('shared your status.'), findsOneWidget);
  });

  testWidgets('News feed shows posts from the list', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: NewsfeedScreen()));

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('2 hours ago'), findsOneWidget);
    expect(find.text('Having a great day!'), findsOneWidget);
    expect(find.text('120'), findsOneWidget);

    // Last post is built lazily, so scroll until it appears.
    await tester.scrollUntilVisible(find.text('Paolo Garcia'), 500);
    expect(find.text('Ready for the prelim exams.'), findsOneWidget);
  });
}
