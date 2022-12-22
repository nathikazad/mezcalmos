import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOperator.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_operator/__generated/delivery_operator.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

final HasuraDb _hasuraDb = Get.find<HasuraDb>();
Future<DeliveryOperator?> get_delivery_operator({required int userId}) async {
  DeliveryOperator? _operator;

  QueryResult<Query$get_delivery_operator_by_id> _res =
      await _hasuraDb.graphQLClient.query$get_delivery_operator_by_id(
    Options$Query$get_delivery_operator_by_id(
      variables: Variables$Query$get_delivery_operator_by_id(
        user_id: userId,
      ),
    ),
  );

  if (_res.hasException) {
    mezDbgPrint(
        "[+] Called :: get_delivery_operator :: EXCEPTION :: ${_res.exception}");
  } else {
    mezDbgPrint(
      "[+] Called :: get_delivery_operator :: SUCCESS",
    );
    Query$get_delivery_operator_by_id$delivery_operator_by_pk? _op =
        _res.parsedData?.delivery_operator_by_pk;

    if (_op != null) {
      _operator = DeliveryOperator(
        _op.id,
        _op.delivery_company_id,
        _op.app_version,
        _op.current_gps.toLocationData(),
        _op.delivery_driver_type,
        _op.notification_token,
        _op.owner,
        _op.status,
      );
    } else {
      mezDbgPrint(
        "[+] Called :: get_delivery_operator :: OPERATOR NOT FOUND!",
      );
    }
  }
  return _operator;
}

Stream<DeliveryOperator?> listen_on_delivery_operator({required int userId}) {
  return _hasuraDb.graphQLClient
      .subscribe$get_delivery_operator_by_id(
    Options$Subscription$get_delivery_operator_by_id(
      fetchPolicy: FetchPolicy.noCache,
      variables:
          Variables$Subscription$get_delivery_operator_by_id(user_id: userId),
    ),
  )
      .map<DeliveryOperator?>(
          (QueryResult<Subscription$get_delivery_operator_by_id> _res) {
    DeliveryOperator? _operator;

    if (_res.hasException) {
      mezDbgPrint(
          "[+] Called :: listen_on_delivery_operator :: EXCEPTION :: ${_res.exception}");
    } else {
      mezDbgPrint(
        "[+] Called :: listen_on_delivery_operator :: SUCCESS",
      );
      Subscription$get_delivery_operator_by_id$delivery_operator_by_pk? _op =
          _res.parsedData?.delivery_operator_by_pk;

      if (_op != null) {
        _operator = DeliveryOperator(
          _op.id,
          _op.delivery_company_id,
          _op.app_version,
          _op.current_gps.toLocationData(),
          _op.delivery_driver_type,
          _op.notification_token,
          _op.owner,
          _op.status,
        );
      } else {
        mezDbgPrint(
          "[+] Called :: listen_on_delivery_operator :: OPERATOR NOT FOUND!",
        );
      }
    }
    return _operator;
  });
}
