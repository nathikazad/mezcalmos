import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustBusinessView']['components']['BusinessFeedCardPost'];

class ServiceFeedPostCard extends StatelessWidget {
  final Post post;
  final double elevation;

  final EdgeInsetsGeometry margin;
  final Future<void> Function(int postId) onLikePost;
  final Future<void> Function(int postId, String comment) onCommentPost;
  final bool showComments;

  ServiceFeedPostCard({
    Key? key,
    required this.post,
    required this.onLikePost,
    required this.onCommentPost,
    this.showComments = true,
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
            leading: post.serviceProviderImage != null
                ? CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      post.serviceProviderImage!,
                    ),
                  )
                : null,
            title: Text('${post.serviceProviderName}'),
            titleTextStyle: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
            subtitleTextStyle:
                context.textTheme.bodyMedium?.copyWith(fontSize: 9.mezSp),
            subtitle: Text(post.postedOn.timeAgo()),
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
                    onLikePost(post.id);
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
          Divider(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      Get.find<AuthController>().user!.image),
                ),
                hMeduimSeperator,
                Flexible(
                  child: TextField(
                    controller: _commentController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: '${_i18n()['writecomment']}',
                        suffix: MezIconButton(
                          onTap: () async {
                            onCommentPost(post.id, _commentController.text);
                          },
                          icon: Icons.send,
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
                )
              ],
            ),
          ),
          if (showComments && post.comments.isNotEmpty) ...[
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Column(
                children: List.generate(
                    post.comments.length > 2 ? 2 : post.comments.length,
                    (int index) {
                  return _commentCard(
                      comment: post.comments[index], context: context);
                }),
              ),
            ),
          ],
          if (post.comments.isEmpty) meduimSeperator
        ],
      ),
    );
  }
}

Widget _commentCard({required Comment comment, required BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    child: Card(
      color: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: comment.userImage != null
                      ? CachedNetworkImageProvider(comment.userImage!)
                      : AssetImage(aDefaultDbUserImgAsset) as ImageProvider,
                ),
                hSmallSepartor,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.userName ?? "",
                      style: context.textTheme.bodyLarge,
                    ),
                    if (comment.commentedOn != null)
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.watch_later_outlined,
                              size: 12.mezSp,
                              color: offShadeGreyColor,
                            )),
                            WidgetSpan(
                                child: SizedBox(
                              width: 3,
                            )),
                            TextSpan(
                              text: comment.commentedOn!.timeAgo(),
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(fontSize: 9.mezSp),
                            ),
                          ]))),
                  ],
                ),
              ],
            ),
            Container(
              // width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: Text(
                comment.message,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
