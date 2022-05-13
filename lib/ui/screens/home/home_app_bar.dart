import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Super Laundry'),
      backgroundColor: Color.fromARGB(255, 29, 233, 182),
      foregroundColor: Colors.black,
    );
  }
}
