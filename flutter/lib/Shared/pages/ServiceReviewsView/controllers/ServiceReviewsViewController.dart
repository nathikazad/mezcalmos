import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/graphql/review/hsReview.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';

class ServiceReviewsViewController {
  /// Handles ui logic of the menu view inside the restaurant app
  /// NB : This class is a normal dart class no extends no inheritance
//  Contructor
  ServiceReviewsViewController();

// instances and streams subscriptions

  ServiceProfileController serviceProfileViewController =
      Get.find<ServiceProfileController>();
  // state variables

  RxList<Review> _reviews = RxList.empty();
  RxnDouble _rating = RxnDouble();
  List<ReviewsFilter> filters = [
    ReviewsFilter.Default,
    ReviewsFilter.HighestRate,
    ReviewsFilter.LowestRate,
  ];
  Rx<ReviewsFilter> filterBy = Rx(ReviewsFilter.Default);
  // getters
  bool get hasReviews => _reviews.isNotEmpty;
  List<Review> get reviews => _reviews.value;
  num get rating => _rating.value!;
  int get detailsId => serviceProfileViewController.detailsId;
  bool get hasRating => _rating.value != null;
  RxBool hasLoded = RxBool(false);

// IMPORTANT //
  // This method needs to be called on the initState method of the view
  Future<void> fetchReviewsAndRating() async {
    try {
      _reviews.value = await get_service_reviews(
              serviceDetailsId: detailsId, withCache: false) ??
          [];
      _rating.value = await get_service_review_average(
          detailsId: detailsId, withCache: false);
    } on Exception catch (e, stk) {
      mezDbgPrint("Errors $e");
      mezDbgPrint("Errors $stk");
      // TODO
    }
    hasLoded.value = true;
  }

  // IMPORTANT //
  // This method needs to be called on the dispose method of the view
  void dispose() {
    // _restaurantListener?.cancel();
  }

  void switchFiletrBy(ReviewsFilter v) {
    filterBy.value = v;
    switch (v) {
      case ReviewsFilter.Default:
        _reviews
            .sort((Review a, Review b) => b.reviewTime.compareTo(a.reviewTime));

        break;
      case ReviewsFilter.HighestRate:
        _reviews.sort((Review a, Review b) {
          return b.rating.compareTo(a.rating);
        });

        break;
      case ReviewsFilter.LowestRate:
        _reviews.sort((Review a, Review b) {
          return a.rating.compareTo(b.rating);
        });

        break;
      default:
    }
  }

  String performanceString() {
    if (rating >= 4) {
      return "excellent";
    } else if (rating >= 3) {
      return "good";
    } else if (rating > 2) {
      return "bad";
    } else {
      return "poor";
    }
  }

  Color performColor() {
    if (rating <= 2) {
      return offRedColor;
    } else if (rating <= 3) {
      return Colors.amber.shade100;
    } else {
      return secondaryLightBlueColor;
    }
  }

  Color performTextColor() {
    if (rating <= 2) {
      return Colors.redAccent;
    } else if (rating <= 3) {
      return Colors.amber.shade700;
    } else {
      return primaryBlueColor;
    }
  }
}

enum ReviewsFilter { HighestRate, LowestRate, Default }

extension pickerHelper on ReviewsFilter {
  String toNormalString() {
    final String str = toString().split('.').last.toLowerCase();

    return str.toLowerCase();
  }
}
