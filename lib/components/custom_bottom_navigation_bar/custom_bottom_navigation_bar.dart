import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});
  int _indexFromLocation(String location) {
    if (location.startsWith('/receipt')) return 1;
    if (location.startsWith('/analysis')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0; // /tasks
  }


  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex:  _indexFromLocation(location),
        onTap: (int selectedInt) {
          switch (selectedInt) {
            case 0:
              context.go('/tasks');
              break;
            case 1:
              context.go('/receipt');
              break;
            case 2:
              context.go('/analysis');
              break;
            case 3:
              context.go('/settings');
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffce9558),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: "Receipt",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: "Analysis",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
    );
  }
}
