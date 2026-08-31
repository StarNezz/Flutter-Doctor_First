import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_pertama/main.dart';
import 'package:tugas_pertama/models/user_model.dart';

void main() {
  testWidgets('menampilkan demo JSON serialization', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tugas 2 - JSON Serialization'), findsOneWidget);
    expect(find.text('JSON lengkap'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    expect(find.text('JSON dengan data hilang'), findsOneWidget);
    expect(find.text('Nama tidak tersedia'), findsOneWidget);
  });

  test('fromJson memakai nilai default ketika data API hilang', () {
    final user = UserModel.fromJson(const {
      'id': 2,
      'name': null,
      'email': 'mahasiswa@example.com',
    });

    expect(user.id, 2);
    expect(user.name, 'Nama tidak tersedia');
    expect(user.email, 'mahasiswa@example.com');
    expect(user.age, 0);
    expect(user.phoneNumber, isNull);
    expect(user.address, isNull);
    expect(user.isActive, isFalse);
  });

  test('toJson mengubah objek kembali menjadi map', () {
    const user = UserModel(
      id: 1,
      name: 'Lux Starr',
      email: 'lux@example.com',
      age: 20,
      phoneNumber: '081234567890',
      address: 'Jakarta',
      isActive: true,
    );

    expect(user.toJson(), {
      'id': 1,
      'name': 'Lux Starr',
      'email': 'lux@example.com',
      'age': 20,
      'phone_number': '081234567890',
      'address': 'Jakarta',
      'is_active': true,
    });
  });
}
