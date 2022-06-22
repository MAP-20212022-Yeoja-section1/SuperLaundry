import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/cust_review/cust_review_screen.dart';

class CustReviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustReviewAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('LEAVE REVIEW'),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => mainMenuMScreen()));
          if (Navigator.canPop(context)) Navigator.pop(context);
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
