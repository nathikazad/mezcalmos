import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/controllers/cusBusinessViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustBusinessView']['components']['BusinessFeedCardPost'];

class BusinessFeedCardPost extends StatelessWidget {
  final Post post;
  final double elevation;
  final CustBusinessViewController controller;
  final Business business;
  final EdgeInsetsGeometry margin;
  BusinessFeedCardPost(
      {super.key,
      required this.post,
      required this.controller,
      required this.business,
      this.elevation = .5,
      this.margin = const EdgeInsets.only(top: 12.5, left: 12.5, right: 12.5)});

  final TextEditingController _commentController = TextEditingController();

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
                business.details.image,
              ),
            ),
            title: Text('${business.details.name}'),
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
                    controller.likePost(post.id);
                  },
                  child: Icon(
                      post.likes.contains(
                              controller.authController.user?.hasuraId)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 25,
                      color: post.likes.contains(
                              controller.authController.user?.hasuraId)
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
                  controller.authController.user!.image),
            ),
            title: TextField(
              controller: _commentController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: '${_i18n()['writecomment']}',
                  suffix: GestureDetector(
                    onTap: () => controller.writeComment(
                        postId: post.id, commentController: _commentController),
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
