import 'package:flutter/material.dart';

class BsOrdersListViewController {
  late TabController tabController;
  Future<void> init({required TickerProvider vsync}) async {
    tabController = TabController(length: 2, vsync: vsync);
  }
}
