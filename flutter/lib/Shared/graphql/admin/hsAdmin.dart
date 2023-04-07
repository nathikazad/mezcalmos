import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/__generated/admin.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

final GraphQLClient _graphClient = Get.find<HasuraDb>().graphQLClient;

Future<MezAdmin?> get_admin({required int user_id}) async {
  final QueryResult<Query$get_admin_info> result =
      await _graphClient.query$get_admin_info(
    Options$Query$get_admin_info(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_admin_info(admin_id: user_id),
    ),
  );
  if (result.parsedData?.mez_admin == null) {
    throwError(result.exception);
  }

  final List<Query$get_admin_info$mez_admin>? _admin =
      result.parsedData?.mez_admin;

  if (_admin != null && _admin.isNotEmpty) {
    mezDbgPrint(
        "[tt] Called :: get_admin :: SUCCESS :: got_admin(${_admin[0].user?.name})");

    return MezAdmin(
        appVersion: _admin[0].version,
        notificationInfo: _admin[0].notification_info != null
            ? NotificationInfo(
                token: _admin[0].notification_info!.token,
                turnOffNotifications:
                    _admin[0].notification_info!.turn_off_notifications)
            : null);
  } else {
    mezDbgPrint("[tt] No such admin :: id($user_id)");
  }
  return null;
}

Future set_service_status({required String status, required int id}) async {
  final QueryResult<Mutation$set_service_status> _res =
      await _graphClient.mutate$set_service_status(
    Options$Mutation$set_service_status(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$set_service_status(id: id, status: status),
    ),
  );

  if (_res.hasException) {
    mezDbgPrint(
        "[tt] Called :: set_service_status :: exception :: ${_res.exception}");
  } else {
    mezDbgPrint("[tt] Called :: set_service_status :: SUCCESS!");
  }
}
