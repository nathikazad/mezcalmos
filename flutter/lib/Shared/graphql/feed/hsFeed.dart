import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/feed/__generated/feed.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<Post>> fetch_subscribed_posts(
    {required int customerId,
    int? limit,
    int? offset,
    bool withCache = true}) async {
  QueryResult<Query$fetch_subscribed_posts> res =
      await _db.graphQLClient.query$fetch_subscribed_posts(
    Options$Query$fetch_subscribed_posts(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$fetch_subscribed_posts(
          customer_id: customerId, limit: limit, offset: offset),
    ),
  );
  mezDbgPrint("👋 called fetch_subscribed_posts ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<Post> posts = [];
  res.parsedData?.service_provider_post.forEach((data) {
    cModels.ServiceProviderType serviceProviderType =
        data.service_provider_type.toServiceProviderType();
    String? serviceProviderName;
    String? serviceProviderImage;
    switch (serviceProviderType) {
      case cModels.ServiceProviderType.Restaurant:
        serviceProviderName = data.restaurant?.details?.name;
        serviceProviderImage = data.restaurant?.details?.image;
        break;
      case cModels.ServiceProviderType.Laundry:
        serviceProviderName = data.laundry?.details?.name;
        serviceProviderImage = data.laundry?.details?.image;
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        serviceProviderName = data.delivery_company?.details?.name;
        serviceProviderImage = data.delivery_company?.details?.image;
        break;
      case cModels.ServiceProviderType.Business:
        serviceProviderName = data.business?.details.name;
        serviceProviderImage = data.business?.details.image;
        break;
    }
    posts.add(Post(
      id: data.id,
      serviceProviderId: data.service_provider_id,
      serviceProviderType: serviceProviderType,
      serviceProviderName: serviceProviderName,
      serviceProviderImage: serviceProviderImage,
      message: data.message,
      image: data.image,
      likes: data.likes,
      comments: data.comments.map((e) => commentFromJson(e)).toList(),
      postedOn: DateTime.parse(data.posted_on),
      link: data.link,
    ));
  });
  return posts;
}

Future<int?> write_comment(
    {required int postId, required String comment}) async {
  final QueryResult<Mutation$write_comment> res =
      await _db.graphQLClient.mutate$write_comment(
    Options$Mutation$write_comment(
      variables: Variables$Mutation$write_comment(id: postId, comments: {
        "message": comment,
        "commentTime": DateTime.now().toUtc().toIso8601String(),
      }),
    ),
  );
  if (res.parsedData?.update_service_provider_post_by_pk == null) {
    throw Exception("🚨 insert review exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.update_service_provider_post_by_pk?.id;
}
