import 'view_review.dart';

class ViewReviewViewModel extends Viewmodel {
  ViewReviewService get _viewReviewService => locator<ViewReviewService>();

  Stream<List<ReviewsModel>> readAllReviews() {
    return _viewReviewService.readAllReviews();
  }

  Future readTotalReviews() {
    return _viewReviewService.readTotalReviews();
  }

  Future readTotalNumberStarReviews(String rating) {
    return _viewReviewService.readTotalNumberStarReviews(rating);
  }

  Stream<List<ReviewsModel>> readStarsReviewsList(String rating) {
    return _viewReviewService.readStarsReviewsList(rating);
  }
}
