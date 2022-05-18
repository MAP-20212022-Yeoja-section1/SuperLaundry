import 'package:flutter/material.dart';

import 'forgot_pass.dart';

class ForgotPassScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => ForgotPassScreen());
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ForgotPassAppBar(),
        body: ForgotPassBody(),
        // floatingActionButton: const ForgotPassFloat(),
      ),
    );
  }
}
