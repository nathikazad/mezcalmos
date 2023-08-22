// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfluencersView/models/InfluenceFakeModel.dart';

class ServiceInfluencersViewController {
  late int serviceId;
  late ServiceProviderType serviceProviderType;
  late TabController tabController;
  RxList<Influencer> partners = RxList.empty();
  RxList<Influencer> requests = RxList.empty();
  RxList<Influencer> discoverInfluencers = RxList.empty();

  void init(
      {required int serviceId,
      required ServiceProviderType type,
      required TickerProvider vsync}) {
    this.serviceId = serviceId;
    serviceProviderType = type;
    tabController = TabController(length: 3, vsync: vsync);
    partners.value = mockInfluencers
        .where((Influencer element) => element.state == InfluencerState.Partner)
        .toList();
    requests.value = mockInfluencers
        .where((Influencer element) =>
            element.state == InfluencerState.RequestSentByInfluencer)
        .toList();
    discoverInfluencers.value = mockInfluencers
        .where((Influencer element) => element.state == InfluencerState.None)
        .toList();
  }
}
