import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class OneStarReviewScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => OneStarReviewScreen());

  @override
  OneStarReviewScreenState createState() => OneStarReviewScreenState();
}

class OneStarReviewScreenState extends State<OneStarReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ViewReviewAppBar(),
        body: OneStarReviewBody(),
      ),
    );
  }
}
