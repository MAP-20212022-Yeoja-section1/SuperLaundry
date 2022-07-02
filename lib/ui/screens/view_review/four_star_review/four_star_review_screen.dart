import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class FourStarReviewScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => FourStarReviewScreen());

  @override
  FourStarReviewScreenState createState() => FourStarReviewScreenState();
}

class FourStarReviewScreenState extends State<FourStarReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ViewReviewAppBar(),
        body: FourStarReviewBody(),
      ),
    );
  }
}
