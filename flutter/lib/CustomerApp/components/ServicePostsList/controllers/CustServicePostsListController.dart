import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

class CustServicePostsListController {
  late TabController _feedTabController;
  late int _serviceId;
  // late int _serviceDetailsId;
  late ServiceProviderType _serviceProviderType;
  late String serviceName;
  late String serviceImage;

  int get serviceId => _serviceId;
  //int get serviceDetailsId => _serviceDetailsId;
  ServiceProviderType get serviceProviderType => _serviceProviderType;
  TabController get feedTabController => _feedTabController;
  AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;
  RxList<Post> _posts = RxList.empty();
  List<Post> get posts => _posts.value;

  RxList<int> _subscribers = RxList.empty();
  List<int> get subscribers => _subscribers.value;
  RxBool showOnlyImages = RxBool(false);
  bool get _isSubscribed =>
      _subscribers.contains(_authController.user?.hasuraId);
  bool get isSubscribed => _isSubscribed;

  RxList<Post> _gridImages = RxList.empty();
  List<Post> get gridImages => _gridImages.value;
  RxBool isLoading = RxBool(false);
  List<Post> get filteredPosts => showOnlyImages.isTrue ? _gridImages : _posts;

  // methods
  Future<void> init(
      {required int serviceId,
      required String serviceName,
      required String serviceImage,
      required ServiceProviderType type,
      required TickerProvider vsync}) async {
    _serviceId = serviceId;
    _serviceProviderType = type;
    //  _serviceDetailsId = serviceDetailsId;
    this.serviceName = serviceName;
    this.serviceImage = serviceImage;
    _feedTabController = TabController(length: 2, vsync: vsync);
    isLoading.value = true;

    mezDbgPrint(
        "========👋 init $serviceProviderType id : $serviceId feed==========");

    await Future.wait(
        [_fetchSubscriptions(), _fetchPosts(), _fetchGridImages()]);

    isLoading.value = false;
  }

  Future<void> _fetchPosts() async {
    try {
      _posts.value = await fetch_service_provider_posts(
          imagesOnly: false,
          withCache: false,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    } catch (e) {}
  }

  Future<void> _fetchGridImages() async {
    try {
      _gridImages.value = await fetch_service_provider_posts(
          imagesOnly: true,
          withCache: false,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {}
  }

  Future<bool> writeComment(
      {required int postId, required String comment}) async {
    if (comment.isEmpty) return false;
    mezDbgPrint("Sending comment =======>$comment");
    try {
      int? res = await write_comment(
          userId: _authController.hasuraUserId!,
          postId: postId,
          commentMsg: comment);
      mezDbgPrint("Response =======> $res");
      return res != null;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      return false;
    }
  }

  Future<bool> likePost(
    int postId,
  ) async {
    final Post post = _posts.firstWhere((Post element) => element.id == postId);
    if (post.likes.contains(_authController.user!.hasuraId)) {
      post.likes.remove(_authController.user!.hasuraId);
    } else {
      post.likes.add(_authController.user!.hasuraId);
    }
    _posts.refresh();
    return await update_post_likes(postId: post.id, likes: post.likes);
  }

  Future<void> subscribe() async {
    if (_subscribers.contains(_authController.user?.hasuraId)) {
      await unsubscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    } else {
      await subscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: serviceId,
          serviceProviderType: serviceProviderType);
    }
    await _fetchSubscriptions();
  }

  Future<void> _fetchSubscriptions() async {
    _subscribers.value = await fetch_subscribers(
        serviceProviderId: serviceId,
        serviceProviderType: serviceProviderType,
        withCache: false);
  }

  void dispose() {}

  void switchPostsType(bool value) {
    showOnlyImages.value = value;
  }
}
