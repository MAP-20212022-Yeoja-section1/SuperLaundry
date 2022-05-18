import 'package:flutter/material.dart';

class ForgotPassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ForgotPassAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   title: Text('Reset Password'),
    //   backgroundColor: Color.fromARGB(255, 29, 233, 182),
    //   foregroundColor: Colors.white,
    // );

    return AppBar(
      title: Text('RESET PASSWORD'),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    );
  }
}
