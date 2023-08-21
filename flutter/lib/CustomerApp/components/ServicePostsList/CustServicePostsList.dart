import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServiceFeedPostCard.dart';
import 'package:mezcalmos/CustomerApp/components/ServicePostsList/controllers/CustServicePostsListController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPostsFound.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';

class CustServicePostsList extends StatefulWidget {
  const CustServicePostsList({
    super.key,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.serviceProviderType,
  });
  final int serviceId;
  final ServiceProviderType serviceProviderType;
  final String serviceName;
  final String serviceImage;

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
        type: widget.serviceProviderType,
        serviceName: widget.serviceName,
        serviceImage: widget.serviceImage,
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
      Obx(
        () => MezCard(
          radius: 17,
          elevation: 0,
          firstAvatarBgImage:
              CachedNetworkImageProvider(viewController.serviceImage),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewController.serviceName,
                style: context.textTheme.bodyLarge,
              ),
              Text('${viewController.subscribers.length} subscribers')
            ],
          ),
          action: MezInkwell(
            label: viewController.isSubscribed ? "Unsubscribe" : "Subscribe",
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            textStyle:
                context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            onClick: () async {
              await viewController.subscribe();
            },
          ),
        ),
      ),

      Obx(() {
        if (viewController.isLoading.isTrue) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else
          return Expanded(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Show only images',
                    style: context.textTheme.bodyLarge?.copyWith(fontSize: 15),
                  ),
                  trailing: Switch(
                    splashRadius: 10,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: primaryBlueColor,
                    value: viewController.showOnlyImages.value,
                    onChanged: (bool value) {
                      viewController.switchPostsType(value);
                    },
                  ),
                ),
                viewController.filteredPosts.isEmpty
                    ? NoPostsFound()
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                                viewController.filteredPosts.length,
                                (int index) => ServiceFeedPostCard(
                                      post: viewController.filteredPosts[index],
                                      showComments: false,
                                      onPostComment:
                                          (int postId, String comment) async {
                                        return await viewController
                                            .writeComment(
                                                postId: postId,
                                                comment: comment);
                                      },
                                      onLike: (int postId) async {
                                        return viewController.likePost(postId);
                                      },
                                    )),
                          ),
                        ),
                      )
              ],
            ),
          );
      }),

      // TabBar(
      //     controller: viewController.feedTabController,
      //     labelColor: primaryBlueColor,
      //     onTap: (int value) {
      //       viewController.feedTabController.animateTo(value);
      //     },
      //     unselectedLabelColor: Colors.grey.shade400,
      //     tabs: [
      //       Tab(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Icon(Icons.newspaper),
      //             hSmallSepartor,
      //             Text("Posts"),
      //           ],
      //         ),
      //       ),
      //       Tab(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Icon(Icons.perm_media),
      //             hSmallSepartor,
      //             Text("Images")
      //           ],
      //         ),
      //       )
      //     ]),
      // Expanded(
      //   child: TabBarView(
      //       controller: viewController.feedTabController,
      //       children: <Widget>[

      //         GridView.builder(
      //             padding: EdgeInsets.zero,
      //             physics: NeverScrollableScrollPhysics(),
      //             shrinkWrap: true,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 3,
      //                 childAspectRatio: 1,
      //                 crossAxisSpacing: 1,
      //                 mainAxisSpacing: 1),
      //             itemCount: viewController.gridImages.length,
      //             itemBuilder: (BuildContext ctx, int index) {
      //               return CachedNetworkImage(
      //                   fit: BoxFit.cover,
      //                   imageUrl: viewController.gridImages[index].image!);
      //             })
      //       ]),
    ]);
  }
}
