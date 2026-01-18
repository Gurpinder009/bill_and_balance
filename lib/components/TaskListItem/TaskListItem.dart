import 'package:bill_and_balance/models/TaskModel.dart';
import 'package:flutter/material.dart';




class TaskListItem extends StatelessWidget {
  final TaskModel task;
  const TaskListItem({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(task.group, style: TextStyle(fontSize: 10),),
            ),
            Text(task.title, style: TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Text(task.desc, style:TextStyle(color: Colors.black54)),
            SizedBox(height: 5),

            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.timelapse, color: Colors.blueAccent),
                    SizedBox(width: 2,),
                    Text(task.timeRequired, style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
                SizedBox(width: 8),

                Row(
                  children: [
                    Icon(Icons.warning_amber, color: Colors.red),
                    SizedBox(width: 2,),

                    Text("${task.timeLeft} days left", style: TextStyle(color: Colors.red)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),



            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black87),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("In Progress"),
                  ),
                ),
                SizedBox(width: 5,),
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
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("Completed"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
