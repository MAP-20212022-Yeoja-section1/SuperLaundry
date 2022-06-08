// import 'package:flutter/material.dart';
// import 'package:superlaundry/ui/screens/home_customer/mainmenu_screen.dart';
// import 'package:superlaundry/ui/screens/order_history/orderhistory_screen.dart';

// class ViewOrderHistoryAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   const ViewOrderHistoryAppBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Size get preferredSize => Size.fromHeight(50);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text('ORDER HISTORY'),
//       leading: IconButton(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => OrderHistoryScreen()));
//         },
//         icon: Icon(Icons.chevron_left_sharp),
//         iconSize: 40.0,
//       ),
//       centerTitle: true,
//       backgroundColor: Color.fromARGB(255, 31, 215, 169),
//       foregroundColor: Colors.white,
//     );
//   }
// }
