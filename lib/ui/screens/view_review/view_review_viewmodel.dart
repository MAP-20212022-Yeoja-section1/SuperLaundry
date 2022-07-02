import 'view_review.dart';

class ViewReviewViewModel extends Viewmodel {
  final LoginService _authService = locator<LoginService>();
  ViewReviewService get _viewReviewService => locator<ViewReviewService>();

  Future getCurrentID() async {
    return _authService.getCurrentUID();
  }

  Stream<List<ReviewsModel>> readAllReviews() {
    return _viewReviewService.readAllReviews();
  }

  Future readTotalReviews() {
    return _viewReviewService.readTotalReviews();
  }

  Future readTotalFiveStarsReviews() {
    return _viewReviewService.readTotalFiveStarsReviews();
  }

  Future readTotalFourStarsReviews() {
    return _viewReviewService.readTotalFourStarsReviews();
  }

  Future readTotalThreeStarsReviews() {
    return _viewReviewService.readTotalThreeStarsReviews();
  }

  Future readTotalTwoStarsReviews() {
    return _viewReviewService.readTotalTwoStarsReviews();
  }

  Future readTotalOneStarsReviews() {
    return _viewReviewService.readTotalOneStarsReviews();
  }

  Stream<List<ReviewsModel>> readFiveStarsReviews() {
    return _viewReviewService.readFiveStarsReviews();
  }

  Stream<List<ReviewsModel>> readFourStarsReviews() {
    return _viewReviewService.readFourStarsReviews();
  }

  Stream<List<ReviewsModel>> readThreeStarsReviews() {
    return _viewReviewService.readThreeStarsReviews();
  }

  Stream<List<ReviewsModel>> readTwoStarsReviews() {
    return _viewReviewService.readTwoStarsReviews();
  }

  Stream<List<ReviewsModel>> readOneStarsReviews() {
    return _viewReviewService.readOneStarsReviews();
  }
}
