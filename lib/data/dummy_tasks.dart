import '../models/ui_task.dart';

final List<UiTask> dummyTasks = List.generate(50, (index) {
  final number = index + 1;
  final categories = ['Layout', 'Widget', 'Spacing', 'Typography'];
  final statuses = ['Review', 'Ready', 'Revisi', 'Selesai'];

  return UiTask(
    id: number,
    title: 'UI Slicing #${number.toString().padLeft(2, '0')}',
    subtitle:
        'Implementasi komponen reusable, margin presisi, dan data dinamis '
        'untuk section ${number.toString().padLeft(2, '0')}.',
    category: categories[index % categories.length],
    status: statuses[index % statuses.length],
    progress: 48 + (index * 7 % 47),
  );
});
