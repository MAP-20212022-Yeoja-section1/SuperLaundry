import 'package:flutter/material.dart';

class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegistrationAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('REGISTRATION'),
      leading: IconButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>ManagerMenu()));
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
