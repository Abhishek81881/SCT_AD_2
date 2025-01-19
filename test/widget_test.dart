// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_do_list_project/main.dart';

void main() {
  testWidgets('Add and remove a task', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ToDoApp());

    // Enter a task and tap the add button.
    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.text('ADD'));
    await tester.pump();

    // Verify that the task is added.
    expect(find.text('New Task'), findsOneWidget);

    // Tap the checkbox to mark as completed.
    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    // Verify that the task is moved to completed section.
    expect(find.text('Completed Tasks'), findsOneWidget);

    // Tap the delete icon to remove the task.
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    // Verify that the task is removed.
    expect(find.text('New Task'), findsNothing);
  });
}
