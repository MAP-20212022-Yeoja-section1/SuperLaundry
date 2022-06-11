
import 'package:flutter/material.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_screen.dart';

class AcceptedDeliveryOrderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AcceptedDeliveryOrderAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('DELIVERY ORDER'),
      leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>mainMenuDScreen()));
        },
        icon: const Icon(Icons.chevron_left_sharp),
        iconSize: 40.0,
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    );
  }
}