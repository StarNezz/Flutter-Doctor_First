import 'package:flutter/material.dart';

import '../models/ui_task.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.task});

  final UiTask task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _categoryColor(task.category).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              task.id.toString().padLeft(2, '0'),
              style: TextStyle(
                color: _categoryColor(task.category),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: const Color(0xFF111827),
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    _StatusPill(label: task.status),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  task.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: const Color(0xFF6B7280), height: 1.35),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Icon(
                      Icons.widgets_rounded,
                      color: _categoryColor(task.category),
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      task.category,
                      style: TextStyle(
                        color: _categoryColor(task.category),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${task.progress}%',
                      style: const TextStyle(
                        color: Color(0xFF111827),
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    minHeight: 7,
                    value: task.progress / 100,
                    color: _categoryColor(task.category),
                    backgroundColor: const Color(0xFFE5E7EB),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _categoryColor(String category) {
    return switch (category) {
      'Widget' => const Color(0xFF7C3AED),
      'Spacing' => const Color(0xFFEA580C),
      'Typography' => const Color(0xFF059669),
      _ => const Color(0xFF2563EB),
    };
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final isDone = label == 'Selesai';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: isDone ? const Color(0xFFDCFCE7) : const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isDone ? const Color(0xFF15803D) : const Color(0xFFC2410C),
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
