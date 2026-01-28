import "package:bill_and_balance/components/custom_app_bar/custom_app_bar.dart";
import "package:bill_and_balance/components/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart";
import "package:bill_and_balance/models/task_model.dart";
import "package:flutter/material.dart";
import "package:bill_and_balance/components/task_list_item/task_list_item.dart";
import "package:bill_and_balance/components/task_top_section/TaskTopSection.dart";
import "package:go_router/go_router.dart";


List<TaskModel> tasks = [
  TaskModel(
    id: '1',
    title: 'Project Proposal',
    description: 'Prepare the initial project proposal document',
    deadline: '2026-01-20',
    estimatedHours: 2.0,
    status: 'active',
    completedAt: null,
    completionType: null,
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
  TaskModel(
    id: '2',
    title: 'Design Mockups',
    description: 'Create UI/UX mockups for the app screens',
    deadline: '2026-01-22',
    estimatedHours: 5.0,
    status: 'active',
    completedAt: null,
    completionType: null,
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
  TaskModel(
    id: '3',
    title: 'Backend API',
    description: 'Develop REST API for user authentication',
    deadline: '2026-01-25',
    estimatedHours: 8.0,
    status: 'active',
    completedAt: null,
    completionType: null,
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
];


class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  static Widget route({required BuildContext context, required GoRouterState state}) {
    return Scaffold(
      backgroundColor: Color(0xfffff9f3),
      appBar: CustomAppBar(),
      body: TasksPage(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xd0e5bc90),
        onPressed: () {
            GoRouter.of(context).push("/tasks/add");
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
            taskCount: tasks.length.toString(),
            loadStatus: 'Light load',
          ),
          SizedBox(height: 10),
          Text("Tasks", style: TextStyle(fontSize: 22)),
          SizedBox(height: 8),

          // Display TaskModel list
          ...tasks.map((task) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TaskListItem(task: task),
          )),
        ],
      ),
    );
  }
}












