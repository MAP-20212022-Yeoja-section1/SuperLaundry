import 'package:superlaundry/models/reviews.dart';

abstract class ViewReviewService {
  Stream<List<ReviewsModel>> readAllReviews();
  Future readTotalReviews();
  Future readTotalNumberStarReviews(String rating);
  Stream<List<ReviewsModel>> readStarsReviewsList(String rating);
}
