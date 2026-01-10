import "package:flutter/material.dart";
class TaskTopSection extends StatelessWidget {

  final String title;
  final String taskCount;
  final String loadStatus;
  const TaskTopSection({super.key, required this.title, required this.taskCount, required this.loadStatus});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          border: Border.all(color: Colors.green[200]!, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Current Workload"),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.notifications_active),
                SizedBox(width: 10),
                Expanded(
                  child: Text(title, style: TextStyle(fontSize: 22)),
                ),
                Text(taskCount, style: TextStyle(fontSize: 22)),
              ],
            ),
            SizedBox(height: 5),

            Text(loadStatus),
          ],
        ),
      ),
    );
  }
}
