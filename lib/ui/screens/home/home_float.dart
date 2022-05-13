import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:superlaundry/ui/ui_utils.dart';
import 'home_viewmodel.dart';

class HomeFloat extends StatelessWidget {
  const HomeFloat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => Row(
        
      )
    );
  }
}
