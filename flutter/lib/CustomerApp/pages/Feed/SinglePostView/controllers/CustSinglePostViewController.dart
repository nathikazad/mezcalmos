import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

class CustSinglePostViewController {
  AuthController _authController = Get.find<AuthController>();
  TextEditingController commentController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final int fetchSize = 10;
  int _currentOffset = 0;
  RxBool _fetchingData = RxBool(false);
  bool _hasReachedEndOfData = false;
  RxBool isCommenting = RxBool(false);
  RxBool isLiked = RxBool(false);
  RxInt likesCount = RxInt(0);
  late int postId;
  Rxn<Post> _post = Rxn();

  RxList<Comment> comments = RxList.empty();
  final int newCommentId = 191919;
  Post? get post => _post.value;
  bool get hasPost => post != null;

  bool get isFetching => isCommenting.value || _fetchingData.value;
  void init({required int postId}) {
    this.postId = postId;
    _fetchPost(postId);
  }

  Future<void> _fetchPost(int postId) async {
    scrollController.onBottomReach(_fetchComments, sensitivity: 500);
    _post.value = await get_post(postId: postId, withCache: false);
    likesCount.value = post!.likes.length;
    isLiked.value = post!.likes.contains(_authController.hasuraUserId);
    await _fetchComments();
  }

  Future<void> _fetchComments() async {
    if (_fetchingData.value || _hasReachedEndOfData) {
      return;
    }
    try {
      _fetchingData.value = true;

      final List<Comment> newList = await get_post_comments(
          postId: postId,
          limit: fetchSize,
          offset: _currentOffset,
          withCache: false);
      comments.value += newList;
      if (newList.length == 0) {
        _hasReachedEndOfData = true;
        comments.removeWhere((Comment element) => element.id == newCommentId);
      }
      _currentOffset += fetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _fetchingData.value = false;

      comments.refresh();
    }
  }

  void postComment() {
    if (commentController.text.trim().isNotEmpty) {
      isCommenting.value = true;

      final String newComment = commentController.text;
      final List<Comment> tempComments =
          List.from(comments); // Create a copy of the comments

      // Update local state before calling the onPostComment function

      tempComments.add(Comment(
        id: newCommentId, // You may generate a unique ID for the new comment
        message: newComment,
        likes: [],
        postId: post!.id,
        userId: _authController.hasuraUserId!,
        userName: _authController.user!.name,
        userImage: _authController.user!.image,
        commentedOn: DateTime.now(),
      ));

      commentController.clear();

      comments.value = tempComments;

      _writeComment(comment: newComment).then((bool value) {
        isCommenting.value = false;
        if (value) {
          _fetchComments().then((value) {
            //  if (_hasReachedEndOfData) {
            _scrollToBottom();
            // }
          });
        } else
          showErrorSnackBar();

        // if (!value) {
        //   tempComments.removeLast();
        //   comments.value = tempComments;
        //   showErrorSnackBar();
        // } else {
        //   post?.numberOfComments++;
        //   _post.refresh();
        // }
      });
    }
  }

  void _scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1), // You can adjust the duration as needed
      curve: Curves.easeInOut, // You can adjust the easing curve as needed
    );
  }

  Future<bool> _writeComment({required String comment}) async {
    if (comment.isEmpty) return false;
    mezDbgPrint("Sending comment =======>$comment");
    try {
      int? res = await write_comment(
          userId: _authController.hasuraUserId!,
          postId: post!.id,
          commentMsg: comment);
      mezDbgPrint("Response =======> $res");
      return res != null;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      return false;
    }
  }

  void handleLikePost() {
    isLiked.value = !isLiked.value;
    likesCount += isLiked.value ? 1 : -1;

    _likePost(post!.id).then((bool value) {
      if (!value) {
        showErrorSnackBar();
        isLiked.value = !isLiked.value;
        likesCount += isLiked.value ? 1 : -1;
      }
    });
  }

  Future<bool> _likePost(
    int postId,
  ) async {
    if (post!.likes.contains(_authController.user!.hasuraId)) {
      post!.likes.remove(_authController.user!.hasuraId);
    } else {
      post!.likes.add(_authController.user!.hasuraId);
    }

    return await update_post_likes(postId: post!.id, likes: post!.likes);
  }
}
