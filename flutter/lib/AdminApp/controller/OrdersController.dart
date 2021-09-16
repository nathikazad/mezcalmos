import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
import 'package:mezcalmos/AdminApp/helpers/formatter.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';

class OrderStatsController extends GetxController {
  HasuraHelper _hasuraHelper = Get.find<HasuraHelper>();

  @override
  void onInit() {
    super.onInit();
    print("--------------------> OrderStatsController Initialized !");
  }

  Stream<RxList<dynamic>> getOrdersOnDay(DateTime date) {
    Stream<QueryResult> stream = _hasuraHelper.subscribe(
        gql(
          r'''
        query getOrdersByDay($start_date_input:timestamptz!, $end_date_input:timestamptz!){
          orders(where:
            {orderTime: {_gte:$start_date_input, _lte:$end_date_input}},
            order_by: {orderTime:asc}
          ){
              orderTime
              finalStatus
              orderId
              customer{
                photo
              }
              driver{
                photo
              }
              notifications_sent
              notifications_received
              notifications_read
          }
        }
      ''',
        ),
        {
          "start_date_input": "${formatDateForHasura(date)}T00:00:00-05:00",
          "end_date_input":
              "${formatDateForHasura(new DateTime(date.year, date.month + 1, date.day))}T00:00:00-05:00"
      });

    return stream.map<RxList<dynamic>>((result) {
      if (result.hasException) {
        print(result.exception.toString());
      }
      print(result.data);
      List<dynamic> orders = result.data!['orders'] as List<dynamic>;
      RxList<dynamic> returnValue = [].obs;

      orders.forEach(
        (dynamic order) {
          returnValue.add({
            "orderTime": order['orderTime'],
            "status": order['finalStatus'],
            "orderId": order['orderId'],
            "customer": order['customer'],
            "driver": order['driver'],
            "notifications_sent": order['notifications_sent'],
            "notifications_received": order['notifications_received'],
            "notifications_read": order['notifications_read'],
          });
        },
      );
      return returnValue;
    }); 
  }

