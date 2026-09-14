import 'package:flutter/material.dart';

import '../models/catalog_item.dart';

const List<CatalogItem> catalogItems = [
  CatalogItem(
    id: 1,
    name: 'Flutter Starter Kit',
    price: 'Rp120.000',
    category: 'Development',
    description:
        'Paket belajar berisi komponen dasar Flutter, contoh layout, dan '
        'panduan singkat untuk membangun halaman pertama dengan Material UI.',
    icon: Icons.widgets_rounded,
    color: Color(0xFF2563EB),
  ),
  CatalogItem(
    id: 2,
    name: 'Navigation Course',
    price: 'Rp150.000',
    category: 'Routing',
    description:
        'Materi praktis tentang Stack Navigation, Navigator.push, passing data, '
        'dan penggunaan tombol kembali melalui AppBar.',
    icon: Icons.route_rounded,
    color: Color(0xFF0F766E),
  ),
  CatalogItem(
    id: 3,
    name: 'Stateful Widget Lab',
    price: 'Rp99.000',
    category: 'State',
    description:
        'Latihan interaktif untuk memahami perubahan state sederhana, termasuk '
        'tombol Follow yang berubah menjadi Following setelah ditekan.',
    icon: Icons.touch_app_rounded,
    color: Color(0xFFB45309),
  ),
];
