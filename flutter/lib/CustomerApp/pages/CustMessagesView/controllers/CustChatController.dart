import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

class CustChatController {
  AuthController _authController = Get.find<AuthController>();
  RxList<HasuraChat> _allChats = RxList<HasuraChat>([]);
  RxList<HasuraChat> get allChats => _allChats;
  RxBool isLoading = false.obs;

  void init() {
    _getCustomerChatData();
  }

  Future<void> _getCustomerChatData() async {
    isLoading.value = true;
    var chatData = await get_customer_chat_by_sp_type(
      customerId: _authController.user!.hasuraId,
      serviceProviderType: ServiceProviderType.Business,
    );
    _allChats.value = chatData;
    isLoading.value = false;
  }

  Future<void> initiateChat({
    required int businessId,
    required String businessImage,
    required Map<Language, String>? offeringName,
  }) async {
    final IncomingViewLink? viewLink = offeringName == null
        ? null
        : IncomingViewLink(
            image: businessImage,
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
        );
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
        chatid: chatData.id,
        viewLink: viewLink,
      );
      return;
    }
  }

  Future<void> navigateToChatScreen({
    required int chatid,
    IncomingViewLink? viewLink,
  }) async {
    await BaseMessagingScreen.navigate(
      chatId: chatid,
      incomingViewLink: viewLink,
    );
  }
}
