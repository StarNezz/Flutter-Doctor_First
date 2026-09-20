import 'package:flutter/material.dart';

import '../data/catalog_items.dart';
import '../models/catalog_item.dart';
import '../widgets/custom_card.dart';
import '../widgets/hero_banner.dart';
import '../widgets/section_header.dart';
import 'catalog_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openDetail(BuildContext context, CatalogItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CatalogDetailScreen(item: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 5 Mobile Dev'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: HeroBanner(),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionHeader(
                title: 'Daftar Katalog',
                subtitle: '${catalogItems.length} card siap dibuka',
                countLabel: '${catalogItems.length} data',
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                key: const ValueKey('catalog-list'),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                itemCount: catalogItems.length,
                itemBuilder: (context, index) {
                  final item = catalogItems[index];

                  return CustomCard(
                    item: item,
                    onTap: () => _openDetail(context, item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
