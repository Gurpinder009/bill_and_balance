import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      surfaceTintColor:  Color(0xffce9558),
      backgroundColor: Colors.white,
      title: Text(
        "Bill And Balance",
        style: TextStyle(color: Color(0xffce9558)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
