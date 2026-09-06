class UiTask {
  const UiTask({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.status,
    required this.progress,
  });

  final int id;
  final String title;
  final String subtitle;
  final String category;
  final String status;
  final int progress;
}
