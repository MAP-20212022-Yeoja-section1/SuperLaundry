import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:superlaundry/models/reviews.dart';
import 'package:superlaundry/models/user.dart';
import 'package:superlaundry/services/view_review/view_review_service.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/app/service_locator.dart';

class ViewReviewServiceWithFirestore extends ViewReviewService {
  @override
  Stream<List<ReviewsModel>> readAllReviews() {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // final User? user = auth.currentUser;
    // final uid = user!.uid;

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
  Future readTotalFiveStarsReviews() => FirebaseFirestore.instance
      .collection('reviews')
      .where('rating', isEqualTo: "5")
      .get()
      .then((value) => value.size);

  @override
  Future readTotalFourStarsReviews() => FirebaseFirestore.instance
      .collection('reviews')
      .where('rating', isEqualTo: "4")
      .get()
      .then((value) => value.size);

  @override
  Future readTotalThreeStarsReviews() => FirebaseFirestore.instance
      .collection('reviews')
      .where('rating', isEqualTo: "3")
      .get()
      .then((value) => value.size);

  @override
  Future readTotalTwoStarsReviews() => FirebaseFirestore.instance
      .collection('reviews')
      .where('rating', isEqualTo: "2")
      .get()
      .then((value) => value.size);

  @override
  Future readTotalOneStarsReviews() => FirebaseFirestore.instance
      .collection('reviews')
      .where('rating', isEqualTo: "1")
      .get()
      .then((value) => value.size);

  @override
  Stream<List<ReviewsModel>> readFiveStarsReviews() {
    return FirebaseFirestore.instance
        .collection('reviews')
        .where('rating', isEqualTo: "5")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReviewsModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Stream<List<ReviewsModel>> readFourStarsReviews() {
    return FirebaseFirestore.instance
        .collection('reviews')
        .where('rating', isEqualTo: "4")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReviewsModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Stream<List<ReviewsModel>> readThreeStarsReviews() {
    return FirebaseFirestore.instance
        .collection('reviews')
        .where('rating', isEqualTo: "3")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReviewsModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Stream<List<ReviewsModel>> readTwoStarsReviews() {
    return FirebaseFirestore.instance
        .collection('reviews')
        .where('rating', isEqualTo: "2")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReviewsModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Stream<List<ReviewsModel>> readOneStarsReviews() {
    return FirebaseFirestore.instance
        .collection('reviews')
        .where('rating', isEqualTo: "1")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReviewsModel.fromJson(doc.data()))
            .toList());
  }
}
