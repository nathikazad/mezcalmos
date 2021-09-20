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

}
