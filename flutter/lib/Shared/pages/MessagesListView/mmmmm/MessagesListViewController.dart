import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/MessagesListView.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/models/ChatListVars.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

abstract class MessagesListViewController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  ScrollController get scrollController => _scrollController;
  ScrollController _scrollController = ScrollController();
  AuthController _authController = Get.find<AuthController>();
  RxList<HasuraChat> _allChats = RxList<HasuraChat>([]);
  RxList<HasuraChat> get allChats => _allChats;
  RxBool isLoading = false.obs;
  int fetchSize = 10;
  int offset = 0;
  bool _hasReachedEndData = false;
  bool isFetching = false;
  // streams //
  StreamSubscription<List<ChatListVars>?>? chatsStream;
  String? subscriptionId;
  void init() {
    MezRouter.registerReturnToViewCallback(
      MessagesListView.constructPath(),
      () {
        getMessages();
      },
    );
    getMessages();
    listenOnChats();
    _scrollController.onBottomReach(getMessages, sensitivity: 200);
  }

  void listenOnChats();
  void dispose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
  }

  Future<void> getMessages();

  Future<void> navigateToChatScreen({
    required int chatid,
    String? phoneNumber,
    IncomingViewLink? viewLink,
  }) async {
    await BaseMessagingScreen.navigate(
        chatId: chatid, incomingViewLink: viewLink, phoneNumber: phoneNumber);
  }
}

