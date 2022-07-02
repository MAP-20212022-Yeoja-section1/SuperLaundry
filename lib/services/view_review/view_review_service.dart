import 'package:superlaundry/models/orders.dart';
import 'package:superlaundry/models/reviews.dart';

abstract class ViewReviewService {
  Stream<List<ReviewsModel>> readAllReviews();
  Future readTotalReviews();
  Future readTotalFiveStarsReviews();
  Future readTotalFourStarsReviews();
  Future readTotalThreeStarsReviews();
  Future readTotalTwoStarsReviews();
  Future readTotalOneStarsReviews();
  Stream<List<ReviewsModel>> readFiveStarsReviews();
  Stream<List<ReviewsModel>> readFourStarsReviews();
  Stream<List<ReviewsModel>> readThreeStarsReviews();
  Stream<List<ReviewsModel>> readTwoStarsReviews();
  Stream<List<ReviewsModel>> readOneStarsReviews();
}
