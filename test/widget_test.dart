import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_pertama/data/dummy_tasks.dart';
import 'package:tugas_pertama/main.dart';
import 'package:tugas_pertama/widgets/custom_card.dart';

void main() {
  testWidgets('menampilkan dashboard tugas 3 dengan Stack dan list modular', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tugas 3 Mobile Dev'), findsOneWidget);
    expect(find.text('Dashboard UI'), findsOneWidget);
    expect(find.byType(Stack), findsWidgets);
    expect(find.byKey(const ValueKey('task-list')), findsOneWidget);
    expect(find.byType(CustomCard), findsWidgets);
    expect(find.text('UI Slicing #01'), findsOneWidget);

    await tester.drag(
      find.byKey(const ValueKey('task-list')),
      const Offset(0, -700),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('UI Slicing #'), findsWidgets);
  });

  test('dummy data berisi 50 item untuk ListView.builder', () {
    expect(dummyTasks.length, 50);
    expect(dummyTasks.first.title, 'UI Slicing #01');
    expect(dummyTasks.last.title, 'UI Slicing #50');
  });
}
