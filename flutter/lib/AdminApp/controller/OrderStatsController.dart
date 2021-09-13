import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';

class OrderStatsController extends GetxController {
  HasuraHelper _hasuraHelper = Get.find<HasuraHelper>();

  @override
  void onInit() {
    super.onInit();
    print("--------------------> OrderStatsController Initialized !");
  }

  Future<List<dynamic>> getOrdersOnDay() async {
    HasuraHelper hasuraHelper = HasuraHelper();
    QueryResult result = await hasuraHelper.get(
        gql(
          r'''
          query getOrdersByDay($start_date_input:timestamptz!, $end_date_input:timestamptz!){
            orders_aggregate(where:
              {orderTime: {_gte:$start_date_input, _lte:$end_date_input}},
              order_by: {orderTime:asc}
            ){
              nodes{
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
          }
        ''',
        ),
        {
          "start_date_input": "2021-09-13T00:00:00-05:00",
          "end_date_input": "2021-09-14T00:00:00-05:00"
        });

    if (result.hasException) {
      print(result.exception.toString());
    }
    print(result.data);
    // List<dynamic> rankings =
    //     result.data!['get_last_week_rankings'] as List<dynamic>;

    List<dynamic> returnValue = [];
    // int i = 1;
    // rankings.forEach(
    //   (dynamic f) {
    //     returnValue.add({
    //       "rank": i,
    //       "name": f['drivername'],
    //       "totalOrders": f['totalorders']
    //     });
    //     i++;
    //   },
    // );
    return returnValue;
  }

  Future<List<dynamic>> getOrderscumulativeOnDay() async {
    HasuraHelper hasuraHelper = HasuraHelper();
    QueryResult result = await hasuraHelper.get(
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
          "start_date_input": "2021-09-13T00:00:00-05:00",
          "end_date_input": "2021-09-14T00:00:00-05:00"
        });

    if (result.hasException) {
      print(result.exception.toString());
    }
    print(result.data);
    // List<dynamic> rankings =
    //     result.data!['get_last_week_rankings'] as List<dynamic>;

    List<dynamic> returnValue = [];
    // int i = 1;
    // rankings.forEach(
    //   (dynamic f) {
    //     returnValue.add({
    //       "rank": i,
    //       "name": f['drivername'],
    //       "totalOrders": f['totalorders']
    //     });
    //     i++;
    //   },
    // );
    return returnValue;
  }

  Future<List<dynamic>> getOrderscumulativeByMonth() async {
    HasuraHelper hasuraHelper = HasuraHelper();
    QueryResult result = await hasuraHelper.get(
        gql(
          r'''
          query MyQuery {
            get_monthly_stats {
              cancelled
              customers
              drivers
              expired
              droppedoff
              fulfillmentRatio
              orders
              month
            }
          }
        ''',
        ),
        {
          "start_date_input": "2021-09-13T00:00:00-05:00",
          "end_date_input": "2021-09-14T00:00:00-05:00"
        });

    if (result.hasException) {
      print(result.exception.toString());
    }
    print(result.data);
    // List<dynamic> rankings =
    //     result.data!['get_last_week_rankings'] as List<dynamic>;

    List<dynamic> returnValue = [];
    // int i = 1;
    // rankings.forEach(
    //   (dynamic f) {
    //     returnValue.add({
    //       "rank": i,
    //       "name": f['drivername'],
    //       "totalOrders": f['totalorders']
    //     });
    //     i++;
    //   },
    // );
    return returnValue;
  }
}
