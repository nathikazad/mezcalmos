import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';

class DriverStatsController extends GetxController {
  HasuraHelper _hasuraHelper = Get.find<HasuraHelper>();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();

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
        {"driverId": driverId, "nDays": nDays});

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

    List<dynamic> count = result
        .data!['get_order_count_by_driver_for_last_n_days'] as List<dynamic>;

    List<dynamic> returnValue = [];
    count.forEach(
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

  Future<dynamic> getDriverFBData(String driverId) async {
    // Already Injected in main function
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('taxiDrivers/$driverId')
        .once();
    Map<String, dynamic> returnValue = {
      "appVersionNumber": snapshot.value["versionNumber"],
      "online": snapshot.value["state"]["isLooking"]
    };
    return returnValue;
    // .map<DataSnapshot>((event) => event.snapshot.value);
  }

  Future<Map<String, dynamic>> getUserInfo(String driverId) async {
    // Already Injected in main function
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('users/$driverId/info')
        .once();

    Map<String, dynamic> returnValue = {
      "displayName": snapshot.value["displayName"],
      "taxiNumber": snapshot.value["taxiNumber"],
      "agency": snapshot.value["agency"],
      "phoneNumber": snapshot.value["phoneNumber"],
      "photo": snapshot.value["photo"]
    };

    return returnValue;
    // .map<DataSnapshot>((event) => event.snapshot.value);
  }

  Future<Map<String, dynamic>> getDriverHasuraData(String driverId) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
          query getDriverNotifications($driverId: String) {
            sentNotifications: notifications_aggregate(where: {driverId: {_eq: $driverId}, sentTime: {_is_null: false}}) {
              aggregate {
                count
              }
            }
            readNotifications: notifications_aggregate(where: {driverId: {_eq: $driverId}, readTime: {_is_null: false}}) {
              aggregate {
                count
              }
            }
            firstOrderTime: orders_aggregate {
              aggregate {
                min {
                  orderTime
                }
              }
            }
            lastOrderTime: orders_aggregate {
              aggregate {
                max {
                  orderTime
                }
              }
            }
            totalOrders: orders_aggregate(where: {driverId: {_eq: $driverId}}) {
              aggregate {
                count
              }
            }
            droppedOff: orders_aggregate(where: {driverId: {_eq: $driverId}, finalStatus: {_eq: "droppedOff"}}) {
              aggregate {
                count
              }
            }
            cancelledByDriver: orders_aggregate(where: {driverId: {_eq: $driverId}, finalStatus: {_eq: "cancelled"}, cancellationParty: {_eq: "driver"}}) {
              aggregate {
                count
              }
            }
            cancelledByCustomer: orders_aggregate(where: {driverId: {_eq: $driverId}, finalStatus: {_eq: "cancelled"}, cancellationParty: {_eq: "customer"}}) {
              aggregate {
                count
              }
            }
          }
        ''',
        ),
        {"driverId": driverId});

    if (result.hasException) {
      print(result.exception.toString());
    }
    // print(result.data!);

    Map<String, dynamic> returnValue = {
      "sentNotifications": result.data!['sentNotifications']['aggregate']
          ['count'],
      "readNotifications": result.data!['readNotifications']['aggregate']
          ['count'],
      "firstOrderTime": result.data!['firstOrderTime']['aggregate']['min']
          ["orderTime"],
      "lastOrderTime": result.data!['lastOrderTime']['aggregate']['max']
          ["orderTime"],
      "totalOrders": result.data!['totalOrders']['aggregate']['count'],
      "droppedOff": result.data!['droppedOff']['aggregate']['count'],
      "cancelledByDriver": result.data!['cancelledByDriver']['aggregate']
          ['count'],
      "cancelledByCustomer": result.data!['cancelledByCustomer']['aggregate']
          ['count'],
    };
    return returnValue;
  }
}
