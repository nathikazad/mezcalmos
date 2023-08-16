import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';
import 'package:sizer/sizer.dart';

//
class ServiceFeedPostCard extends StatefulWidget {
  final Post post;
  final Future<bool> Function(int postId) onLike;
  final Future<bool> Function(int postId, String comment) onPostComment;
  final bool showComments;

  const ServiceFeedPostCard(
      {required this.post,
      required this.onLike,
      required this.onPostComment,
      this.showComments = true});

  @override
  _ServiceFeedPostCardState createState() => _ServiceFeedPostCardState();
}

class _ServiceFeedPostCardState extends State<ServiceFeedPostCard> {
  AuthController _authController = Get.find<AuthController>();
  bool _isLiked = false;
  int _likesCount = 0;
  TextEditingController _commentController = TextEditingController();
  bool _isCommenting = false;
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _likesCount = widget.post.likes.length;
    _isLiked = widget.post.likes.contains(_authController.hasuraUserId);
    _comments = widget.post.comments;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.only(top: 5, bottom: 10, right: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                widget.post.serviceProviderImage ?? ''),
                            radius: 25,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.post.serviceProviderName ?? '',
                                  style: context.textTheme.bodyLarge,
                                ),
                                Text(
                                  widget.post.postedOn
                                      .timeAgo(numericDates: false),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        widget.post.message,
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      if (widget.post.image != null) _pstImage(),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: _likeAndCommentsCount()),
                if (widget.showComments)
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: _buildCommentsList()),
              ],
            ),
          ),
          if (widget.showComments) _commentInput(),
        ],
      ),
    );
  }

  Row _likeAndCommentsCount() {
    return Row(
      children: [
        MezIconButton(
          icon: _isLiked ? Icons.favorite : Icons.favorite_border,
          iconColor: _isLiked ? primaryBlueColor : Colors.black,
          padding: const EdgeInsets.all(3),
          iconSize: 20.mezSp,
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: () {
            setState(() {
              _isLiked = !_isLiked;
              _likesCount += _isLiked ? 1 : -1;
            });

            widget.onLike(widget.post.id).then((bool value) {
              setState(() {
                if (!value) {
                  showErrorSnackBar();
                  _isLiked = !_isLiked;
                  _likesCount += _isLiked ? 1 : -1;
                }
              });
            });
          },
        ),
        Text('$_likesCount Likes'),
        hSmallSepartor,
        Icon(Icons.mode_comment_outlined),
        hSmallSepartor,
        Text('${_comments.length} Comments'),
      ],
    );
  }

  Container _pstImage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: widget.post.image!,
        width: double.infinity,
        fit: BoxFit.cover,
        height: 40.h,
        imageBuilder:
            (BuildContext context, ImageProvider<Object> imageProvider) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _commentInput() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage:
                CachedNetworkImageProvider(_authController.user!.image),
          ),
          hSmallSepartor,
          Flexible(
            child: TextField(
              controller: _commentController,
              enabled: !_isCommenting,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                isDense: true,
                contentPadding: EdgeInsets.all(5),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryBlueColor)),
                fillColor: Colors.grey.shade100,
                filled: true,
                suffix: _isCommenting
                    ? LinearProgressIndicator(
                        color: primaryBlueColor,
                      )
                    : MezIconButton(
                        icon: Icons.send,
                        onTap: () {
                          if (_commentController.text.trim().isNotEmpty) {
                            setState(() {
                              _isCommenting = true;
                            });

                            final String newComment = _commentController.text;
                            final List<Comment> tempComments = List.from(
                                _comments); // Create a copy of the comments

                            // Update local state before calling the onPostComment function
                            tempComments.add(Comment(
                              id: 0, // You may generate a unique ID for the new comment
                              message: newComment,
                              likes: [],
                              postId: widget.post.id,
                              userId: _authController.hasuraUserId!,
                              userName: _authController.user!.name,
                              userImage: _authController.user!.image,
                              commentedOn: DateTime.now(),
                            ));

                            _commentController.clear();
                            setState(() {
                              _comments = tempComments;
                            });

                            widget
                                .onPostComment(widget.post.id, newComment)
                                .then((bool value) {
                              setState(() {
                                _isCommenting = false;
                                if (!value) {
                                  showErrorSnackBar();
                                  tempComments.removeLast();
                                  _comments = tempComments;
                                }
                              });
                            });
                          }
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    final List<Comment> commentsToShow = _comments.reversed.take(2).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        for (Comment comment in commentsToShow) _buildComment(comment),
        // if (_comments.length > 3)
        //   TextButton(
        //     onPressed: () {
        //       // Implement logic to load more comments.
        //     },
        //     child: Text('View More'),
        //   ),
      ],
    );
  }

  Widget _buildComment(Comment comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(comment.userImage ?? ''),
              radius: 22,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(comment.userName ?? ''),
                Text(
                  comment.commentedOn?.timeAgo(numericDates: false) ?? '',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        smallSepartor,
        Text(
          comment.message,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
