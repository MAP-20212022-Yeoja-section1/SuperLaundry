// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_screen.dart';

class deliGetOrderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const deliGetOrderAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('PENDING DELIVERY'),
      leading: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => mainMenuDScreen()));
        },
        icon: Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    );
  }
}
