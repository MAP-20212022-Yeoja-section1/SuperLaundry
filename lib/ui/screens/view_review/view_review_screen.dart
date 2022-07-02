import 'view_review.dart';

class ViewReviewScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => ViewReviewScreen());

  @override
  ViewReviewScreenState createState() => ViewReviewScreenState();
}

class ViewReviewScreenState extends State<ViewReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ViewReviewAppBar(),
        body: ViewReviewBodyMain(),
      ),
    );
  }
}
