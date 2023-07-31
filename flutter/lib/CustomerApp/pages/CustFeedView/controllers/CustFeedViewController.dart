import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
import 'package:location/location.dart' as locPkg;

class CustFeedViewController {
  AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;

  Location? _fromLocation;

  RxList<Post> _posts = RxList<Post>.empty();
  List<Post> get posts => _posts.value;

  RxList<Offer> _promotions = RxList([]);
  List<dynamic> get promotions => _promotions.value;

  RxBool _postSwitch = true.obs;
  bool get postSwitch => _postSwitch.value;

  RxBool _promotionSwitch = true.obs;
  bool get promotionSwitch => _promotionSwitch.value;

  /* SCROLL CONTROLLER */
  ScrollController get postScrollController => _postScrollController;
  ScrollController _postScrollController = ScrollController();
  final int postFetchSize = 10;
  int _postCurrentOffset = 0;
  bool _postFetchingData = false;
  bool _postReachedEndOfData = false;

  ScrollController get promoScrollController => _promoScrollController;
  ScrollController _promoScrollController = ScrollController();
  final int promoFetchSize = 10;
  int _promoCurrentOffset = 0;
  bool _promoFetchingData = false;
  bool _promoReachedEndOfData = false;
  /* SCROLL CONTROLLER */

  void init() {
    _postScrollController.onBottomReach(
      _postSwitch.value ? _fetchAllPosts : _fetchPosts,
      sensitivity: 200,
    );
    _promoScrollController.onBottomReach(
      _promotionSwitch.value ? _fetchAllPromotions : _fetchPromotions,
      sensitivity: 200,
    );
    _fetchAllPosts();
    _fetchAllPromotions();
    print(_authController.hasuraUserId);
  }

  Future<void> _fetchPosts() async {
    if (_postFetchingData || _postReachedEndOfData) {
      return;
    }
    try {
      _postFetchingData = true;
      final List<Post> newData = await fetch_subscribed_posts(
        offset: _postCurrentOffset,
        limit: postFetchSize,
        customerId: _authController.hasuraUserId!,
      );
      print(newData.length);
      _posts.value += newData;
      if (newData.length == 0) {
        _postReachedEndOfData = true;
      }
      _postCurrentOffset += postFetchSize;
    } finally {
      _postFetchingData = false;
    }

    _posts.refresh();
  }

  Future<void> _fetchAllPosts() async {
    if (_postFetchingData || _postReachedEndOfData) {
      return;
    }
    try {
      _postFetchingData = true;
      final locPkg.LocationData location =
          await Get.find<LocationController>().getCurrentLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
            lat: location.latitude!, lng: location.longitude!, address: "");
      }
      final List<Post> newData = await fetch_posts_within_distance(
        offset: _postCurrentOffset,
        limit: postFetchSize,
        fromLocation: _fromLocation!,
      );
      print(newData.length);
      _posts.value += newData;
      if (newData.length == 0) {
        _postReachedEndOfData = true;
      }
      _postCurrentOffset += postFetchSize;
    } finally {
      _postFetchingData = false;
    }

    _posts.refresh();
  }

  Future<void> _fetchPromotions() async {
    if (_promoFetchingData || _promoReachedEndOfData) {
      return;
    }
    try {
      _promoFetchingData = true;
      final List<Offer> newData = await fetch_subscribed_promotions(
        offset: _promoCurrentOffset,
        limit: promoFetchSize,
        customerId: _authController.hasuraUserId!,
      );
      print(newData.length);
      _promotions.value += newData;
      if (newData.length == 0) {
        _promoReachedEndOfData = true;
      }
      _promoCurrentOffset += promoFetchSize;
    } finally {
      _promoFetchingData = false;
    }

    _promotions.refresh();
  }

  Future<void> _fetchAllPromotions() async {
    if (_promoFetchingData || _promoReachedEndOfData) {
      return;
    }
    try {
      _promoFetchingData = true;
      final locPkg.LocationData location =
          await Get.find<LocationController>().getCurrentLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
            lat: location.latitude!, lng: location.longitude!, address: "");
      }
      final List<Offer> newData = await fetch_all_promotions_within_distance(
        offset: _promoCurrentOffset,
        limit: promoFetchSize,
        fromLocation: _fromLocation!,
      );
      print(newData.length);
      _promotions.value += newData;
      if (newData.length == 0) {
        _promoReachedEndOfData = true;
      }
      _promoCurrentOffset += promoFetchSize;
    } finally {
      _promoFetchingData = false;
    }

    _promotions.refresh();
  }

  Future<void> writeComment(
      {required int postId,
      required TextEditingController commentController}) async {
    if (commentController.text.isEmpty) return;

    commentController.text = '';
    await write_comment(
      userId: _authController.hasuraUserId!.toInt(),
      postId: postId,
      commentMsg: commentController.text,
    );
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

  void setPostSwitch(bool value) {
    _postSwitch.value = value;
    _postFetchingData = false;
    _postReachedEndOfData = false;
    _postCurrentOffset = 0;
    _posts.value = [];
    if (_postSwitch.value) {
      _fetchPosts();
    } else {
      _fetchAllPosts();
    }
  }

  void setPromotionSwitch(bool value) {
    _promotionSwitch.value = value;
    _promoFetchingData = false;
    _promoReachedEndOfData = false;
    _promoCurrentOffset = 0;
    _promotions.value = [];
    if (_promotionSwitch.value) {
      _fetchPromotions();
    } else {
      _fetchAllPromotions();
    }
  }
}
