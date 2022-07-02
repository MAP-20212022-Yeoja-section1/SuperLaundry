import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class TwoStarReviewScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => TwoStarReviewScreen());

  @override
  TwoStarReviewScreenState createState() => TwoStarReviewScreenState();
}

class TwoStarReviewScreenState extends State<TwoStarReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ViewReviewAppBar(),
        body: TwoStarReviewBody(),
      ),
    );
  }
}
