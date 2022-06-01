import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/screens/wrapper.dart';

import '../home_manager/mainmenuM_viewmodel.dart';
import '../login/login_screen.dart';
import 'mainmenuM_viewmodel.dart';

class mainMenuMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const mainMenuMAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return View<MenumViewmodel>(
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
                  onPressed: () async {
                    dynamic msg = await viewmodel.logoutUser();
                    if (msg == 100) {
                      Fluttertoast.showToast(
                          msg: "Unable to logout",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          fontSize: 16,
                          backgroundColor: Color.fromARGB(255, 235, 79, 68));
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Wrapper()));
                      Fluttertoast.showToast(
                        msg: "Logout successfully!",
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
            ));
  }
}
