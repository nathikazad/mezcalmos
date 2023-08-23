import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Feed/SinglePostView/controllers/CustSinglePostViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';

class CustSinglePostView extends StatefulWidget {
  const CustSinglePostView({super.key});

  static Future<void> navigate({required int postId}) async {
    final String route =
        CustomerRoutes.kSinglePostRoute.replaceFirst(":id", "$postId");
    await MezRouter.toPath(route);
  }

  @override
  State<CustSinglePostView> createState() => _CustSinglePostViewState();
}

class _CustSinglePostViewState extends State<CustSinglePostView> {
  CustSinglePostViewController viewController = CustSinglePostViewController();
  @override
  void initState() {
    int? id = MezRouter.urlArguments["id"]?.asInt;
    if (id != null) {
      viewController.init(postId: id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Obx(
          () => Column(
            children: [
              if (viewController.isFetching || !viewController.hasPost)
                LinearProgressIndicator(),
              if (viewController.hasPost) ...[
                Expanded(child: _buidPostContent()),
                _commentInput()
              ]
            ],
          ),
        ));
  }

  AppBar _appBar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        titleWidget: Obx(() => Text.rich(TextSpan(children: [
              if (viewController.hasPost &&
                  viewController.post!.serviceProviderImage != null)
                WidgetSpan(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: CachedNetworkImageProvider(
                        viewController.post!.serviceProviderImage!),
                  ),
                ),
              WidgetSpan(child: hTinySepartor),
              TextSpan(
                  text: viewController.post?.serviceProviderName ??
                      "Getting post...",
                  style: context.textTheme.bodyLarge),
            ]))));
  }

  SingleChildScrollView _buidPostContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      controller: viewController.scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewController.post!.message,
            style: context.textTheme.bodyLarge,
          ),
          if (viewController.post!.image != null) _pstImage(),
          Text(
            viewController.post!.postedOn.timeAgo(numericDates: false),
            style: TextStyle(color: Colors.grey),
          ),
          Obx(() => _likeAndCommentsCount()),
          _buildCommentsList()
        ],
      ),
    );
  }

  Row _likeAndCommentsCount() {
    return Row(
      children: [
        MezIconButton(
          icon: viewController.isLiked.value
              ? Icons.favorite
              : Icons.favorite_border,
          iconColor:
              viewController.isLiked.value ? primaryBlueColor : Colors.black,
          padding: const EdgeInsets.all(3),
          iconSize: 20.mezSp,
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: () {
            viewController.handleLikePost();
          },
        ),
        Text('${viewController.likesCount} Likes'),
        hSmallSepartor,
        Icon(Icons.mode_comment_outlined),
        hSmallSepartor,
        Text('${viewController.post!.numberOfComments} Comments'),
      ],
    );
  }

  Container _pstImage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: viewController.post!.image!,
        width: double.infinity,
        fit: BoxFit.cover,
        height: 40.mezW,
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
            backgroundImage: CachedNetworkImageProvider(
                Get.find<AuthController>().user!.image),
          ),
          hSmallSepartor,
          Obx(
            () => Flexible(
              child: TextField(
                controller: viewController.commentController,
                enabled: !viewController.isCommenting.value,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  focusedBorder: InputBorder.none,
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  suffix: viewController.isCommenting.value
                      ? LinearProgressIndicator(
                          color: primaryBlueColor,
                        )
                      : MezIconButton(
                          icon: Icons.send,
                          onTap: viewController.postComment,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          for (Comment comment in viewController.comments)
            _buildComment(comment),
          // if (_comments.length > 3)
          //   TextButton(
          //     onPressed: () {
          //       // Implement logic to load more comments.
          //     },
          //     child: Text('View More'),
          //   ),
        ],
      ),
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
