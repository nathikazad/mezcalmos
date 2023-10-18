import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hsDeliveryMessage/__generated/delivery_message.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryMessage.dart';

HasuraDb _db = Get.find<HasuraDb>();
Future<List<DeliveryMessage>> getDvOpenMessages({bool withCache = true}) async {
  final QueryResult<Query$GetOpenDeliveryMessages> res = await _db.graphQLClient
      .query$GetOpenDeliveryMessages(Options$Query$GetOpenDeliveryMessages(
          fetchPolicy: withCache
              ? FetchPolicy.cacheAndNetwork
              : FetchPolicy.networkOnly));

  if (res.hasException) {
    throw res.exception!;
  } else
    return res.parsedData!.delivery_open_delivery_messages
        .map<DeliveryMessage>(
            (Query$GetOpenDeliveryMessages$delivery_open_delivery_messages e) =>
                DeliveryMessage(
                    id: e.id!,
                    entry: DvMessageEntry.fromJson(e.entry),
                    userImage: e.customer?.image,
                    userName: e.customer?.name,
                    phoneNumber: e.phone_number!,
                    driverId: e.driver_id,
                    respondedTime:
                        DateTime.tryParse(e.responded_time.toString()),
                    finishedTime: DateTime.tryParse(e.finished_time.toString()),
                    receivedTime: DateTime.parse(e.received_time!)))
        .toList();
}

Stream<List<DeliveryMessage>?> listenDvOpenMessages() {
  return _db.graphQLClient
      .subscribe$ListenOpenDeliveryMessages(
          Options$Subscription$ListenOpenDeliveryMessages(
    fetchPolicy: FetchPolicy.noCache,
  ))
      .map<List<DeliveryMessage>?>(
          (QueryResult<Subscription$ListenOpenDeliveryMessages> event) {
    if (event.hasException) {
      throwError(event.exception);
    }
    return event.parsedData?.delivery_open_delivery_messages
        .map(
            (Subscription$ListenOpenDeliveryMessages$delivery_open_delivery_messages
                    e) =>
                DeliveryMessage(
                    id: e.id!,
                    entry: DvMessageEntry.fromJson(e.entry),
                    userImage: e.customer?.image,
                    userName: e.customer?.name,
                    phoneNumber: e.phone_number!,
                    driverId: e.driver_id,
                    respondedTime:
                        DateTime.tryParse(e.responded_time.toString()),
                    finishedTime: DateTime.tryParse(e.finished_time.toString()),
                    receivedTime: DateTime.parse(e.received_time!)))
        .toList();
  });
}

Stream<List<DeliveryMessage>?> listenDvCurrentMessages(
    {required int driverId}) {
  return _db.graphQLClient
      .subscribe$listenCurrentDeliveryMessages(
          Options$Subscription$listenCurrentDeliveryMessages(
              fetchPolicy: FetchPolicy.noCache,
              variables: Variables$Subscription$listenCurrentDeliveryMessages(
                  driver_id: driverId)))
      .map<List<DeliveryMessage>?>(
          (QueryResult<Subscription$listenCurrentDeliveryMessages> event) {
    if (event.hasException) {
      throwError(event.exception);
    }

    return event.parsedData?.delivery_messages
        .map((Fragment$deliveryMessageWithDriver e) => DeliveryMessage(
            id: e.id,
            entry: DvMessageEntry.fromJson(e.entry),
            userImage: e.customer?.image,
            userName: e.customer?.name,
            phoneNumber: e.phone_number,
            driverId: e.driver_id,
            //    showDriverInfo: e.show_driver_info,
            driverName: e.driver?.user.name,
            driverPhone: e.driver?.user.phone,
            respondedTime: DateTime.tryParse(e.responded_time.toString()),
            finishedTime: DateTime.tryParse(e.finished_time.toString()),
            receivedTime: DateTime.parse(e.received_time)))
        .toList();
  });
}

