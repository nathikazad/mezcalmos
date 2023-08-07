import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServiceFeedPostCard.dart';
import 'package:mezcalmos/CustomerApp/components/ServicePostsList/controllers/CustServicePostsListController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPostsFound.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustServicePostsList extends StatefulWidget {
  const CustServicePostsList(
      {super.key,
      required this.serviceId,
      required this.serviceProviderType,
      required this.serviceDetailsId});
  final int serviceId;
  final int serviceDetailsId;
  final ServiceProviderType serviceProviderType;

  @override
  State<CustServicePostsList> createState() => _CustServicePostsListState();
}

class _CustServicePostsListState extends State<CustServicePostsList>
    with TickerProviderStateMixin {
  CustServicePostsListController viewController =
      CustServicePostsListController();
  @override
  void initState() {
    viewController.init(
        serviceId: widget.serviceId,
        serviceDetailsId: widget.serviceDetailsId,
        type: widget.serviceProviderType,
        vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      meduimSeperator,
      TabBar(
          controller: viewController.feedTabController,
          labelColor: primaryBlueColor,
          onTap: (int value) {
            viewController.feedTabController.animateTo(value);
          },
          unselectedLabelColor: Colors.grey.shade400,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.newspaper),
                  hSmallSepartor,
                  Text("Posts"),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.perm_media),
                  hSmallSepartor,
                  Text("Images")
                ],
              ),
            )
          ]),
      Expanded(
        child: TabBarView(
            controller: viewController.feedTabController,
            children: <Widget>[
              Obx(() => viewController.posts.isEmpty
                  ? NoPostsFound()
                  : SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            viewController.posts.length,
                            (int index) => ServiceFeedPostCard(
                                  post: viewController.posts[index],
                                  showComments: false,
                                  onPostComment:
                                      (int postId, String comment) async {
                                    return await viewController.writeComment(
                                        postId: postId, comment: comment);
                                  },
                                  onLike: (int postId) async {
                                    return viewController.likePost(postId);
                                  },
                                )),
                      ),
                    )),
              GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: viewController.gridImages.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: viewController.gridImages[index].image!);
                  })
            ]),
      )
    ]);
  }
}
