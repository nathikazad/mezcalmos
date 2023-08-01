import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

class ServiceFeedViewController {
  AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;

  BusinessOpAuthController opAuthController =
      Get.find<BusinessOpAuthController>();

  RxList<Post> _posts = RxList<Post>.empty();
  List<Post> get posts => _posts.value;

  // RxList<XFile> _selectedImages = RxList.empty();
  // List<XFile> get selectedImages => _selectedImages.value;

  Rxn<XFile> _selectedImage = Rxn<XFile>(null);
  XFile? get selectedImage => _selectedImage.value;

  RxString _expireIn = RxString('never');
  String get expireIn => _expireIn.value;

  TextEditingController postDescriptionController = TextEditingController();

  /* SCROLL CONTROLLER */
  ScrollController get scrollController => _scrollController;
  ScrollController _scrollController = ScrollController();
  final int fetchSize = 10;
  int _currentOffset = 0;
  bool _fetchingData = false;
  bool _reachedEndOfData = false;
  /* SCROLL CONTROLLER */

  ServiceFeedViewController.init() {
    _scrollController.onBottomReach(_fetchPosts, sensitivity: 200);
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    if (_fetchingData || _reachedEndOfData) {
      return;
    }
    try {
      _fetchingData = true;
      final List<Post> newData = await fetch_service_provider_posts(
        serviceProviderId: opAuthController.companyId!,
        serviceProviderType: ServiceProviderType.Business,
        offset: _currentOffset,
        limit: fetchSize,
        imagesOnly: false,
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

  Future<void> publish() async {
    // if (postDescriptionController.text.trim().isEmpty &&
    //     _selectedImages.isEmpty) return;

    if (postDescriptionController.text.trim().isEmpty &&
        _selectedImage.value == null) return;

    await create_post(
        message: postDescriptionController.text,
        serviceProviderId: opAuthController.companyId!,
        serviceProviderType: ServiceProviderType.Business);

    postDescriptionController.text = '';

    unawaited(_fetchPosts());
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    // if (_selectedImages.length == 5) return;

    final XFile? _res =
        await imagePicker(picker: ImagePicker(), source: source);

    try {
      if (_res != null) {
        // _selectedImages.add(_res);
        _selectedImage.value = _res;
      }
    } catch (e) {}
  }

  void removeImage(/*int index*/) {
    // _selectedImages.removeAt(index);
    _selectedImage.value = null;
  }

  void onDropDownChange(String? value) {
    if (value != null) _expireIn.value = value;
  }
}
