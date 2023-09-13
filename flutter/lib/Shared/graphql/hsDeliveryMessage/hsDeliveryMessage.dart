import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hsDeliveryMessage/__generated/delivery_message.graphql.dart';

HasuraDb _db = Get.find<HasuraDb>();
Future<List<DeliveryMessage>> getDvMessages({bool withCache = true}) async {
  final QueryResult<Query$GetDeliveryMessages> res = await _db.graphQLClient
      .query$GetDeliveryMessages(Options$Query$GetDeliveryMessages(
          fetchPolicy: withCache
              ? FetchPolicy.cacheAndNetwork
              : FetchPolicy.networkOnly));
  if (res.hasException) {
    throw res.exception!;
  } else
    return res.parsedData!.delivery_messages
        .map<DeliveryMessage>((Query$GetDeliveryMessages$delivery_messages e) =>
            DeliveryMessage(
                id: e.id,
                entry: e.entry,
                userImage: e.customer?.image,
                userName: e.customer?.name,
                phoneNumber: e.phone_number,
                receivedTime: DateTime.parse(e.received_time),
                userId: e.user_id!))
        .toList();
}
