import "package:bill_and_balance/components/custom_app_bar/custom_app_bar.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class AddTasksPage extends StatelessWidget {
  const AddTasksPage({super.key});

  static Widget route({
    required BuildContext context,
    required GoRouterState state,
  }) {
    return Scaffold(
      backgroundColor: const Color(0xfffff9f3),
      appBar: CustomAppBar(),
      body: AddTasksPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Add Task",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xffce9558),
              ),
            ),
            const SizedBox(height: 30),

            // Task Title
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Task Title',
                hintText: 'Enter task title',
                // labelStyle: TextStyle(color: Color(0xffce9558)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558), width: 2),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              maxLines: 4,

              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter task description',

                // labelStyle: TextStyle(color: Color(0xffce9558)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558), width: 2),
                ),
              ),
            ),

            // Description
            const SizedBox(height: 20),

            // Deadline
            TextField(
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Deadline',
                hintText: 'Select deadline',
                border: OutlineInputBorder(),
                   contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558), width: 2),
                ),
                suffixIcon: Icon(Icons.calendar_today, color: Color(0xffce9558)),
              ),
              onTap: () {
                // Date picker logic goes here
              },
            ),
            const SizedBox(height: 20),

            // Estimated Hours
            const TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Estimated Hours',
                hintText: 'e.g., 2.5',
                border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffce9558), width: 2),
                ),
                suffixIcon: Icon(Icons.schedule, color: Color(0xffce9558)),
              ),
            ),
            const SizedBox(height: 40),

            // Create Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Submit logic goes here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffce9558),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Create Task',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
