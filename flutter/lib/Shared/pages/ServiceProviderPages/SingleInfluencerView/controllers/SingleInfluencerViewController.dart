import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfluencersView/models/InfluenceFakeModel.dart';

class SingleInfluencerViewController {
  late int influencerId;
  Rxn<Influencer> _influencer = Rxn();
  RxBool showTitle = RxBool(false);
  Influencer? get influencer => _influencer.value;
  double previousOffset = 0;
  bool get isPartner => influencer?.state == InfluencerState.Partner;
  bool get isWaiting => influencer?.state == InfluencerState.Waiting;

  /// means the state is none so the sp can send request to influencer
  bool get isNone => influencer?.state == InfluencerState.None;
  bool get isRequestReceived =>
      influencer?.state == InfluencerState.RequestSentByInfluencer;

  void init({required int id}) {
    influencerId = id;

    _influencer.value = mockInfluencers
        .firstWhere((Influencer element) => element.id == influencerId);
  }

  void handleScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final double currentOffset = notification.metrics.pixels;
      final bool isScrollingDown = currentOffset > previousOffset;

      final double maxScrollExtent = notification.metrics.maxScrollExtent;
      final double minScrollExtent = notification.metrics.minScrollExtent;
      final bool hasReachedFooter = currentOffset >= maxScrollExtent;
      final bool hasReachedHeader = currentOffset <= minScrollExtent;

      if (isScrollingDown && !showTitle.value && !hasReachedFooter) {
        showTitle.value = true;
      } else if (!isScrollingDown && hasReachedHeader && showTitle.value) {
        showTitle.value = false;
      }

      previousOffset = currentOffset;
    }
  }

  Future<void> changeState({required InfluencerState state}) async {
    await Future.delayed(Duration(seconds: 2));
    _influencer.value?.state = state;
    _influencer.refresh();
    mockInfluencers
        .where((Influencer element) => element.id == influencerId)
        .first
        .state = state;
  }
}
