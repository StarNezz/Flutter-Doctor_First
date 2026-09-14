import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_pertama/data/catalog_items.dart';
import 'package:tugas_pertama/main.dart';
import 'package:tugas_pertama/screens/catalog_detail_screen.dart';
import 'package:tugas_pertama/widgets/custom_card.dart';

void main() {
  testWidgets('beranda menampilkan 3 card katalog dan membuka detail', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tugas 4 Mobile Dev'), findsOneWidget);
    expect(find.byKey(const ValueKey('catalog-list')), findsOneWidget);
    expect(find.byType(CustomCard), findsNWidgets(3));
    expect(find.text('Flutter Starter Kit'), findsOneWidget);

    await tester.tap(find.text('Flutter Starter Kit'));
    await tester.pumpAndSettle();

    expect(find.byType(CatalogDetailScreen), findsOneWidget);
    expect(find.text('Detail Katalog'), findsOneWidget);
    expect(find.text('Rp120.000'), findsOneWidget);
    expect(find.text('Follow'), findsOneWidget);

    await tester.tap(find.text('Follow'));
    await tester.pump();

    expect(find.text('Following'), findsOneWidget);
  });

  testWidgets('halaman detail bisa kembali ke beranda', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Navigation Course'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Katalog'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back_rounded).first);
    await tester.pumpAndSettle();

    expect(find.text('Daftar Katalog'), findsOneWidget);
    expect(find.byType(CatalogDetailScreen), findsNothing);
  });

  test('dummy data katalog berisi tepat 3 item', () {
    expect(catalogItems.length, 3);
    expect(catalogItems.first.name, 'Flutter Starter Kit');
    expect(catalogItems.last.name, 'Stateful Widget Lab');
  });
}
