import 'package:bill_and_balance/app_router.dart';
import 'package:flutter/material.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

final appRouter = AppRouter().router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bill And Balance',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      routerConfig: appRouter,
    );
  }
}
