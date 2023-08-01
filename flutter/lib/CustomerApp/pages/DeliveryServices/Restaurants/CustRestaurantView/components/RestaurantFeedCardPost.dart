import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustBusinessView']['components']['BusinessFeedCardPost'];

class ServiceFeedPostCard extends StatelessWidget {
  final Post post;
  final double elevation;
  final String serviceName;
  final String serviceImage;

  final EdgeInsetsGeometry margin;
  final void Function(Post) onLikePost;
  final void Function(Post, String) onCommentPost;

  ServiceFeedPostCard({
    Key? key,
    required this.post,
    required this.serviceName,
    required this.serviceImage,
    required this.onLikePost,
    required this.onCommentPost,
    this.elevation = .5,
    this.margin = const EdgeInsets.only(top: 12.5, left: 12.5, right: 12.5),
  });

  final TextEditingController _commentController = TextEditingController();
  int? get hasuraUserId => Get.find<AuthController>().hasuraUserId;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                serviceImage,
              ),
            ),
            title: Text('$serviceName'),
            titleTextStyle: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
            subtitleTextStyle:
                context.textTheme.bodyMedium?.copyWith(fontSize: 10),
            subtitle: Text('Now'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(post.message,
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15)),
          ),
          smallSepartor,
          if (post.image != null)
            Column(
              children: <Widget>[
                smallSepartor,
                CachedNetworkImage(
                  imageUrl: post.image!,
                  width: double.infinity,
                ),
              ],
            ),
          smallSepartor,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onLikePost(post);
                  },
                  child: Icon(
                      post.likes.contains(hasuraUserId)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 25,
                      color: post.likes.contains(hasuraUserId)
                          ? primaryBlueColor
                          : null),
                ),
                hSmallSepartor,
                Text('${post.likes.length} ${_i18n()['like']}',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 10)),
                hBigSeperator,
                Icon(
                  Icons.messenger_outline,
                  size: 22.5,
                ),
                hSmallSepartor,
                Text('${post.comments.length} ${_i18n()['comment']}',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 10)),
              ],
            ),
          ),
          smallSepartor,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          smallSepartor,
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  Get.find<AuthController>().user!.image),
            ),
            title: TextField(
              controller: _commentController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: '${_i18n()['writecomment']}',
                  suffix: GestureDetector(
                    onTap: () => onCommentPost(post, _commentController.text),
                    child: Text('${_i18n()['post']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryBlueColor)),
                  ),
                  hintStyle: TextStyle(fontSize: 16),
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(75),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
            ),
          ),
          smallSepartor
        ],
      ),
    );
  }
}
