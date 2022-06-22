import 'cust_review.dart';

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
