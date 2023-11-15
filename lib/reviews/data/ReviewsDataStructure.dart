





class ReviewsDataStructure {

  //Sachiels AI Product Id = 9883
  /// product_id
  static const String productId = "product_id";

  /// product_name
  static const String productName = "product_name";
  /// rating
  static const String productRate = "rating";
  /// review
  static const String productReview = "review";

  /// reviewer
  static const String userReviewer = "reviewer";

  /// reviewer_avatar_urls
  static const String userReviewerAvatar = "reviewer_avatar_urls";

  late var jsonResult;

  ReviewsDataStructure(var jsonResponse) {

    jsonResult = (jsonResponse);

  }

  String userReviewerAvatarValue() {

    return (jsonResult[ReviewsDataStructure.userReviewerAvatar])['96'].toString();
  }

  String userReviewerValue() {

    return jsonResult[ReviewsDataStructure.userReviewer].toString();
  }

  String productReviewValue() {

    return jsonResult[ReviewsDataStructure.productReview].toString();
  }

  String productRateValue() {

    return jsonResult[ReviewsDataStructure.productRate].toString();
  }

  String productNameValue() {

    return jsonResult[ReviewsDataStructure.productName].toString();
  }

  String productIdValue() {

    return jsonResult[ReviewsDataStructure.productId].toString();
  }

}