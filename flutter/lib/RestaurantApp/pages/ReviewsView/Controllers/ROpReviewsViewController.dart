import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';

class ROpReviewsViewController {
  /// Handles ui logic of the menu view inside the restaurant app
  /// NB : This class is a normal dart class no extends no inheritance
//  Contructor
  ROpReviewsViewController();

// instances and streams subscriptions
  late RestaurantInfoController restaurantInfoController;
  StreamSubscription? _restaurantListener;

  // state variables
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  RxList<Review> _reviews = RxList.empty();
  List<ReviewsFilter> filters = [
    ReviewsFilter.Default,
    ReviewsFilter.HighestRate,
    ReviewsFilter.LowestRate,
  ];
  Rx<ReviewsFilter> filterBy = Rx(ReviewsFilter.Default);
  // getters
  bool get hasReviews =>
      restaurant.value != null &&
      restaurant.value!.reviews.isNotEmpty &&
      restaurant.value!.rate != null;

  num get rating => restaurant.value!.rate!;
  List<Review> get reviews => _reviews.value;

// IMPORTANT //
  // This method needs to be called on the initState method of the view
  Future<void> init({required int restaurantId}) async {
    // assigning restaurant data and start the stream subscription //
    // mezDbgPrint("INIT REVIEWS VIEW =======>$restaurantId");
    // Get.put(RestaurantInfoController(), permanent: false);
    // restaurantInfoController = Get.find<RestaurantInfoController>();
    // restaurantInfoController.init(restId: restaurantId);
    // restaurant.value =
    //     await restaurantInfoController.getRestaurantAsFuture(restaurantId);
    // _reviews.value = restaurant.value!.reviews;
    // _restaurantListener = restaurantInfoController
    //     .getRestaurant(restaurantId)
    //     .listen((Restaurant? event) {
    //   if (event != null) {
    //     restaurant.value = event;
    //     _reviews.value = restaurant.value!.reviews;
    //   }
    // });
  }

  // IMPORTANT //
  // This method needs to be called on the dispose method of the view
  void dispose() {
    _restaurantListener?.cancel();
  }

  void switchFiletrBy(ReviewsFilter v) {
    filterBy.value = v;
    switch (v) {
      case ReviewsFilter.Default:
        _reviews.sort(
            (Review a, Review b) => b.reviewTime!.compareTo(a.reviewTime!));

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
