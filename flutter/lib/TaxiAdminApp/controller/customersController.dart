import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:graphql/client.dart';
import 'package:get/get.dart';

class CustomersController extends GetxController {
  HasuraDb _hasuraHelper = Get.find<HasuraDb>();

  @override
  void onInit() {
    super.onInit();
    print("--------------------> DriverStatsController Initialized !");
  }

  Future<Map<String, dynamic>> getNewCustomersForMonth(int month) async {
    QueryResult result = await _hasuraHelper.get(
        gql(
          r'''
          query getNewCustomersForMonth($month_date: String) {
            get_new_customers_by_days_of_month_aggregate(args: {month: $month_date}) {
              aggregate {
                sum {
                  num_of_new_customers
                }
              }
            }
            get_new_customers_by_days_of_month(args: {month: $month_date}) {
              day
              num_of_new_customers
            }
          }
        ''',
        ),
        {"month_date": "$month/01/21"});
    if (result.hasException) {
      print(result.exception.toString());
    }
    Map<String, dynamic> returnValue = {};
    returnValue['cumulative'] =
        result.data!['get_new_customers_by_days_of_month_aggregate']
            ['aggregate']['sum']['num_of_new_customers'];
    returnValue['byDay'] = {};
    result.data!['get_new_customers_by_days_of_month'].forEach(
      (dynamic f) {
        returnValue['byDay'][f['day']] = f['num_of_new_customers'];
      },
    );
    return returnValue;
  }
}
