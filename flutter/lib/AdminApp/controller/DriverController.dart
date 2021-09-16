import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
import 'package:mezcalmos/AdminApp/helpers/formatter.dart';
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

  Future<List<dynamic>> getNotificationCountOnDay(DateTime date) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
        query getDriversByDay($start_date_input: timestamptz!, $end_date_input: timestamptz!) {
          drivers {
            userInfo {
              displayName
              uid
              photo
            }
            sent: notifications_aggregate(where: {sentTime: {_gte: $start_date_input, _lte: $end_date_input}}) {
              aggregate {
                count
              }
            }
            received: notifications_aggregate(where: {receivedTime: {_gte: $start_date_input, _lte: $end_date_input}}) {
              aggregate {
                count
              }
            }
            read: notifications_aggregate(where: {readTime: {_gte: $start_date_input, _lte: $end_date_input}}) {
              aggregate {
                count
              }
            }
            totalOrders: orders_aggregate(where: {orderTime: {_gte: $start_date_input, _lte: $end_date_input}}) {
              aggregate {
                count
              }
            }
          }
        }
      ''',
        ),
        {
          "start_date_input": "${formatDateForHasura(date)}T00:00:00-05:00",
          "end_date_input":
              "${formatDateForHasura(new DateTime(date.year, date.month, date.day + 1))}T00:00:00-05:00"
        });

    if (result.hasException) {
      print(result.exception.toString());
    }
    List<dynamic> drivers = result.data!['drivers'] as List<dynamic>;

    List<dynamic> returnValue = [];
    drivers.forEach(
      (dynamic driver) {
        returnValue.add({
          "displayName": driver['userInfo']['displayName'],
          "uid": driver['userInfo']['uid'],
          "photo": driver['userInfo']['photo'],
          "totalOrders": driver['totalOrders']['aggregate']['count'],
          "sent": driver['sent']['aggregate']['count'],
          "received": driver['received']['aggregate']['count'],
          "read": driver['read']['aggregate']['count']
        });
      },
    );
    returnValue.sort((a, b) => b["sent"] - a["sent"]);
    return returnValue;
  }

  Future<List<dynamic>> getUniqueNotificationStatsForMonth() async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
        query getUniqueDriverNotificationsByDay {
          get_daily_unique_drivers_notifications(args: {month: "2021-09-01"}, order_by: {day: asc}) {
            sent
            received
            read
            day
          }
        }
      ''',
        ),
        {});

    if (result.hasException) {
      print(result.exception.toString());
    }
    print(result.data);
    List<dynamic> returnValue = [];
    return returnValue;
  }

  Future<List<dynamic>> getNotificationReadStatusForMonth() async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
        query MyQuery {
          get_notifications_driver_status(args: {month: "2021-9-1"}, order_by: {day: asc}) {
            day
            driverId
            read
            received
            driver {
              driverId
              userInfo {
                photo
                displayName
              }
            }
          }
        }
      ''',
        ),
        {});

    if (result.hasException) {
      print(result.exception.toString());
    }
    print(result.data);
    List<dynamic> returnValue = [];
    return returnValue;
  }
}
