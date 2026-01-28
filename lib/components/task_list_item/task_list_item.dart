import 'package:bill_and_balance/models/task_model.dart';
import 'package:bill_and_balance/pages/tasks/tasks_page/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onComplete;

  const TaskListItem({
    super.key,
    required this.task,
    this.onComplete,
  });




  void viewTaskInfo({required BuildContext context}){
    GoRouter.of(context).push("/tasks/${task.id}");
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StatusBadge(status: task.status),
            SizedBox(height: 8),
            _TaskTitle(title: task.title, status: task.status),
            if (task.description?.isNotEmpty ?? false) ...[
              SizedBox(height: 5),
              _TaskDescription(description: task.description!),
            ],
            SizedBox(height: 5),
            _TaskMetadata(
              estimatedHours: task.estimatedHours,
              deadline: task.deadline,
            ),
            SizedBox(height: 10),
            if (task.status == 'active')
              _ActionButtons(
                onComplete: onComplete,
                viewTaskInfo: viewTaskInfo,
              ),
            if (task.status == 'completed')
              _CompletionInfo(
                completedAt: task.completedAt!,
                completionType: task.completionType,
              ),
          ],
        ),
      ),
    );
  }
}

// Status Badge Widget
class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  Color _getStatusColor() {
    switch (status) {
      case 'completed':
        return Colors.green;
      case 'delayed':
        return Colors.orange;
      case 'abandoned':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor();
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Task Title Widget
class _TaskTitle extends StatelessWidget {
  final String title;
  final String status;

  const _TaskTitle({required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        decoration: status == 'completed' ? TextDecoration.lineThrough : null,
      ),
    );
  }
}

// Task Description Widget
class _TaskDescription extends StatelessWidget {
  final String description;

  const _TaskDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(color: Colors.black54),
    );
  }
}

// Task Metadata (time info) Widget
class _TaskMetadata extends StatelessWidget {
  final double estimatedHours;
  final String deadline;

  const _TaskMetadata({
    required this.estimatedHours,
    required this.deadline,
  });

  int _getDaysLeft() {
    final deadlineDate = DateTime.parse(deadline);
    final now = DateTime.now();
    return deadlineDate.difference(now).inDays;
  }

  @override
  Widget build(BuildContext context) {
    final daysLeft = _getDaysLeft();
    final isOverdue = daysLeft < 0;

    return Row(
      children: [
        _MetadataChip(
          icon: Icons.timelapse,
          label: "${estimatedHours}h",
          color: Colors.blueAccent,
        ),
        SizedBox(width: 8),
        _MetadataChip(
          icon: isOverdue ? Icons.error : Icons.calendar_today,
          label: isOverdue
              ? "${daysLeft.abs()} days overdue"
              : "$daysLeft days left",
          color: isOverdue ? Colors.red : Colors.orange,
        ),
      ],
    );
  }
}

// Metadata Chip Widget
class _MetadataChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _MetadataChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        SizedBox(width: 4),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}

// Action Buttons Widget
class _ActionButtons extends StatelessWidget {
  final VoidCallback? onComplete;
  final Function viewTaskInfo;

  const _ActionButtons({this.onComplete, required this.viewTaskInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.black87),
              foregroundColor: WidgetStateProperty.all(Colors.white),

              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: onComplete,
            icon: Icon(Icons.check, size: 18),
            label: Text("Complete"),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
              foregroundColor: WidgetStateProperty.all(Colors.black87),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed:(){ viewTaskInfo(context: context);},
            icon: Icon(Icons.more_horiz, size: 18),
            label: Text("Task Info"),
          ),
        ),
      ],
    );
  }
}

// Completion Info Widget
class _CompletionInfo extends StatelessWidget {
  final String completedAt;
  final String? completionType;

  const _CompletionInfo({
    required this.completedAt,
    this.completionType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 16),
          SizedBox(width: 5),
          Text(
            "Completed ${completionType == 'late' ? '(Late)' : '(On Time)'}",
            style: TextStyle(
              color: Colors.green[700],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}