import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {

  const TaskListItem({super.key});

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
              child: Text("group", style: TextStyle(fontSize: 10),),
            ),
            Text("Complete Project Proposal", style: TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Text("This is the description", style:TextStyle(color: Colors.black54)),
            SizedBox(height: 5),

            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.timelapse, color: Colors.blueAccent),
                    SizedBox(width: 2,),
                    Text("8H", style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
                SizedBox(width: 8),

                Row(
                  children: [
                    Icon(Icons.warning_amber, color: Colors.red),
                    SizedBox(width: 2,),

                    Text("2 days left", style: TextStyle(color: Colors.red)),
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
