import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
import 'package:mezcalmos/TaxiAdminApp/helpers/formatter.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';

class DriverStatsController extends GetxController {
  HasuraHelper _hasuraHelper = Get.find<HasuraHelper>();

  @override
  void onInit() {
    super.onInit();
    print("--------------------> DriverStatsController Initialized !");
  }

  Future<List<dynamic>> getLastWeekRankings() async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
        query MyQuery {
          get_last_week_rankings {
            drivername
            totalorders
          }
        }
      ''',
        ),
        {});

    if (result.hasException) {
      print(result.exception.toString());
    }
    List<dynamic> rankings =
        result.data!['get_last_week_rankings'] as List<dynamic>;

    List<dynamic> returnValue = [];
    int i = 1;
    rankings.forEach(
      (dynamic f) {
        returnValue.add({
          "rank": i,
          "displayName": f['drivername'],
          "totalOrders": f['totalorders']
        });
        i++;
      },
    );
    return returnValue;
  }

  Future<List<dynamic>> getDriverNotificationsLastNDays(
      String driverId, int nDays) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
          query getDriverNotifications($driverId: String, $nDays: Int) {
            get_notifications_by_driver_for_last_n_days(args: {driverid:$driverId, n: $nDays}) {
              index
              date
              read_notifications
              sent_notifications
            }
          }
          ''',
        ),
        {
          "driverId": driverId, //"yKo3XqL3dEd78BVgzjNOvAxru723",
          "nDays": nDays
        });

    if (result.hasException) {
      print(result.exception.toString());
    }
    List<dynamic> rankings = result
        .data!['get_notifications_by_driver_for_last_n_days'] as List<dynamic>;

    List<dynamic> returnValue = [];
    rankings.forEach(
      (dynamic f) {
        returnValue.add({
          "index": f['index'],
          "date": f['date'],
          "read_notifications": f['read_notifications'],
          "sent_notifications": f['sent_notifications']
        });
      },
    );
    return returnValue;
  }

  Future<List<dynamic>> getDriverOrdersLastNDays(
      String driverId, int nDays) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
          query getDriverOrders($driverId: String, $nDays: Int) {
            get_order_count_by_driver_for_last_n_days(args: {driverid: $driverId, n: $nDays}) {
              index
              date
              accepted_orders
              droppedOff_orders
            }
          ''',
        ),
        {
          "driverId": driverId, //"yKo3XqL3dEd78BVgzjNOvAxru723",
          "nDays": nDays
        });

    if (result.hasException) {
      print(result.exception.toString());
    }
    List<dynamic> rankings = result
        .data!['get_order_count_by_driver_for_last_n_days'] as List<dynamic>;

    List<dynamic> returnValue = [];
    rankings.forEach(
      (dynamic f) {
        returnValue.add({
          "index": f['index'],
          "date": f['date'],
          "accepted_orders": f['accepted_orders'],
          "droppedOff_orders": f['droppedOff_orders']
        });
      },
    );
    return returnValue;
  }

}
