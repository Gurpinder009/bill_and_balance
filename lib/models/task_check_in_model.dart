class TaskCheckInModel {
  final String id;
  final String taskId;
  final String checkInDate;
  final String statusResponse;
  final String? notes;
  final String createdAt;

  TaskCheckInModel({
    required this.id,
    required this.taskId,
    required this.checkInDate,
    required this.statusResponse,
    this.notes,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_id': taskId,
      'checkin_date': checkInDate,
      'status_response': statusResponse,
      'notes': notes,
      'created_at': createdAt,
    };
  }

  factory TaskCheckInModel.fromMap(Map<String, dynamic> map) {
    return TaskCheckInModel(
      id: map['id'] as String,
      taskId: map['task_id'] as String,
      checkInDate: map['checkin_date'] as String,
      statusResponse: map['status_response'] as String,
      notes: map['notes'] as String?,
      createdAt: map['created_at'] as String,
    );
  }
}