class CustMessagesListViewController extends MessagesListViewController {
  @override
  Future<void> getMessages() async {
    mezDbgPrint("Getting busines messages ....");

    if (isLoading.isTrue || _hasReachedEndData) {
      mezDbgPrint(
          " cancelled isloading : ${isLoading.isTrue} or endData : $_hasReachedEndData");
      return;
    }

    try {
      isLoading.value = true;
      mezDbgPrint("Fetching new chats with offset $offset");
      final List<HasuraChat> chatData = await get_customer_chats(
          customerId: _authController.hasuraUserId!,
          withCache: false,
          limit: fetchSize,
          offset: offset);

      _allChats += chatData;
      if (chatData.length == 0) {
        _hasReachedEndData = true;
      }
      offset += fetchSize;
      isLoading.value = false;
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> initiateChat(
      {required int businessId,
      String? phoneNumber,
      required String offeringImage,
      required Map<Language, String>? offeringName}) async {
    final IncomingViewLink? viewLink = offeringName == null
        ? null
        : IncomingViewLink(
            image: offeringImage,
            name: offeringName,
            url: MezRouter.currentRoute().name,
          );

    final HasuraChat? chatData = await get_service_provider_customer_chat(
      customerId: _authController.user!.hasuraId,
      serviceProviderId: businessId,
      serviceProviderType: ServiceProviderType.Business,
    );

    if (chatData == null) {
      // initiate new chat
      final ServiceProviderChatResponse newChatData =
          await CloudFunctions.serviceProvider_createServiceProviderChat(
        serviceProviderId: businessId,
        serviceProviderType: ServiceProviderType.Business,
      );
      if (newChatData.success) {
        mezDbgPrint(
            "initiateChat: HasuraChat is null ${newChatData.toFirebaseFormattedJson()}");
        await BaseMessagingScreen.navigate(
            chatId: newChatData.chatId!.toInt(),
            incomingViewLink: viewLink,
            phoneNumber: phoneNumber);
      } else {
        mezDbgPrint(
            "initiateChat: HasuraChat is with error ${newChatData.toFirebaseFormattedJson()}");
        showErrorSnackBar(errorText: "businessId is null");
      }

      return;
    } else {
      // initiate previous chat
      mezDbgPrint("initiateChat: HasuraChat is not null $chatData");
      await navigateToChatScreen(
          chatid: chatData.id, viewLink: viewLink, phoneNumber: phoneNumber);
      return;
    }
  }

  @override
  void listenOnChats() {
    subscriptionId = _hasuraDb.createSubscription(start: () {
      chatsStream =
          listen_on_customer_chats(customerId: _authController.user!.hasuraId)
              .listen(( event) {
        event.forEach((ChatListVars element) {
          final HasuraChat? chat = _allChats.value.firstWhereOrNull(
              (HasuraChat element2) => element2.id == element.chatId);
          if (chat != null) {
            mezDbgPrint("Updating last message ${element.lastMessage}");
            chat.lastMessage?.message = element.lastMessage;
          }
        });
      });
    }, cancel: () {
      chatsStream?.cancel();
      chatsStream = null;
    });
  }
}

class CustDeliveryListViewController extends MessagesListViewController {
  @override
  Future<void> getMessages() async {
    isLoading.value = true;
    List<HasuraChat> chatData =
        await get_customer_chats(customerId: _authController.user!.hasuraId);
    _allChats.value = chatData;
    isLoading.value = false;
  }

  Future<void> initiateChat(
      {required int businessId,
      String? phoneNumber,
      required String offeringImage,
      required ServiceProviderType serviceProviderType,
      required Map<Language, String>? offeringName}) async {
    final IncomingViewLink? viewLink = offeringName == null
        ? null
        : IncomingViewLink(
            image: offeringImage,
            name: offeringName,
            url: MezRouter.currentRoute().name,
          );

    final HasuraChat? chatData = await get_service_provider_customer_chat(
      customerId: _authController.user!.hasuraId,
      serviceProviderId: businessId,
      serviceProviderType: serviceProviderType,
    );

    if (chatData == null) {
      // initiate new chat
      final ServiceProviderChatResponse newChatData =
          await CloudFunctions.serviceProvider_createServiceProviderChat(
        serviceProviderId: businessId,
        serviceProviderType: serviceProviderType,
      );
      if (newChatData.success) {
        mezDbgPrint(
            "initiateChat: HasuraChat is null ${newChatData.toFirebaseFormattedJson()}");
        await BaseMessagingScreen.navigate(
            chatId: newChatData.chatId!.toInt(),
            incomingViewLink: viewLink,
            phoneNumber: phoneNumber);
      } else {
        mezDbgPrint(
            "initiateChat: HasuraChat is with error ${newChatData.toFirebaseFormattedJson()}");
        showErrorSnackBar(errorText: "businessId is null");
      }

      return;
    } else {
      // initiate previous chat
      mezDbgPrint("initiateChat: HasuraChat is not null $chatData");
      await navigateToChatScreen(
          chatid: chatData.id, viewLink: viewLink, phoneNumber: phoneNumber);
      return;
    }
  }

  @override
  void listenOnChats() {
    // TODO: implement listenOnChats
  }
}

class ServiceProviderMessagesListViewController
    extends MessagesListViewController {
  final ServiceProviderType type;
  final int serviceId;

  ServiceProviderMessagesListViewController(
      {required this.type, required this.serviceId});

  @override
  Future<void> getMessages() async {
    mezDbgPrint("Getting busines messages ....");

    if (isLoading.isTrue || _hasReachedEndData) {
      mezDbgPrint(
          " cancelled isloading : ${isLoading.isTrue} or endData : $_hasReachedEndData");
      return;
    }

    try {
      isLoading.value = true;
      mezDbgPrint("Fetching new chats with offset $offset");
      final List<HasuraChat> chatData = await get_service_provider_chats(
          serviceId: serviceId,
          serviceType: type,
          withCache: false,
          limit: fetchSize,
          offset: offset);

      _allChats += chatData;
      if (chatData.length == 0) {
        _hasReachedEndData = true;
      }
      offset += fetchSize;
      isLoading.value = false;
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
    // todo
  }

  @override
  void listenOnChats() {
    subscriptionId = _hasuraDb.createSubscription(start: () {
      chatsStream = listen_on_service_provider_chats(
              serviceId: serviceId, serviceType: type)
          .listen((List<ChatListVars>? event) {
        if (event != null) {
          // update all the chats list last message with one coming from event
          event.forEach((ChatListVars element) {
            final HasuraChat? chat = _allChats.value.firstWhereOrNull(
                (HasuraChat element2) => element2.id == element.chatId);
            if (chat != null) {
              mezDbgPrint("Updating last message ${element.lastMessage}");
              chat.lastMessage?.message = element.lastMessage;
            }
          });
        }
      });
    }, cancel: () {
      chatsStream?.cancel();
      chatsStream = null;
    });
  }
}

class AdminMessagesListViewController extends MessagesListViewController {
  @override
  Future<void> getMessages() async {
    isLoading.value = true;
    // todo

    final List<HasuraChat> chatData = await get_admin_chats();
    _allChats.value = [];
    _allChats.value = chatData;
    mezDbgPrint(
        "BsOpMessagesListViewController chats ${_allChats.map((HasuraChat element) => element.messages.isEmpty ? null : element.messages.last.message)}");
    isLoading.value = false;
  }

  @override
  void listenOnChats() {
    // TODO: implement listenOnChats
  }
}
