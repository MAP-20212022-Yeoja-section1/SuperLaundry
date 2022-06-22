import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/reviews.dart';

abstract class CustReviewService {
  Future createReview(
    String reviewDate,
    String comment,
    String rating,
    String dissatisfaction,
  );
}
