import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';

class AdminMessagesViewController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  late TabController tabController;
  ScrollController get servicesScrollController => _servicesScrollController;
  ScrollController get customersScrollController => _customersScrollController;
  ScrollController _servicesScrollController = ScrollController();
  ScrollController _customersScrollController = ScrollController();
  AuthController _authController = Get.find<AuthController>();
  RxList<HasuraChat> _servicesChats = RxList<HasuraChat>([]);
  RxList<HasuraChat> _customersChat = RxList<HasuraChat>([]);
  RxList<HasuraChat> get servicesChats => _servicesChats;
  RxList<HasuraChat> get customersChat => _customersChat;
  RxBool isLoading = false.obs;
  int fetchSize = 10;
  int customersOffset = 0;
  bool _customersHasReachedEndData = false;
  bool customersIsFetching = false;
  int servicesOffset = 0;
  bool _servicesHasReachedEndData = false;
  bool servicesIsFetching = false;
  // streams //
  StreamSubscription<List<Message>?>? servicesChatsStream;
  String? servicesSubscriptionId;
  StreamSubscription<List<Message>?>? customersChatsStream;
  String? customersSubscriptionId;
  // methods //
  void init({required TickerProvider vsync}) {
    tabController = TabController(length: 2, vsync: vsync);
    _servicesScrollController.onBottomReach(getServiceMessages);
    _customersScrollController.onBottomReach(getCustomersMessages);
    getServiceMessages();
    getCustomersMessages();
    listenOnServiceChats();
    listenOnCustomerChats();
  }

  Future<void> getServiceMessages() async {
    if (servicesIsFetching || _servicesHasReachedEndData) {
      return;
    }

    try {
      servicesIsFetching = true;
      mezDbgPrint("Fetching new chats with offset $servicesOffset");
      final List<HasuraChat> chatData = await get_admin_services_chats(
          withCache: false, limit: fetchSize, offset: servicesOffset);

      _servicesChats += chatData;
      if (chatData.length == 0) {
        _servicesHasReachedEndData = true;
      }
      servicesOffset += fetchSize;
    } catch (e) {
    } finally {
      servicesIsFetching = false;
    }
    // todo
  }

  void listenOnServiceChats() {
    servicesSubscriptionId = _hasuraDb.createSubscription(start: () {
      servicesChatsStream =
          listen_on_admin_services_chats(limit: servicesChats.length, offset: 0)
              .listen((List<Message>? event) {
        if (event != null) {
          // update all the chats list last message with one coming from event
          event.forEach((Message element) {
            final HasuraChat? chat = servicesChats.value.firstWhereOrNull(
                (HasuraChat element2) =>
                    element2.lastMessage?.userId == element.userId);
            if (chat != null && chat.lastMessage?.message != element.message) {
              mezDbgPrint("Updating last message ${element.message}");
              chat.lastMessage = element;
            }
          });
          servicesChats.refresh();
        }
      });
    }, cancel: () {
      servicesChatsStream?.cancel();
      servicesChatsStream = null;
    });
  }

  Future<void> getCustomersMessages() async {
    if (customersIsFetching || _customersHasReachedEndData) {
      return;
    }

    try {
      customersIsFetching = true;
      mezDbgPrint("Fetching new chats with offset $customersOffset");
      final List<HasuraChat> chatData = await get_admin_customers_chats(
          withCache: false, limit: fetchSize, offset: customersOffset);

      _customersChat += chatData;
      if (chatData.length == 0) {
        _customersHasReachedEndData = true;
      }
      customersOffset += fetchSize;
    } catch (e) {
    } finally {
      customersIsFetching = false;
    }
    // todo
  }

  void listenOnCustomerChats() {
    customersSubscriptionId = _hasuraDb.createSubscription(start: () {
      customersChatsStream = listen_on_admin_customers_chats(
              limit: customersChat.length, offset: 0)
          .listen((List<Message>? event) {
        if (event != null) {
          // update all the chats list last message with one coming from event
          event.forEach((Message element) {
            final HasuraChat? chat = _customersChat.value.firstWhereOrNull(
                (HasuraChat element2) =>
                    element2.lastMessage?.userId == element.userId);
            if (chat != null && chat.lastMessage?.message != element.message) {
              mezDbgPrint("Updating last message ${element.message}");
              chat.lastMessage = element;
            }
          });
          _customersChat.refresh();
        }
      });
    }, cancel: () {
      customersChatsStream?.cancel();
      customersChatsStream = null;
    });
  }

  Future<void> navigateToChatScreen({
    required int chatid,
    String? phoneNumber,
    IncomingViewLink? viewLink,
  }) async {
    await BaseMessagingScreen.navigate(
        chatId: chatid, incomingViewLink: viewLink);
  }
}
