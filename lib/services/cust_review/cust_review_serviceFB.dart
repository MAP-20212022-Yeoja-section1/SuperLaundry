import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/services/cust_review/cust_review_service.dart';
import '../../models/reviews.dart';

class CustReviewServiceWithFireBase extends CustReviewService {
  final _auth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future createReview(
    String ratingDate,
    String comment,
    String rating,
    String dissatisfaction,
  ) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final uid = user!.uid;

      final docReviews = FirebaseFirestore.instance.collection('reviews').doc();
      final reviewsModel = ReviewsModel(
        userId: user.uid,
        reviewId: docReviews.id,
        ratingDate: ratingDate,
        comment: comment,
        rating: rating,
        dissatisfaction: dissatisfaction,
      );

      final map = reviewsModel.toJson();
      await docReviews.set(map);

      // return Failures.submitOrderSucceed;
    } on Exception catch (e) {
      // return Failures.submitFail;
      return 100;
    }
  }
}
