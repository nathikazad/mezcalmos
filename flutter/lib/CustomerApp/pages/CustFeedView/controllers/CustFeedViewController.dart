import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

class CustFeedViewController {
  AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;

  RxList<Post> _posts = RxList<Post>.empty();
  List<Post> get posts => _posts.value;

  RxList<dynamic> _promotions = RxList(['', '', '']);
  List<dynamic> get promotions => _promotions.value;

  RxBool _postSwitch = false.obs;
  bool get postSwitch => _postSwitch.value;

  RxBool _promotionSwitch = false.obs;
  bool get promotionSwitch => _promotionSwitch.value;

  /* SCROLL CONTROLLER */
  ScrollController get scrollController => _scrollController;
  ScrollController _scrollController = ScrollController();
  final int fetchSize = 10;
  int _currentOffset = 0;
  bool _fetchingData = false;
  bool _reachedEndOfData = false;
  /* SCROLL CONTROLLER */

  CustFeedViewController.init() {
    _scrollController.onBottomReach(_fetchPosts, sensitivity: 200);
    _fetchPosts();
    _fetchPromotions();
    print(_authController.hasuraUserId);
  }

  Future<void> _fetchPosts() async {
    if (_fetchingData || _reachedEndOfData) {
      return;
    }
    try {
      _fetchingData = true;
      final List<Post> newData = await fetch_subscribed_posts(
        offset: _currentOffset,
        limit: fetchSize,
        customerId: _authController.hasuraUserId!,
      );
      print(newData.length);
      _posts.value += newData;
      if (newData.length == 0) {
        _reachedEndOfData = true;
      }
      _currentOffset += fetchSize;
    } finally {
      _fetchingData = false;
    }

    _posts.refresh();
  }

  Future<void> _fetchPromotions() async {}

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

  void setPostSwitch(bool value) {
    _postSwitch.value = value;
    //fetch
  }

  void setPromotionSwitch(bool value) {
    _promotionSwitch.value = value;
    //fetch
  }
}
