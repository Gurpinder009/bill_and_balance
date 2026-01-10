import 'package:bill_and_balance/pages/analysis_page/analysis_page.dart';
import 'package:bill_and_balance/pages/receipt_page/receipt_page.dart';
import 'package:bill_and_balance/pages/settings_page/settings_page.dart';
import 'package:go_router/go_router.dart';
import 'package:bill_and_balance/pages/tasks_page/tasks_page.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/tasks',
    routes: [
      GoRoute(path: '/tasks', builder: (context, state) =>  TasksPage.route()),
      GoRoute(path: '/receipt', builder: (context, state) =>  ReceiptPage.route()),
      GoRoute(path: '/analysis', builder: (context, state) =>  AnalysisPage.route()),
      GoRoute(path: '/settings', builder: (context, state) =>  SettingsPage.route()),
    ],
  );
}
