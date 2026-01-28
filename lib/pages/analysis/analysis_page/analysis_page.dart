import "package:flutter/material.dart";

import 'package:bill_and_balance/components/custom_app_bar/custom_app_bar.dart';
import 'package:bill_and_balance/components/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  static Widget route(){
    return Scaffold(
      backgroundColor: Color(0xfffff9f3),
      appBar: CustomAppBar(),
      body: AnalysisPage(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xd0e5bc90),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Text("Analysis page");
  }
}
