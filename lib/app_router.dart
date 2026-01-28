import 'package:bill_and_balance/pages/analysis/analysis_page/analysis_page.dart';
import 'package:bill_and_balance/pages/receipts/receipt_page/receipt_page.dart';
import 'package:bill_and_balance/pages/settings/settings_page/settings_page.dart';
import 'package:bill_and_balance/pages/tasks/add_tasks_page/add_tasks_page.dart';
import 'package:bill_and_balance/pages/tasks/view_task_page/view_task_page.dart';
import 'package:bill_and_balance/pages/tasks/tasks_page/tasks_page.dart';



import "package:bill_and_balance/pages/receipts/view_receipt_page/view_receipt_page.dart";
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/tasks',
    routes: [


      //* tasks
      GoRoute(path: '/', redirect: (context, state)=> "/tasks"),
      GoRoute(path: '/tasks', builder: (context, state) =>  TasksPage.route(context: context, state: state)),
      GoRoute(path: "/tasks/add", builder: (context, state) =>  AddTasksPage.route(context:context,state: state) ),
      GoRoute(path: "/tasks/:taskId", builder: (context, state) =>  ViewTaskPage.route(context, state) ),


      //* receipts
      GoRoute(path: '/receipt', builder: (context, state) =>  ReceiptPage.route()),
      GoRoute(path: '/receipt/:receiptId', builder: (context, state) => ViewReceiptPage.route(context: context, state: state)),
      
      //* analysis
      GoRoute(path: '/analysis', builder: (context, state) =>  AnalysisPage.route()),
      
      //* settings
      GoRoute(path: '/settings', builder: (context, state) =>  SettingsPage.route()),
    ],
  );
}
