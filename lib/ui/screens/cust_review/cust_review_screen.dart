import 'package:flutter/material.dart';

import 'cust_review.dart';

class CustReviewScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => CustReviewScreen());
  const CustReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustReviewAppBar(),
        body: CustReviewBody(),
      ),
    );
  }
}
