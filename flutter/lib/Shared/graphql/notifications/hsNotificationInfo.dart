import 'package:get/instance_manager.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/notifications/__generated/notification_info.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<void> insert_notif_info(
    {required int userId,
    required String token,
    required String appType}) async {
  final QueryResult<Mutation$insertNotifInfo> res = await _db.graphQLClient
      .mutate$insertNotifInfo(Options$Mutation$insertNotifInfo(
          variables: Variables$Mutation$insertNotifInfo(
              notifData: Input$notification_info_insert_input(
    user_id: userId,
    token: token,
    app_type_id: appType,
  ))));
  if (res.parsedData?.insert_notification_info_one == null) {
    throw Exception("🚨 insert notif token failed =>${res.exception}");
  }
}

Future<void> update_notif_info(
    {required NotificationInfo notificationInfo}) async {
  final QueryResult<Mutation$updateNotifInfo> res = await _db.graphQLClient
      .mutate$updateNotifInfo(Options$Mutation$updateNotifInfo(
          variables: Variables$Mutation$updateNotifInfo(
              notifData: Input$notification_info_set_input(
                token: notificationInfo.token,
              ),
              id: notificationInfo.id!)));
  if (res.parsedData?.update_notification_info_by_pk == null) {
    throw Exception(
        "🚨 update notif token ${notificationInfo.id} failed =>${res.parsedData?.toJson()}");
  }
}

Future<NotificationInfo?> get_notif_info({required int userId}) async {
  final QueryResult<Query$getNotifInfoByUserId> res = await _db.graphQLClient
      .query$getNotifInfoByUserId(Options$Query$getNotifInfoByUserId(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getNotifInfoByUserId(userId: userId)));
  if (res.parsedData?.notification_info == null) {
    throw Exception("🚨 insert notif token failed =>${res.exception}");
  }
  mezDbgPrint(
      "😉 Get notif token ===>\n ${res.parsedData!.notification_info.length}");
  final List<Query$getNotifInfoByUserId$notification_info> data =
      res.parsedData!.notification_info;
  if (data.isNotEmpty) {
    return NotificationInfo(
        userId: data.first.user_id,
        appType: data.first.app_type_id,
        token: data.first.token,
        turnOffNotifications: data.first.turn_off_notifications,
        id: data.first.id);
  }
  return null;
}
