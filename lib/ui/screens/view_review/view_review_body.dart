import 'package:superlaundry/ui/screens/view_review/all_review/five_star_review/all_review_screen.dart';

import 'view_review.dart';

class ViewReviewBodyMain extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => ViewReviewBodyMain());

  @override
  _ViewReviewBodyMain createState() => _ViewReviewBodyMain();
}

class _ViewReviewBodyMain extends State<ViewReviewBodyMain> {
  String oneStar = "1";
  String twoStar = "2";
  String threeStar = "3";
  String fourStar = "4";
  String fiveStar = "5";

  @override
  Widget build(BuildContext context) {
    return View<ViewReviewViewModel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 167, 255, 235)),
              ),
              SingleChildScrollView(
                child: Column(children: <Widget>[
                  Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28.0, top: 12.0, right: 28.0),
                        child: Column(
                          children: <Widget>[
                            FutureBuilder(
                                future: viewmodel.readTotalReviews(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                                "Total customers reviews: " +
                                                    snapshot.data.toString(),
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.red[700]),
                                      ),
                                    );
                                  } else {
                                    return Center(child: Text("loading..."));
                                  }
                                }),
                            Divider(
                                thickness: 1, color: Colors.grey, height: 20),
                            SizedBox(height: 12.0),
                            FutureBuilder(
                                future: viewmodel
                                    .readTotalNumberStarReviews(fiveStar),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Card(
                                      margin: EdgeInsets.all(5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FiveStarReviewScreen()));
                                            },
                                            child: Center(
                                                child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 45,
                                                      color: Colors.white,
                                                      child: Wrap(
                                                        alignment: WrapAlignment
                                                            .center,
                                                        children: List<
                                                                Widget>.generate(
                                                            int.parse(fiveStar),
                                                            (int index) {
                                                          return Icon(
                                                              Icons
                                                                  .star_outlined,
                                                              size: 40,
                                                              color:
                                                                  Colors.amber);
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                      fiveStar +
                                                          " Stars Reviews : " +
                                                          snapshot.data
                                                              .toString(),
                                                      style: new TextStyle(
                                                          fontSize: 17.0)),
                                                )
                                              ],
                                            ))),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.red[700]),
                                      ),
                                    );
                                  } else {
                                    return Center(child: Text("loading..."));
                                  }
                                }),
                            FutureBuilder(
                                future: viewmodel
                                    .readTotalNumberStarReviews(fourStar),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Card(
                                      margin: EdgeInsets.all(5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FourStarReviewScreen()));
                                            },
                                            child: Center(
                                                child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 45,
                                                      color: Colors.white,
                                                      child: Wrap(
                                                        alignment: WrapAlignment
                                                            .center,
                                                        children: List<
                                                                Widget>.generate(
                                                            int.parse(fourStar),
                                                            (int index) {
                                                          return Icon(
                                                              Icons
                                                                  .star_outlined,
                                                              size: 40,
                                                              color:
                                                                  Colors.amber);
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                      fourStar +
                                                          " Stars Reviews : " +
                                                          snapshot.data
                                                              .toString(),
                                                      style: new TextStyle(
                                                          fontSize: 17.0)),
                                                )
                                              ],
                                            ))),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.red[700]),
                                      ),
                                    );
                                  } else {
                                    return Center(child: Text("loading..."));
                                  }
                                }),
                            FutureBuilder(
                                future: viewmodel
                                    .readTotalNumberStarReviews(threeStar),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Card(
                                      margin: EdgeInsets.all(5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ThreeStarReviewScreen()));
                                            },
                                            child: Center(
                                                child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 45,
                                                      color: Colors.white,
                                                      child: Wrap(
                                                        alignment: WrapAlignment
                                                            .center,
                                                        children: List<
                                                                Widget>.generate(
                                                            int.parse(
                                                                threeStar),
                                                            (int index) {
                                                          return Icon(
                                                              Icons
                                                                  .star_outlined,
                                                              size: 40,
                                                              color:
                                                                  Colors.amber);
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                      threeStar +
                                                          " Stars Reviews : " +
                                                          snapshot.data
                                                              .toString(),
                                                      style: new TextStyle(
                                                          fontSize: 17.0)),
                                                )
                                              ],
                                            ))),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.red[700]),
                                      ),
                                    );
                                  } else {
                                    return Center(child: Text("loading..."));
                                  }
                                }),
                            FutureBuilder(
                                future: viewmodel
                                    .readTotalNumberStarReviews(twoStar),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Card(
                                      margin: EdgeInsets.all(5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TwoStarReviewScreen()));
                                            },
                                            child: Center(
                                                child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 45,
                                                      color: Colors.white,
                                                      child: Wrap(
                                                        alignment: WrapAlignment
                                                            .center,
                                                        children: List<
                                                                Widget>.generate(
                                                            int.parse(twoStar),
                                                            (int index) {
                                                          return Icon(
                                                              Icons
                                                                  .star_outlined,
                                                              size: 40,
                                                              color:
                                                                  Colors.amber);
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                      twoStar +
                                                          " Stars Reviews : " +
                                                          snapshot.data
                                                              .toString(),
                                                      style: new TextStyle(
                                                          fontSize: 17.0)),
                                                )
                                              ],
                                            ))),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.red[700]),
                                      ),
                                    );
                                  } else {
                                    return Center(child: Text("loading..."));
                                  }
                                }),
                            FutureBuilder(
                                future: viewmodel
                                    .readTotalNumberStarReviews(oneStar),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Card(
                                      margin: EdgeInsets.all(5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OneStarReviewScreen()));
                                            },
                                            child: Center(
                                                child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 45,
                                                      color: Colors.white,
                                                      child: Wrap(
                                                        alignment: WrapAlignment
                                                            .center,
                                                        children: List<
                                                                Widget>.generate(
                                                            int.parse(oneStar),
                                                            (int index) {
                                                          return Icon(
                                                              Icons
                                                                  .star_outlined,
                                                              size: 40,
                                                              color:
                                                                  Colors.amber);
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                      oneStar +
                                                          " Star Reviews : " +
                                                          snapshot.data
                                                              .toString(),
                                                      style: new TextStyle(
                                                          fontSize: 17.0)),
                                                )
                                              ],
                                            ))),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.red[700]),
                                      ),
                                    );
                                  } else {
                                    return Center(child: Text("loading..."));
                                  }
                                }),
                            FutureBuilder(
                                future: viewmodel.readTotalReviews(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Card(
                                      margin: EdgeInsets.all(5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AllReviewScreen()));
                                            },
                                            child: Center(
                                                child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 15,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      // child: Wrap(
                                                      //   alignment: WrapAlignment
                                                      //       .center,
                                                      //   children: List<
                                                      //           Widget>.generate(
                                                      //       5, (int index) {
                                                      //     return Icon(
                                                      //         Icons
                                                      //             .star_outlined,
                                                      //         size: 40,
                                                      //         color:
                                                      //             Colors.amber);
                                                      //   }),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 12.0),
                                                  child: Text("All Reviews ",
                                                      style: new TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )
                                              ],
                                            ))),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            backgroundColor: Colors.red[700]),
                                      ),
                                    );
                                  } else {
                                    return Center(child: Text("loading..."));
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ]));
  }
}
