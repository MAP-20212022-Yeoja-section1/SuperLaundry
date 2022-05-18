// import 'package:flutter/material.dart';
// import 'package:map_mvvm/view.dart';
// import 'package:superlaundry/ui/ui_utils.dart';
// import 'forgot_pass_viewmodel.dart';

// class ForgotPassFloat extends StatelessWidget {
//   const ForgotPassFloat({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return View<ForgotPassViewmodel>(
//     //     shouldRebuild: false, builder: (_, viewmodel) => Row());

//     return Stack(
//       children: [
//         Center(
//           child: Container(
//             margin: EdgeInsets.only(top: 250, left: 40),
//             child: SizedBox(
//               width: 300,
//               child: RaisedButton(
//                 onPressed: () {
//                   // userSubmit();
//                   // Navigator.push(context,MaterialPageRoute(builder: (context)=> Login()));
//                   if (_formKey.currentState!.validate()) {
//                     viewmodel.resetPassword(
//                         newPassword: newPasswordController.text);
//                   }
//                 },
//                 child: Text(
//                   'Send Login Link',
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                       letterSpacing: 1.2),
//                   textAlign: TextAlign.center,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 textColor: Colors.white,
//                 color: Color.fromARGB(255, 29, 233, 182),
//                 focusColor: Colors.green,
//                 hoverColor: Colors.green,
//               ),
//             ),
//           ),
//         ),
//         Center(
//           child: Container(
//             margin: EdgeInsets.only(top: 350, left: 40),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 top: 40,
//               ),
//               child: FlatButton(
//                 onPressed: () {
//                   // Navigator.push(context,MaterialPageRoute(builder: (context)=> Login()));
//                 },
//                 child: Text('Back To Login'),
//                 textColor: Colors.blue[600],
//                 color: Colors.white,
//                 focusColor: Colors.blue[300],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
