import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_screen.dart';
import 'package:superlaundry/ui/screens/home_manager/mainmenuM_screen.dart';

class LaundrySerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const LaundrySerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('LAUNDRY SERVICE'),
      leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>mainMenuMScreen()));
        },
        icon: Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    );
  }
}