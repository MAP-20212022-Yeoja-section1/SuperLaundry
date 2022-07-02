import 'package:superlaundry/ui/screens/view_review/view_review.dart';

class OneStarReviewBody extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => OneStarReviewBody());

  @override
  _OneStarReviewBody createState() => _OneStarReviewBody();
}

class _OneStarReviewBody extends State<OneStarReviewBody> {
  @override
  Widget build(BuildContext context) {
    return View<ViewReviewViewModel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(167, 255, 235, 100),
          ),
          child: Column(
            children: [
              StreamBuilder<List<ReviewsModel>>(
                  stream: viewmodel.readOneStarsReviews(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final review = snapshot.data!;
                      return Row(children: <Widget>[
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: review.map((review) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(11, 181, 142, 100),
                                      )),
                                  margin:
                                      EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 2.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: ListTile(
                                      // leading: Icon(Icons.star),
                                      // title: Text(
                                      //   'Comment: ' + review.comment,
                                      //   style: TextStyle(fontSize: 17),
                                      // ),
                                      title: Row(
                                        children: [
                                          Container(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 14.0,
                                              )),
                                          const SizedBox(width: 16.0),
                                          Text(review.rating +
                                              ' | ' +
                                              review.dissatisfaction),
                                        ],
                                      ),
                                      subtitle:
                                          Text('"' + review.comment + '"'),
                                      // subtitle:
                                      //     Text('Comment: ' + review.comment),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OneStarReviewDetailsBody(
                                                        post: review)));
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ]);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
