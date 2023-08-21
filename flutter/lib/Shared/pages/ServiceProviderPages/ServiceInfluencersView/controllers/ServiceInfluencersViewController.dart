import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class ServiceInfluencersViewController {
  late int serviceId;
  late ServiceProviderType serviceProviderType;
  late TabController tabController;

  void init(
      {required int serviceId,
      required ServiceProviderType type,
      required TickerProvider vsync}) {
    this.serviceId = serviceId;
    serviceProviderType = type;
    tabController = TabController(length: 3, vsync: vsync);
  }
}
