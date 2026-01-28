class TaskModel {
  final String id;
  final String title;
  final String? description;
  final String deadline;
  final double estimatedHours;
  final String status;
  final String? completedAt;
  final String? completionType;
  final String createdAt;
  final String updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.deadline,
    required this.estimatedHours,
    this.status = 'active',
    this.completedAt,
    this.completionType,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Convert Task → SQLite Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline,
      'estimated_hours': estimatedHours,
      'status': status,
      'completed_at': completedAt,
      'completion_type': completionType,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  /// Convert SQLite Map → Task
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String?,
      deadline: map['deadline'] as String,
      estimatedHours: (map['estimated_hours'] as num).toDouble(),
      status: map['status'] as String,
      completedAt: map['completed_at'] as String?,
      completionType: map['completion_type'] as String?,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }
}
