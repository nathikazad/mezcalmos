import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
import 'package:mezcalmos/TaxiAdminApp/helpers/formatter.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  HasuraHelper _hasuraHelper = Get.find<HasuraHelper>();

  @override
  void onInit() {
    super.onInit();
    print("--------------------> DriverStatsController Initialized !");
  }

  Future<List<dynamic>> getNotificationCountOnDayByDrivers(
      DateTime date) async {
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
    returnValue.sort((a, b) => b["read"] - a["read"]);
    return returnValue;
  }

  Future<Map<String, dynamic>> getNotificationForMonth(int month) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
            query OrdersByMonth($month_date: String) {
              get_all_notifications_by_days_of_month_aggregate(args: {month: $month_date}) {
                aggregate {
                  sum {
                    sent
                    read
                  }
                }
              }
              get_all_notifications_by_days_of_month(args: {month: $month_date}) {
                day
                sent
                read
                readPercentage
              }
            }
        ''',
        ),
        {"month_date": "$month/01/21"});

    if (result.hasException) {
      print(result.exception.toString());
    }
    print(result.data);
    Map<String, dynamic> returnValue = {};
    return returnValue;
  }
}
