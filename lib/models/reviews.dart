class ReviewsModel {
  String userId;
  String reviewId;
  String ratingDate;
  String comment;
  String rating;
  String dissatisfaction;

  ReviewsModel({
    this.userId = "",
    this.reviewId = "",
    this.ratingDate = "",
    this.comment = "",
    this.rating = "",
    this.dissatisfaction = "Sattisfied",
  });

  factory ReviewsModel.fromMap(map) {
    return ReviewsModel(
        userId: map["userId"],
        reviewId: map["reviewId"],
        ratingDate: map["ratingDate"],
        comment: map["comment"],
        rating: map["rating"],
        dissatisfaction: map["dissatisfaction"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "reviewId": reviewId,
      "ratingDate": ratingDate,
      "comment": comment,
      "rating": rating,
      "dissatisfaction": dissatisfaction
    };
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "reviewId": reviewId,
        "ratingDate": ratingDate,
        "comment": comment,
        "rating": rating,
        "dissatisfaction": dissatisfaction
      };

  static ReviewsModel fromJson(Map<String, dynamic> json) => ReviewsModel(
      userId: json['userId'],
      reviewId: json['reviewId'],
      ratingDate: json["ratingDate"],
      comment: json["comment"],
      rating: json["rating"],
      dissatisfaction: json["dissatisfaction"]);
}
