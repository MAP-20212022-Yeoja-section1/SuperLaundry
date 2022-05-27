import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/laundry_service/laundryser_screen.dart';

class CleanAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CleanAppBar({
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LaundrySerScreen()));
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