import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/graphql/review/hsReview.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart' as review;

class CustBusinessViewController {
  // instances //

  // streams //

  // variables //

  late int _businessId;
  late TabController tabController;

  // states variables //
  Rxn<Business> _business = Rxn<Business>();
  final RxList<review.Review> _reviews = RxList.empty();
  final RxnNum _ratingAverage = RxnNum();

  AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;

  RxList<Post> _posts = RxList.empty();
  List<Post> get posts => _posts.value;

  RxList<int> _subscribers = RxList.empty();
  List<int> get subscribers => _subscribers.value;

  RxBool get _isSubscribed =>
      _subscribers.contains(_authController.user?.hasuraId).obs;
  bool get isSubscribed => _isSubscribed.value;

  RxList<Post> _gridImages = RxList.empty();
  List<Post> get gridImages => _gridImages.value;

// getters

  int get businessId => _businessId;

  Business? get business => _business.value;
  bool get isBusinessLoaded => _business.value != null;
  RxList<review.Review> get reviews => _reviews;
  RxnNum get ratingAverage => _ratingAverage;
  RxList<Offer> promotions = RxList.empty();

  // methods //
  Future<void> init({
    required int businessId,
    required TickerProvider vsync,
  }) async {
    _businessId = businessId;
    tabController = TabController(length: 3, vsync: vsync);

    unawaited(_fetchPosts());
    unawaited(_fetchGridImages());

    mezDbgPrint('businessId: $businessId');
    _business.value =
        await get_business_by_id(id: businessId, withCache: false);
    mezDbgPrint(_business.value?.toFirebaseFormattedJson());

    await _fetchSubscriptions();

    promotions.value = await fetch_promotions(
      serviceProviderId: businessId,
      serviceProviderType: ServiceProviderType.Business,
      withCache: false,
    );

    // _service.value = await get_service_details_by_id(
    //     serviceDetailsId: serviceDetailsId, serviceId: serviceId);

    unawaited(get_service_reviews(
            serviceId: businessId,
            serviceProviderType: ServiceProviderType.Business,
            withCache: false)
        .then((List<review.Review>? value) {
      if (value != null) {
        _reviews.value = value;
      }
    }));

    unawaited(get_service_review_average(
            serviceId: businessId,
            serviceProviderType: ServiceProviderType.Business,
            withCache: false)
        .then((num? value) {
      if (value != null) {
        _ratingAverage.value = value;
      }
    }));
  }

  Future<void> _fetchPosts() async {
    try {
      _posts.value = await fetch_service_provider_posts(
          imagesOnly: false,
          serviceProviderId: businessId,
          serviceProviderType: ServiceProviderType.Business);
    } catch (e) {
    } finally {}
  }

  Future<void> _fetchGridImages() async {
    try {
      _gridImages.value = await fetch_service_provider_posts(
          imagesOnly: true,
          serviceProviderId: businessId,
          serviceProviderType: ServiceProviderType.Business);
    } catch (e) {
    } finally {}
  }

  Future<void> writeComment(
      {required int postId,
      required TextEditingController commentController}) async {
    if (commentController.text.isEmpty) return;

    commentController.text = '';
    await write_comment(
        userId: _authController.hasuraUserId!,
        postId: postId,
        commentMsg: commentController.text);
  }

  Future<void> likePost(
    Post post,
  ) async {
    final List<int> likes = post.likes;

    if (likes.contains(_authController.user!.hasuraId)) {
      likes.remove(_authController.user!.hasuraId);
    } else {
      likes.add(_authController.user!.hasuraId);
    }
    await update_post_likes(postId: post.id, likes: likes);
  }

  bool _canSubscribe = true;
  Future<void> subscribe() async {
    if (!_canSubscribe) return;

    _canSubscribe = false;

    await _fetchSubscriptions();

    if (_subscribers.contains(_authController.user?.hasuraId)) {
      await unsubscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: businessId,
          serviceProviderType: business!.details.serviceProviderType);
    } else {
      await subscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: businessId,
          serviceProviderType: business!.details.serviceProviderType);
    }
    _isSubscribed.refresh();
    _canSubscribe = true;
  }

  Future<void> _fetchSubscriptions() async {
    _subscribers.value = await fetch_subscribers(
        serviceProviderId: businessId,
        serviceProviderType: business!.details.serviceProviderType);
  }

  void dispose() {}
}
