import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:superlaundry/app/failures.dart';
import '../../../models/reviews.dart';
import '../../../app/service_locator.dart';
import '../../../services/cust_review/cust_review_service.dart';
import '../../../app/failures.dart';

class CustReviewViewmodel extends Viewmodel {
  CustReviewService get _custReviewService => locator<CustReviewService>();

  Future createReview({
    @required ratingDate,
    @required comment,
    @required rating,
    @required dissatisfaction,
  }) async {
    return await _custReviewService.createReview(
      ratingDate,
      comment,
      rating,
      dissatisfaction,
    );
  }
}