  Future<RxMap<String, dynamic>> getOrdersCumulativeOnDay(DateTime date) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
          query orders_cumulative($start_date_input:timestamptz!, $end_date_input:timestamptz!){
            total_orders: orders_aggregate(where: 
              {orderTime: {_gte:$start_date_input, _lte:$end_date_input}}){
                aggregate { 
                  count 
                }
              }
              dropped_off_orders: orders_aggregate(where:{
                finalStatus:{ _eq: "droppedOff"}
                orderTime: {_gte:$start_date_input, _lte:$end_date_input}
              }
              ){
                aggregate { count }
              }
                expired_orders: orders_aggregate(where:{
                finalStatus:{ _eq: "expired"}
                orderTime: {_gte:$start_date_input, _lte:$end_date_input}
              }){
                aggregate { count }
              }
                cancelled_orders: orders_aggregate(where:{
                finalStatus:{ _eq: "cancelled"} 
                orderTime: {_gte:$start_date_input, _lte:$end_date_input} 
              })
                {
                aggregate { count }
                }  
                inProcess_orders: orders_aggregate(
                  where:{
                    _or:[
                      {finalStatus:{ _eq: "inTransit"}}
                      {finalStatus: {_eq: "isLooking"}}
                    ]
                    orderTime: {_gte:$start_date_input, _lte:$end_date_input}
                  })
                {
                aggregate { count }
                } 
                isLooking_orders: orders_aggregate(where:{
                finalStatus:{ _eq: "lookingForTaxi"}
                orderTime: {_gte:$start_date_input, _lte:$end_date_input}  
              })
                {
                aggregate { count }
                }     
            }
        ''',
        ),
        {
          "start_date_input": "${formatDateForHasura(date)}T00:00:00-05:00",
          "end_date_input":
              "${formatDateForHasura(new DateTime(date.year, date.month + 1, date.day))}T00:00:00-05:00"
        });

    if (result.hasException) {
      print(result.exception.toString());
    }
    // List<dynamic> aggregates = result.data! as List<dynamic>;
    RxMap<String, dynamic> returnValue = RxMap({
      "total": result.data!['total_orders']['aggregate']['count'],
      "finished": result.data!['dropped_off_orders']['aggregate']['count'],
      "cancelled": result.data!['cancelled_orders']['aggregate']['count'],
      "expired": result.data!['expired_orders']['aggregate']['count'],
      "isLooking": result.data!['isLooking_orders']['aggregate']['count'],
      "inProcess": result.data!['inProcess_orders']['aggregate']['count']
    });

    return returnValue;
  }

  Future<Map<String, dynamic>> getOrderscumulativeOnMonth(int month) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
            query OrdersByMonth($month_date:String, $month_number:Int) {
              get_monthly_stats(where: {month: {_eq: $month_number}}) {
                cancelled
                customers
                drivers
                expired
                droppedoff
                fulfillmentRatio
                orders
                month
              }
              get_orders_cum_by_days_of_month(args: {month: $month_date}, order_by: {day: asc}) {
                cancelled
                day
                droppedoff
                expired
                fulfillmentratio
                totalOrders
              }
            }
          ''',
        ),
        {"month_date": "$month/01/21", "month_number": month});

    if (result.hasException) {
      print(result.exception.toString());
    }

    Map<String, dynamic> returnValue = {};
    returnValue['cumulative'] = {
      "total": result.data!['get_monthly_stats'][0]['orders'],
      "droppedoff": result.data!['get_monthly_stats'][0]['droppedoff'],
      "cancelled": result.data!['get_monthly_stats'][0]['cancelled'],
      "expired": result.data!['get_monthly_stats'][0]['expired'],
    };
    returnValue['byDay'] = {};
    result.data!['get_orders_cum_by_days_of_month'].forEach(
      (dynamic f) {
        returnValue['byDay'][f['day']] = {
          "total": f['totalOrders'],
          "droppedoff": f['droppedoff'],
          "expired": f['expired'],
          "cancelled": f['cancelled']
        };
      },
    );
    return returnValue;
  }

  Future<Map<String, dynamic>> getFulfillmentRatioOnMonth(int month) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
            query OrdersByMonth($month_date:String, $month_number:Int) {
              get_monthly_stats(where: {month: {_eq: $month_number}}) {
                fulfillmentRatio
              }
              get_orders_cum_by_days_of_month(args: {month: $month_date}, order_by: {day: asc}) {
                day
                fulfillmentratio
              }
            }
          ''',
        ),
        {"month_date": "$month/01/21", "month_number": month});

    if (result.hasException) {
      print(result.exception.toString());
    }

    Map<String, dynamic> returnValue = {};
    returnValue['cumulative'] =
        result.data!['get_monthly_stats'][0]['fulfillmentRatio'];
    returnValue['byDay'] = {};
    result.data!['get_orders_cum_by_days_of_month'].forEach(
      (dynamic f) {
        returnValue['byDay'][f['day']] = f['fulfillmentratio'];
      },
    );
    return returnValue;
  }

  Stream<Map<String, dynamic>> getOrder(String orderId) {
    Stream<QueryResult> stream = _hasuraHelper.subscribe(
        gql(
          r'''
            subscription MySubscription($orderId: String) {
              orders(where: {orderId: {_eq: $orderId}}) {
                customer {
                  displayName
                  photo
                  uid
                }
                driver {
                  displayName
                  photo
                  uid
                }
                cancellationParty
                acceptRideTime
                dropOffLocation
                finalPrice
                finalStatus
                notifications_read
                notifications_received
                notifications_sent
                orderId
                orderTime
                pickUpLocation
                rideFinishTime
                rideStartTime
              }
            }
          ''',
        ),
        {"orderId": orderId});

    // await for (QueryResult result in stream){

    return stream.map<Map<String, dynamic>>((result) {
      if (result.hasException) {
        print(result.exception.toString());
      }
      print(result.data);
      // If you want to manipulate the data, use the bottom two lines
      // Map<String, dynamic> returnValue = {};
      // return returnValue;

      return result.data!;
    });
  }
}
