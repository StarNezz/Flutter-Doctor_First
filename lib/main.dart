import 'package:flutter/material.dart';

import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final completeUser = UserModel.fromJson(const {
      'id': 1,
      'name': 'Lux Starr',
      'email': 'lux@example.com',
      'age': 20,
      'phone_number': '081234567890',
      'address': 'Jakarta',
      'is_active': true,
    });

    final fallbackUser = UserModel.fromJson(const {
      'id': 2,
      'name': null,
      'email': 'mahasiswa@example.com',
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Tugas 2 - JSON Serialization')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _Header(),
            const SizedBox(height: 16),
            UserCard(title: 'JSON lengkap', user: completeUser),
            const SizedBox(height: 12),
            UserCard(title: 'JSON dengan data hilang', user: fallbackUser),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Model UserModel berhasil mengubah Map<String, dynamic> menjadi objek '
        'Dart dan kembali lagi menjadi JSON dengan aturan null safety.',
        style: Theme.of(context).textTheme.bodyLarge
            ?.copyWith(color: colorScheme.onPrimaryContainer),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.title, required this.user});

  final String title;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleMedium),
            const SizedBox(height: 12),
            _InfoRow(label: 'ID', value: user.id.toString()),
            _InfoRow(label: 'Nama', value: user.name),
            _InfoRow(label: 'Email', value: user.email),
            _InfoRow(label: 'Umur', value: user.age.toString()),
            _InfoRow(label: 'Telepon', value: user.phoneNumber ?? '-'),
            _InfoRow(label: 'Alamat', value: user.address ?? '-'),
            _InfoRow(label: 'Aktif', value: user.isActive ? 'Ya' : 'Tidak'),
            const Divider(height: 24),
            Text('toJson()', style: textTheme.labelLarge),
            const SizedBox(height: 8),
            SelectableText(user.toJson().toString()),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 76,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
