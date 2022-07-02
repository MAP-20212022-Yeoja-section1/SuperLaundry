import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class FiveStarReviewDetailsBody extends StatefulWidget {
  final ReviewsModel post;

  FiveStarReviewDetailsBody({required this.post});

  @override
  FiveStarReviewDetailsBodyState createState() =>
      FiveStarReviewDetailsBodyState();
}

class FiveStarReviewDetailsBodyState extends State<FiveStarReviewDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return View<ViewReviewViewModel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: Text('REVIEW'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FiveStarReviewScreen()));
                  },
                  icon: Icon(Icons.chevron_left_sharp),
                  iconSize: 40.0,
                ),
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 31, 215, 169),
                foregroundColor: Colors.white,
                actions: <Widget>[],
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(167, 255, 235, 100),
                ),
                child: SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 40.0,
                                      ),
                                    ),
                                    Text(
                                        "  " +
                                            widget.post.rating +
                                            " Star" +
                                            " | " +
                                            widget.post.dissatisfaction,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Text(
                                '"' + widget.post.comment + '"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Center(
                            child: ListTile(
                              title: Text(
                                'Review Date : ' + widget.post.ratingDate,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          Center(
                            child: ListTile(
                              title: Text(
                                'Review ID : ' + widget.post.reviewId,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          Center(
                            child: ListTile(
                              title: Text(
                                'User ID : ' + widget.post.userId,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
