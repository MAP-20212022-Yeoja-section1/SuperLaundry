import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/reviews.dart';
import 'package:superlaundry/services/view_review/view_review_service.dart';

class ViewReviewServiceWithFirestore extends ViewReviewService {
  @override
  Stream<List<ReviewsModel>> readAllReviews() {
    return FirebaseFirestore.instance.collection('reviews').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => ReviewsModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future readTotalReviews() => FirebaseFirestore.instance
      .collection('reviews')
      .get()
      .then((value) => value.size);

  @override
  Future readTotalNumberStarReviews(String rating) => FirebaseFirestore.instance
      .collection('reviews')
      .where('rating', isEqualTo: rating)
      .get()
      .then((value) => value.size);

  @override
  Stream<List<ReviewsModel>> readStarsReviewsList(String rating) {
    return FirebaseFirestore.instance
        .collection('reviews')
        .where('rating', isEqualTo: rating)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReviewsModel.fromJson(doc.data()))
            .toList());
  }
}
