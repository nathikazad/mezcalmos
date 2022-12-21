import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Admin.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/__generated/admin.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

final GraphQLClient _graphClient = Get.find<HasuraDb>().graphQLClient;

Future<Admin?> get_admin({required int user_id}) async {
  QueryResult<Query$get_admin_info> admin_info =
      await _graphClient.query$get_admin_info(
    Options$Query$get_admin_info(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_admin_info(admin_id: user_id),
    ),
  );

  if (admin_info.hasException) {
    mezDbgPrint(
        "[tt] Called :: get_customer_info :: exception :: ${admin_info.exception}");
  }

  final List<Query$get_admin_info$mez_admin>? _admin =
      admin_info.parsedData?.mez_admin;

  if (_admin != null && _admin.isNotEmpty) {
    mezDbgPrint(
        "[tt] Called :: get_customer_info :: SUCCESS :: got_customer(${_admin[0].user?.name})");

    return Admin(
      appVersion: _admin[0].version,
      notificationInfo: _admin[0].notification_token,
    );
  } else {
    mezDbgPrint("[tt] No such customer exists :: id($user_id)");
  }
  return null;
}
