import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/main.dart';
import '../login/login_screen.dart';
import 'mainmenu_viewmodel.dart';

class mainMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const mainMenuAppBar({
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
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>ManagerMenu()));
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
            bool msg = await viewmodel.logoutUser();
            if(msg){
              Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
              Fluttertoast.showToast(msg: "Logout successful!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                fontSize: 16,
                backgroundColor: Color.fromARGB(255, 69, 161, 76),
              );
            }else{
              Fluttertoast.showToast(
                msg: "Logout unsuccessful!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                fontSize: 16,
                backgroundColor: Color.fromARGB(255, 235, 79, 68)
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

class MenuViewModel {
}