Future<List<DeliveryMessage>> getDvCurrentMessages(
    {required int driverId, bool withCache = true}) async {
  final QueryResult<Query$GetCurrentDeliveryMessages> res =
      await _db.graphQLClient.query$GetCurrentDeliveryMessages(
          Options$Query$GetCurrentDeliveryMessages(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$GetCurrentDeliveryMessages(
                  driver_id: driverId)));
  mezDbgPrint("🔴 DATA ============>${res.data}");
  if (res.hasException) {
    throw res.exception!;
  } else
    return res.parsedData!.delivery_messages
        .map<DeliveryMessage>(
            (Fragment$deliveryMessageFields e) => DeliveryMessage(
                id: e.id,
                entry: DvMessageEntry.fromJson(e.entry),
                userImage: e.customer?.image,
                userName: e.customer?.name,
                phoneNumber: e.phone_number,
                driverId: e.driver_id,
                //  showDriverInfo: e.show_driver_info,
                respondedTime: DateTime.tryParse(e.responded_time.toString()),
                finishedTime: DateTime.tryParse(e.finished_time.toString()),
                receivedTime: DateTime.parse(e.received_time)))
        .toList();
}

Future<List<DeliveryMessage>> getDvPastMessages(
    {required int offset,
    required int limit,
    required int driverId,
    bool withCache = true}) async {
  final QueryResult<Query$GetPastDeliveryMessages> res = await _db.graphQLClient
      .query$GetPastDeliveryMessages(Options$Query$GetPastDeliveryMessages(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$GetPastDeliveryMessages(
              driver_id: driverId, limit: limit, offset: offset)));
  mezDbgPrint("🔴 DATA ============>${res.data}");
  if (res.hasException) {
    throw res.exception!;
  } else
    return res.parsedData!.delivery_messages
        .map<DeliveryMessage>(
            (Fragment$deliveryMessageFields e) => DeliveryMessage(
                id: e.id,
                entry: DvMessageEntry.fromJson(e.entry),
                userImage: e.customer?.image,
                userName: e.customer?.name,
                phoneNumber: e.phone_number,
                driverId: e.driver_id,
                //   showDriverInfo: e.show_driver_info,
                respondedTime: DateTime.tryParse(e.responded_time.toString()),
                finishedTime: DateTime.tryParse(e.finished_time.toString()),
                receivedTime: DateTime.parse(e.received_time)))
        .toList();
}

Future<List<DeliveryMessage>> getCustomerDvMessages(
    {required String phoneNumber, bool withCache = true}) async {
  final QueryResult<Query$GetCustomerDeliveryMessages> res =
      await _db.graphQLClient.query$GetCustomerDeliveryMessages(
          Options$Query$GetCustomerDeliveryMessages(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$GetCustomerDeliveryMessages(
                  phone_number: phoneNumber)));
  if (res.hasException) {
    throw res.exception!;
  } else
    return res.parsedData!.delivery_messages
        .map<DeliveryMessage>(
            (Fragment$deliveryMessageWithDriver e) => DeliveryMessage(
                id: e.id,
                entry: DvMessageEntry.fromJson(e.entry),
                userImage: e.customer?.image,
                userName: e.customer?.name,
                phoneNumber: e.phone_number,
                driverId: e.driver_id,
                driverName: e.driver?.user.name,
                driverPhone: e.driver?.user.phone,
                //  showDriverInfo: e.show_driver_info,
                respondedTime: DateTime.tryParse(e.responded_time.toString()),
                finishedTime: DateTime.tryParse(e.finished_time.toString()),
                receivedTime: DateTime.parse(e.received_time)))
        .toList();
}

// Stream<List<DeliveryMessage>?> listenCustomerNewDvMessages(
//     {required String phoneNumber}) {
//   return _db.graphQLClient
//       .subscribe$listenOnNewCustomerDeliveryMessages(
//           Options$Subscription$listenOnNewCustomerDeliveryMessages(
//               fetchPolicy: FetchPolicy.noCache,
//               variables:
//                   Variables$Subscription$listenOnNewCustomerDeliveryMessages(
//                       phone_number: phoneNumber)))
//       .map<List<DeliveryMessage>?>(
//           (QueryResult<Subscription$listenOnNewCustomerDeliveryMessages>
//               event) {
//     if (event.hasException) {
//       throwError(event.exception);
//     }
//     return event.parsedData?.delivery_messages
//         .map((Subscription$listenOnNewCustomerDeliveryMessages$delivery_messages
//                 e) =>
//             DeliveryMessage(
//                 id: e.id,
//                 entry: DvMessageEntry.fromJson(e.entry),
//                 userImage: e.customer?.image,
//                 userName: e.customer?.name,
//                 phoneNumber: e.phone_number,
//                 driverId: e.driver_id,
//                 respondedTime: DateTime.tryParse(e.responded_time.toString()),
//                 finishedTime: DateTime.tryParse(e.finished_time.toString()),
//                 receivedTime: DateTime.parse(e.received_time),
//                 userId: e.user_id))
//         .toList();
//   });
// }
