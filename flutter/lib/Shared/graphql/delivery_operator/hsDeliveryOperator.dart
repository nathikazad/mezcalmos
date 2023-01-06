import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOperator.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_operator/__generated/delivery_operator.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
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
      "[+] Called :: get_delivery_operator :: SUCCESS :: USER($userId)",
    );
    final List<Query$get_delivery_operator_by_id$delivery_operator>? _op =
        _res.parsedData?.delivery_operator;

    if (_op != null && _op.isNotEmpty) {
      mezDbgPrint("[///get op.first //] ${_op.first.delivery_driver_type}");
      _operator = DeliveryOperator(
        companyName: _op.first.delivery_company.name,
        companyImg: _op.first.delivery_company.image,
        id: _op.first.id,
        companyId: _op.first.delivery_company_id,
        appVersion: _op.first.app_version,
        currentGps: _op.first.current_gps.toLocationData(),
        type: _op.first.delivery_driver_type.toDeliveryProviderType(),
        notificationToken: _op.first.notification_token,
        isOwner: _op.first.owner,
        status: _op.first.status,
      );
    } else {
      mezDbgPrint(
        "[+] Called :: get_delivery_operator :: OPERATOR NOT FOUND :: ${_res.data}!",
      );
    }
  }
  return _operator;
}

Future<void> bann_delivery_driver(int driverId) async {
  QueryResult<Mutation$bannDeliveryDriver> result =
      await _hasuraDb.graphQLClient.mutate$bannDeliveryDriver(
    Options$Mutation$bannDeliveryDriver(
      variables: Variables$Mutation$bannDeliveryDriver(driverId: driverId),
    ),
  );

  if (result.hasException) {
    mezDbgPrint(
        "[!] Called :: bann_delivery_driver :: EXCEPTION :: ${result.exception}");
  } else {
    mezDbgPrint("[+] Sucess :: bann_delivery_driver :: SUCESS");
  }
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
      final List<Subscription$get_delivery_operator_by_id$delivery_operator>?
          _op = _res.parsedData?.delivery_operator;

      mezDbgPrint("[///sub//] ${_op?.length}");

      if (_op != null && _op.isNotEmpty) {
        _operator = DeliveryOperator(
          companyName: _op.first.delivery_company.name,
          companyImg: _op.first.delivery_company.image,
          id: _op.first.id,
          companyId: _op.first.delivery_company_id,
          appVersion: _op.first.app_version,
          currentGps: _op.first.current_gps.toLocationData(),
          type: _op.first.delivery_driver_type.toDeliveryProviderType(),
          notificationToken: _op.first.notification_token,
          isOwner: _op.first.owner,
          status: _op.first.status,
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
