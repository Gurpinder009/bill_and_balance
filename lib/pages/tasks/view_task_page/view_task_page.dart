import "package:flutter/material.dart";
import "../../../components/custom_app_bar/custom_app_bar.dart";

class ViewTaskPage extends StatelessWidget {
  final String taskId;

  const ViewTaskPage({super.key, required this.taskId});

  static Widget route(context, state) {
    return Scaffold(
      backgroundColor: const Color(0xfffff9f3),
      appBar: CustomAppBar(),
      body: ViewTaskPage(taskId: state.pathParameters['taskId']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TaskStatusBadge(status: "Pending"),
            const SizedBox(height: 20),
            
            const TaskHeader(
              title: "Complete project Proposal",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            ),
            const SizedBox(height: 32),
            
            TaskDetailsSection(
              dueDate: DateTime.now(),
              createdDate: DateTime.now(),
              updatedDate: DateTime.now(),
            ),
            const SizedBox(height: 32),
            
            TaskActionsSection(
              onComplete: () {},
              onPending: () {},
              onAbandon: () {},
              onDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Status Badge Component
class TaskStatusBadge extends StatelessWidget {
  final String status;

  const TaskStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final statusConfig = _getStatusConfig(status.toLowerCase());
    
    return Container(
      decoration: BoxDecoration(
        color: statusConfig['backgroundColor'],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusConfig['icon'], size: 14, color: statusConfig['color']),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              color: statusConfig['color'],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getStatusConfig(String status) {
    switch (status) {
      case 'completed':
        return {
          'icon': Icons.check_circle,
          'color': Colors.green.shade800,
          'backgroundColor': Colors.green.shade100,
        };
      case 'pending':
        return {
          'icon': Icons.access_time,
          'color': Colors.orange.shade800,
          'backgroundColor': Colors.orange.shade100,
        };
      case 'abandoned':
        return {
          'icon': Icons.cancel,
          'color': Colors.grey.shade800,
          'backgroundColor': Colors.grey.shade100,
        };
      default:
        return {
          'icon': Icons.info,
          'color': Colors.blue.shade800,
          'backgroundColor': Colors.blue.shade100,
        };
    }
  }
}

// Task Header Component
class TaskHeader extends StatelessWidget {
  final String title;
  final String description;

  const TaskHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff2d3748),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade700,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

// Task Details Section Component
class TaskDetailsSection extends StatelessWidget {
  final DateTime dueDate;
  final DateTime createdDate;
  final DateTime updatedDate;

  const TaskDetailsSection({
    super.key,
    required this.dueDate,
    required this.createdDate,
    required this.updatedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskDetailCard(
          icon: Icons.event,
          label: "Due Date",
          value: "${_formatDateTime(dueDate)} ${_getDaysLeft(dueDate)}",
          color: Colors.amber,
        ),
        const SizedBox(height: 12),
        TaskDetailCard(
          icon: Icons.calendar_today,
          label: "Created",
          value: _formatDateTime(createdDate),
          color: Colors.blue,
        ),
        const SizedBox(height: 12),
        TaskDetailCard(
          icon: Icons.update,
          label: "Last Updated",
          value: _formatDateTime(updatedDate),
          color: Colors.grey,
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} at ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  String _getDaysLeft(DateTime dueDate) {
    final now = DateTime.now();
    final difference = dueDate.difference(DateTime(now.year, now.month, now.day));
    final daysLeft = difference.inDays;

    if (daysLeft < 0) {
      return "(${daysLeft.abs()} days overdue)";
    } else if (daysLeft == 0) {
      return "(Due today)";
    } else if (daysLeft == 1) {
      return "(1 day left)";
    } else {
      return "($daysLeft days left)";
    }
  }
}

// Task Detail Card Component
class TaskDetailCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final MaterialColor color;

  const TaskDetailCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.shade200, width: 1.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color.shade700, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: color.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: color.shade900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Task Actions Section Component
class TaskActionsSection extends StatelessWidget {
  final VoidCallback onComplete;
  final VoidCallback onPending;
  final VoidCallback onAbandon;
  final VoidCallback onDelete;

  const TaskActionsSection({
    super.key,
    required this.onComplete,
    required this.onPending,
    required this.onAbandon,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Actions",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff2d3748),
          ),
        ),
        const SizedBox(height: 16),
        
        // Primary action - full width, filled
        SizedBox(
          width: double.infinity,
          child: TaskActionButton(
            label: "Mark Complete",
            icon: Icons.check_circle_outline,
            color: const Color(0xff4f46e5),
            onPressed: onComplete,
            isPrimary: true,
          ),
        ),
        const SizedBox(height: 12),
        
        // Secondary actions - outlined
        Row(
          children: [
            Expanded(
              child: TaskActionButton(
                label: "Set Pending",
                icon: Icons.schedule,
                color: Colors.grey,
                onPressed: onPending,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TaskActionButton(
                label: "Abandon",
                icon: Icons.cancel_outlined,
                color: Colors.grey,
                onPressed: onAbandon,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Destructive action - separated and outlined in red
        SizedBox(
          width: double.infinity,
          child: TaskActionButton(
            label: "Delete Task",
            icon: Icons.delete_outline,
            color: Colors.red,
            onPressed: onDelete,
            isDestructive: true,
          ),
        ),
      ],
    );
  }
}

// Task Action Button Component
class TaskActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isDestructive;

  const TaskActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
    this.isPrimary = false,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      // Filled button for primary action
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffce9558), // Professional indigo
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
      );
    }
    
    // Outlined button for secondary actions
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: isDestructive ? Colors.red.shade700 : Colors.grey.shade700,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        side: BorderSide(
          color: isDestructive ? Colors.red.shade300 : Colors.grey.shade300,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}