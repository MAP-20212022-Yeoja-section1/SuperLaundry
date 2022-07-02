import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class AllReviewScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => AllReviewScreen());

  @override
  AllReviewScreenState createState() => AllReviewScreenState();
}

class AllReviewScreenState extends State<AllReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ViewReviewAppBar(),
        body: AllReviewBody(),
      ),
    );
  }
}
