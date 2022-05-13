import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import '../../screens/home/home_viewmodel.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          View<HomeViewmodel>(
            builder: (_, viewmodel) => Text("Welcome"
            ),
          ),
        ],
      ),
    );
  }
}
