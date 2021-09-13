import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
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
    HasuraHelper hasuraHelper = HasuraHelper();

    QueryResult result = await hasuraHelper.get(
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
          "name": f['drivername'],
          "totalOrders": f['totalorders']
        });
        i++;
      },
    );
    return returnValue;
  }

  Future<List<dynamic>> getNotificationCountStatsOnDay() async {
    HasuraHelper hasuraHelper = HasuraHelper();

    QueryResult result = await hasuraHelper.get(
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
        {});

    if (result.hasException) {
      print(result.exception.toString());
    }
    print(result.data);
    List<dynamic> returnValue = [];
    return returnValue;
  }

  Future<List<dynamic>> getUniqueNotificationStatsForMonth() async {
    HasuraHelper hasuraHelper = HasuraHelper();

    QueryResult result = await hasuraHelper.get(
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

  Future<List<dynamic>> getNotificationReadStatusOnMonth() async {
    HasuraHelper hasuraHelper = HasuraHelper();

    QueryResult result = await hasuraHelper.get(
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
