// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:map_mvvm/view.dart';
// import 'package:superlaundry/models/orders.dart';
// import 'package:superlaundry/models/user.dart';
// import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/editCleanMethod/editCleanMethod.dart';
// import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_screen.dart';
// import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_viewmodel.dart';
// import 'package:superlaundry/services/deliOrder/deliOrder_service.dart';
// import 'package:superlaundry/ui/screens/editProfile/profile_viewmodel.dart';
// import 'package:superlaundry/services/registration/login_service.dart';
// import 'package:superlaundry/app/service_locator.dart';
// // import '../viewCleanMethod/cleanser_viewmodel.dart';

// class DeliOrderDetails extends StatefulWidget {
//   final OrdersModel post;
//   final LoginService _auth = locator<LoginService>();
//   DeliOrderDetails({required this.post});

//   @override
//   DeliOrderDetailsState createState() => DeliOrderDetailsState();
// }

// class DeliOrderDetailsState extends State<DeliOrderDetails> {
//   var deliOrderUser = [];
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//   final CollectionReference _users =
//       FirebaseFirestore.instance.collection('users');

//   @override
//   void initState() {
//     super.initState();
//     // getDeliOrderUser();
//   }

//   // void getDeliOrderUser(UserModel um) {
//   //   _firestore
//   //       .collection('users')
//   //       .doc(_auth.currentUser?.uid)
//   //       .get()
//   //       .then((snapshot) {
//   //         for(var order in snapshot.data()["READY FOR DELIVERY"]){

//   //         }
//   //       });
//   // }

//   // Future<Map> getDeliOrderUser() async {
//   //   final uid = await _auth.getCurrentUID();
//   //   var users;
//   //   var data = await _users.doc(uid).get().then((value) {
//   //     users = {
//   //       'userId': value['userId'],
//   //       'name': value['name'],
//   //       'email': value['email'],
//   //       'phonenum': value['phonenum'],
//   //       'homeaddress': value['homeaddress'],
//   //     };
//   //     return users;
//   //   });
//   //   return data;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return View<deliOrderViewmodel>(
//         shouldRebuild: false,
//         builder: (_, viewmodel) => Scaffold(
//               appBar: AppBar(
//                 title: Text('DELIVERY ORDER'),
//                 leading: IconButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => deliGetOrderScreen()));
//                   },
//                   icon: Icon(Icons.chevron_left_sharp),
//                   iconSize: 40.0,
//                 ),
//                 centerTitle: true,
//                 backgroundColor: Color.fromARGB(255, 31, 215, 169),
//                 foregroundColor: Colors.white,
//                 actions: <Widget>[
//                   // FlatButton(
//                   //   child: Text(
//                   //     'Edit',
//                   //     style: TextStyle(color: Colors.white, fontSize: 18),
//                   //   ),
//                   //   onPressed: () {
//                   // Navigator.push(context, MaterialPageRoute(builder: (context)=> EditCleanMethodDetails(editpost: widget.post)));
//                   //   },
//                   // ),
//                 ],
//               ),
//               body: Column(children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(30),
//                   child: Container(
//                     child: Center(
//                       child: Text(
//                         "ORDER DETAILS",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 17, 162, 126),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 32,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Card(
//                   // child: Padding(
//                   // padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                       // leading: Icon(Icons.label_important),
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Full name: ",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Delivery method name: " +
//                               widget.post.deliveryMethod +
//                               " ",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Order Status: " + widget.post.orderStatus,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Weight: " + widget.post.weight,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Payment Method" + widget.post.paymentMethod,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Total price: RM " +
//                               widget.post.totalPrice.toStringAsFixed(2),
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Address: " + widget.post.address,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Total price: RM " + widget.post.date,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Date " + widget.post.date,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           "Time " + widget.post.time,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ]),
//                 )
//               ]),
//             ));
//   }
// }
