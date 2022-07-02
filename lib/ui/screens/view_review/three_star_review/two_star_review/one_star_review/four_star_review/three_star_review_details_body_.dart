import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class ThreeStarReviewDetailsBody extends StatefulWidget {
  final ReviewsModel post;

  ThreeStarReviewDetailsBody({required this.post});

  @override
  ThreeStarReviewDetailsBodyState createState() =>
      ThreeStarReviewDetailsBodyState();
}

class ThreeStarReviewDetailsBodyState
    extends State<ThreeStarReviewDetailsBody> {
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
                            builder: (context) => ThreeStarReviewScreen()));
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
                child: Container(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 115,
                            width: 115,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: AssetImage('assets/images/feedback.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 420,
                            width: 350,
                            // child: Align(
                            //   alignment: Alignment.center,
                            child: Container(
                              // alignment: Alignment.center,
                              height: 200,
                              width: 350,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 217, 255, 245),
                                borderRadius:
                                    BorderRadius.all(const Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 30.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ListTile(
                                      title: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                    fontWeight:
                                                        FontWeight.bold))
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
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ListTile(
                                      title: Text(
                                        '"' + widget.post.comment + '"',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Center(
                                    child: ListTile(
                                      title: Text(
                                        'Review Date : ' +
                                            widget.post.ratingDate,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
