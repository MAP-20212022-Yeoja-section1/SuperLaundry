import 'package:flutter/material.dart';

import 'change_status.dart';

class ChangeStatusScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => ChangeStatusScreen());
  const ChangeStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ChangeStatusAppBar(),
        body: ChangeStatusBody(),
      ),
    );
  }
}
