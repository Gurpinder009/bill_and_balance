import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewReceiptPage extends StatelessWidget {
  const ViewReceiptPage({super.key});


  static Widget route({required BuildContext context, required GoRouterState state}) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Receipt"),
        backgroundColor: const Color(0xffce9558),
      ),
      body: const ViewReceiptPage(),
    );
  }




  @override
  Widget build(BuildContext context) {
    return const Text("this is working fine");
  }
}