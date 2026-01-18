import "package:bill_and_balance/components/TaskListItem/TaskListItem.dart";
import "package:bill_and_balance/components/custom_app_bar/custom_app_bar.dart";
import "package:bill_and_balance/components/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart";
import "package:bill_and_balance/models/TaskModel.dart";
import "package:flutter/material.dart";
import "../../components/TaskTopSection/TaskTopSection.dart";

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  static Widget route() {
    return Scaffold(
      backgroundColor: Color(0xfffff9f3),
      appBar: CustomAppBar(),
      body: TasksPage(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xd0e5bc90),
        onPressed: () {
          print("sfjskdjf");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView(
        children: [
          TaskTopSection(
            title: "Active Tasks",
            taskCount: '3',
            loadStatus: 'Light load',
          ),
          SizedBox(height: 10),
          Text("Tasks", style:TextStyle(fontSize: 22)),
          SizedBox(height: 8),
          TaskListItem( task:TaskModel(group: "group", title:"Project Proposal", desc: "This is the description", timeLeft: "2", timeRequired: "2H", status: TaskStatus.pending)),
          TaskListItem( task:TaskModel(group: "group", title:"Project Proposal", desc: "This is the description", timeLeft: "2", timeRequired: "2H", status: TaskStatus.pending)),
          TaskListItem( task:TaskModel(group: "group", title:"Project Proposal", desc: "This is the description", timeLeft: "2", timeRequired: "2H", status: TaskStatus.pending)),
        ],
      ),
    );
  }
}












