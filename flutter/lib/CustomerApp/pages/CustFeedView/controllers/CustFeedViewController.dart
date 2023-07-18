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

  RxList<Post> _posts = RxList.empty();
  List<Post> get posts => _posts.value;

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

  Future<void> writeComment(
      {required int postId,
      required TextEditingController commentController}) async {
    if (commentController.text.isEmpty) return;

    commentController.text = '';
    await write_comment(postId: postId, comment: commentController.text);
  }
}
