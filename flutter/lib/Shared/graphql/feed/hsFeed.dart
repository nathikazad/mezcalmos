import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
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
    List<Comment> comments = <Comment>[];
    data.comments.forEach((element) {
      comments.add(
        Comment(
          id: element.id,
          message: element.message,
          likes: //element.likes == null
              // ? List<int>.empty() :
              element.likes.map<int>((e) => int.parse(e.toString())).toList(),
          commentedOn: DateTime.parse(element.commented_on),
          postId: data.id,
          userId: element.user.id,
          userName: element.user.name,
          userImage: element.user.image,
        ),
      );
    });
    posts.add(Post(
      id: data.id,
      serviceProviderId: data.service_provider_id,
      serviceProviderType: serviceProviderType,
      serviceProviderName: serviceProviderName,
      serviceProviderImage: serviceProviderImage,
      message: data.message,
      image: data.image,
      likes: data.likes.map<int>((e) => int.parse(e.toString())).toList(),
      comments: comments,
      postedOn: DateTime.parse(data.posted_on),
      link: data.link,
    ));
  });
  return posts;
}

Future<List<Post>> fetch_service_provider_posts(
    {required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    required bool imagesOnly,
    int? limit,
    int? offset,
    bool withCache = true}) async {
  Variables$Query$fetch_service_provider_posts variables =
      Variables$Query$fetch_service_provider_posts(
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString(),
          limit: limit,
          offset: offset);
  if (imagesOnly) {
    variables = Variables$Query$fetch_service_provider_posts(
        service_provider_id: serviceProviderId,
        service_provider_type: serviceProviderType.toFirebaseFormatString(),
        image: Input$String_comparison_exp.fromJson({"_is_null": false}),
        limit: limit,
        offset: offset);
  }
  QueryResult<Query$fetch_service_provider_posts> res =
      await _db.graphQLClient.query$fetch_service_provider_posts(
    Options$Query$fetch_service_provider_posts(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: variables,
    ),
  );
  mezDbgPrint("👋 called fetch_service_provider_posts ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<Post> posts = [];
  res.parsedData?.service_provider_post.forEach((data) {
    List<Comment> comments = <Comment>[];
    data.comments.forEach((element) {
      comments.add(
        Comment(
          id: element.id,
          message: element.message,
          likes: //element.likes == null
              // ? List<int>.empty() :
              element.likes.map<int>((e) => int.parse(e.toString())).toList(),
          commentedOn: DateTime.parse(element.commented_on),
          postId: data.id,
          userId: element.user.id,
          userName: element.user.name,
          userImage: element.user.image,
        ),
      );
    });
    posts.add(Post(
      id: data.id,
      serviceProviderId: serviceProviderId,
      serviceProviderType: serviceProviderType,
      // serviceProviderName: serviceProviderName,
      // serviceProviderImage: serviceProviderImage,
      message: data.message,
      image: data.image,
      likes: data.likes.map<int>((e) => int.parse(e.toString())).toList(),
      comments: comments,
      postedOn: DateTime.parse(data.posted_on),
      link: data.link,
    ));
  });
  return posts;
}

Future<List<Post>> fetch_posts_within_distance(
    {required cModels.Location fromLocation,
    double distance = 10000,
    int? limit,
    int? offset,
    bool withCache = true}) async {
  QueryResult<Query$fetch_posts_within_distance> res =
      await _db.graphQLClient.query$fetch_posts_within_distance(
    Options$Query$fetch_posts_within_distance(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$fetch_posts_within_distance(
          from: Geography(
              fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
          distance: distance,
          limit: limit,
          offset: offset),
    ),
  );
  mezDbgPrint("👋 called fetch_posts_within_distance ===========>${res.data}");
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
    List<Comment> comments = <Comment>[];
    data.comments.forEach((element) {
      comments.add(
        Comment(
          id: element.id,
          message: element.message,
          likes: //element.likes == null
              // ? List<int>.empty() :
              element.likes.map<int>((e) => int.parse(e.toString())).toList(),
          postId: data.id,
          userId: element.user.id,
          userName: element.user.name,
          userImage: element.user.image,
          commentedOn: DateTime.parse(element.commented_on),
        ),
      );
    });
    posts.add(Post(
      id: data.id,
      serviceProviderId: data.service_provider_id,
      serviceProviderType: serviceProviderType,
      serviceProviderName: serviceProviderName,
      serviceProviderImage: serviceProviderImage,
      message: data.message,
      image: data.image,
      likes: data.likes.map<int>((e) => int.parse(e.toString())).toList(),
      comments: comments,
      postedOn: DateTime.parse(data.posted_on),
      link: data.link,
    ));
  });
  return posts;
}

Future<int?> subscribe_service_provider(
    {required int customerId,
    required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType}) async {
  final QueryResult<Mutation$subscribe_service_provider> res =
      await _db.graphQLClient.mutate$subscribe_service_provider(
    Options$Mutation$subscribe_service_provider(
      variables: Variables$Mutation$subscribe_service_provider(
          customer_id: customerId,
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  if (res.parsedData?.insert_service_provider_subscriber_one == null) {
    throw Exception(
        "🚨 subscribe_service_provider exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.insert_service_provider_subscriber_one?.id;
}

Future<int?> unsubscribe_service_provider(
    {required int customerId,
    required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType}) async {
  final QueryResult<Mutation$unsubscribe_service_provider> res =
      await _db.graphQLClient.mutate$unsubscribe_service_provider(
    Options$Mutation$unsubscribe_service_provider(
      variables: Variables$Mutation$unsubscribe_service_provider(
          customer_id: customerId,
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  if (res.parsedData?.delete_service_provider_subscriber == null) {
    throw Exception(
        "🚨 unsubscribe_service_provider exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.delete_service_provider_subscriber?.affected_rows;
}

Future<int?> write_comment(
    {required int postId,
    required int userId,
    required String commentMsg}) async {
  final QueryResult<Mutation$write_comment> res =
      await _db.graphQLClient.mutate$write_comment(
    Options$Mutation$write_comment(
      variables: Variables$Mutation$write_comment(
          post_id: postId, message: commentMsg, user_id: userId),
    ),
  );
  if (res.parsedData?.insert_service_provider_post_comment_one == null) {
    throw Exception("🚨 write comment exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.insert_service_provider_post_comment_one?.id;
}

Future<int?> like_post({required int postId, required int customerId}) async {
  print('ssssssssssssssss $postId $customerId');
  final QueryResult<Mutation$like_post> res =
      await _db.graphQLClient.mutate$like_post(
    Options$Mutation$like_post(
      variables:
          Variables$Mutation$like_post(id: postId, customer_id: customerId),
    ),
  );
  print('reeeesss ${res.data}');
  if (res.parsedData?.update_service_provider_post_by_pk == null) {
    throw Exception("🚨 like post exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.update_service_provider_post_by_pk?.id;
}

Future<int?> create_post({
  required int serviceProviderId,
  required cModels.ServiceProviderType serviceProviderType,
  required String message,
  String? image,
}) async {
  final QueryResult<Mutation$create_post> res =
      await _db.graphQLClient.mutate$create_post(
    Options$Mutation$create_post(
      variables: Variables$Mutation$create_post(
        service_provider_id: serviceProviderId,
        service_provider_type: serviceProviderType.toFirebaseFormatString(),
        message: message,
        image: image,
      ),
    ),
  );
  if (res.parsedData?.insert_service_provider_post_one == null) {
    throw Exception("🚨 like post exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.insert_service_provider_post_one?.id;
}
