enum TaskStatus {
  isCompleted,
  inProgress,
  pending
}

class TaskModel{
  final String group;
  final String title;
  final String desc;
  final String timeLeft;
  final String timeRequired;
  final TaskStatus status;

  TaskModel({ required this.group, required this.title, required this.desc, required this.timeLeft, required this.timeRequired, required this.status});
}
