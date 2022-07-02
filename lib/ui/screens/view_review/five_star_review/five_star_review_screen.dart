import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class FiveStarReviewScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => FiveStarReviewScreen());

  @override
  FiveStarReviewScreenState createState() => FiveStarReviewScreenState();
}

class FiveStarReviewScreenState extends State<FiveStarReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ViewReviewAppBar(),
        body: FiveStarReviewBody(),
      ),
    );
  }
}
