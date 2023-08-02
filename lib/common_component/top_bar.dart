import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.blueGrey,
      leading: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/profile.png"),
          radius: 20,
        ),
      ),
    );
  }
}
