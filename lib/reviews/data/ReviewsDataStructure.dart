



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

  late var jsonResult;

  ReviewsDataStructure(var jsonResponse) {

    jsonResult = (jsonResponse);

  }

  String userReviewerValue() {

    return jsonResult[ReviewsDataStructure.userReviewer];
  }

  String productReviewValue() {

    return jsonResult[ReviewsDataStructure.productReview];
  }

  String productRateValue() {

    return jsonResult[ReviewsDataStructure.productRate];
  }

  String productNameValue() {

    return jsonResult[ReviewsDataStructure.productName];
  }

  String productIdValue() {

    return jsonResult[ReviewsDataStructure.productId].toString();
  }

}