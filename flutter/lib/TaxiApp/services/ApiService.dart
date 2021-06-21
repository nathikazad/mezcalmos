import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';


class ApiService {

  static Future<List<dynamic>> fetchOrders() async 
  {
    // just ab example of how we can call a firebase function .. for exmpl > listOrders
    // Listing orders will be using DatabaseRef  @ /openOrders .

    print("+ Executing Firebase_function::listOrders ...");
    HttpsCallable callMe = FirebaseFunctions.instance.httpsCallable('listOrders');
    final res = await callMe();
    return res.data as List<dynamic>;

  // TODO : Fetch order @ /openOrders
    
  }


}