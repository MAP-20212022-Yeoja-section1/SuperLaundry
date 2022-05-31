import 'package:flutter/material.dart';

class AddOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddOrderAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ADD ORDER'),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    );
  }
}
