import 'cust_review.dart';

class CustReviewBody extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => CustReviewBody());

  @override
  _CustReviewBody createState() => _CustReviewBody();
}

class _CustReviewBody extends State<CustReviewBody> {
  String comment = "";
  var commentController = TextEditingController();
  String dissatisfaction = "Sattisfied";
  String rating = "";
  var ratingController = TextEditingController();
  String ratingDate = "";
  var _starPosition = 200.0;
  late var _rating = 0;
  var _ratingPageController = PageController();
  var _selectedChipIndex = -1;
  var _isMoreDetailActive = false;
  var _moreDetailFocusNode = FocusNode();
  bool visible = false;

  void userSubmit() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Thank you for the review.'),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return View<CustReviewViewmodel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Stack(children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      //Thanks note
                      Container(
                        height:
                            max(300, MediaQuery.of(context).size.height * 0.3),
                        child: PageView(
                          controller: _ratingPageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            _buildThanksNote(),
                            _causeOfRating(),
                          ],
                        ),
                      ),
                      //Done button
                      Positioned(
                        bottom: 0,
                        left: 4,
                        right: 4,
                        child: Container(
                          // color: Color.fromARGB(255, 89, 245, 206),
                          child: RaisedButton(
                            onPressed: () async {
                              var msg = await viewmodel.createReview(
                                ratingDate: DateTime.now().toIso8601String(),
                                comment: commentController.text,
                                rating: ratingController.text,
                                dissatisfaction: dissatisfaction,
                              );

                              if (msg == 100) {
                                Fluttertoast.showToast(
                                  msg: "Error! Unable to submit the review.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  fontSize: 16,
                                  backgroundColor:
                                      const Color.fromARGB(255, 209, 68, 58),
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: "The review is successfully submitted!",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  fontSize: 16,
                                  backgroundColor:
                                      const Color.fromARGB(255, 69, 161, 76),
                                );
                              }
                              userSubmit();
                              Navigator.pop(context);
                              _hideDialog();
                            },
                            child: Text('Submit'),
                            textColor: Colors.white,
                            color: Color.fromARGB(255, 89, 245, 206),
                            focusColor: Color.fromARGB(255, 255, 255, 255),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      //Skip button
                      Positioned(
                        right: 0,
                        child: MaterialButton(
                          onPressed: _hideDialog,
                          child: Text('Skip'),
                        ),
                      ),
                      //Star Rating
                      AnimatedPositioned(
                        top: _starPosition,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) => IconButton(
                              icon: index < _rating
                                  ? Icon(Icons.star, size: 32)
                                  : Icon(Icons.star_border, size: 32),
                              color: Color.fromARGB(255, 31, 215, 169),
                              onPressed: () {
                                _ratingPageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                                setState(() {
                                  _starPosition = 20.0;
                                  _rating = index + 1;
                                  ratingController = new TextEditingController(
                                      text: _rating.toString());
                                });
                              },
                            ),
                          ),
                        ),
                        duration: Duration(milliseconds: 300),
                      ),
                      //Back button
                      if (_isMoreDetailActive)
                        Positioned(
                          left: 0,
                          top: 0,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                _isMoreDetailActive = false;
                              });
                            },
                            child: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ]));
  }

  _buildThanksNote() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Enjoy Our Service?',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 45, 209, 168),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text('Tap the star to rate:'),
        Text('How was our laundry service today?'),
      ],
    );
  }

  _causeOfRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_isMoreDetailActive,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Dissatisfied?'),
              //Cause selection
              Wrap(
                spacing: 8.0,
                alignment: WrapAlignment.center,
                children: List.generate(
                  1,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        _selectedChipIndex = index;
                        dissatisfaction = "Dissatisfied";
                      });
                    },
                    child: Chip(
                      backgroundColor: _selectedChipIndex == index
                          ? Color.fromARGB(255, 31, 215, 169)
                          : Color.fromARGB(255, 128, 249, 219),
                      label: Text('I am dissatisfied'),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),
              //More button
              InkWell(
                onTap: () {
                  _moreDetailFocusNode.requestFocus();
                  setState(() {
                    _isMoreDetailActive = true;
                  });
                },
                child: Text(
                  'Want to tell us more?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tell us more'),
              Chip(label: Text('Tell us what is in your mind...')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: commentController,
                  focusNode: _moreDetailFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Write your review here...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
