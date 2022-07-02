import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class ThreeStarReviewScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => ThreeStarReviewScreen());

  @override
  ThreeStarReviewScreenState createState() => ThreeStarReviewScreenState();
}

class ThreeStarReviewScreenState extends State<ThreeStarReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ViewReviewAppBar(),
        body: ThreeStarReviewBody(),
      ),
    );
  }
}
