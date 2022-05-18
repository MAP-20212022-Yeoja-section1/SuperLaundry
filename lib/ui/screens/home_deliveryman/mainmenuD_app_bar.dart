import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';

import '../home_customer/mainmenu_viewmodel.dart';
import '../login/login_screen.dart';

class mainMenuDAppBar extends StatelessWidget implements PreferredSizeWidget {
  const mainMenuDAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return View<MenuViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => AppBar(
      title: Text('MAIN MENU'),
      leading: IconButton(
        onPressed: () {
          
        },
        icon: Icon(Icons.person),
        iconSize: 30.0,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          onPressed: ()async{
            String msg = await viewmodel.logoutUser();
            if(msg!="Logout successful!"){
              Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                fontSize: 16,
                backgroundColor: Color.fromARGB(255, 235, 79, 68)
              );
            }else{
              Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
              Fluttertoast.showToast(msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                fontSize: 16,
                backgroundColor: Color.fromARGB(255, 69, 161, 76),
              );
            }
          },
        )        
      ],
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 215, 169),
      foregroundColor: Colors.white,
    )
    );
  }
}
