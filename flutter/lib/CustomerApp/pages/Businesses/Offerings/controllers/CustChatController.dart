import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustChatController {
  AuthController _authController = Get.find<AuthController>();

  Future<void> initiateChat({
    required BusinessCard business,
  }) async {
    final IncomingViewLink viewLink = IncomingViewLink(
      image: business.image,
      name: business.name,
      url: MezRouter.currentRoute().name,
    );

    mezDbgPrint("route ${MezRouter.currentRoute().name}");

    final HasuraChat? chatData = await get_service_provider_customer_chat(
      customerId: _authController.user!.hasuraId,
      serviceProviderId: business.id,
      serviceProviderType: ServiceProviderType.Business,
    );

    if (chatData == null) {
      // initiate new chat
      final ServiceProviderChatResponse newChatData =
          await CloudFunctions.serviceProvider_createServiceProviderChat(
        serviceProviderId: business.id,
        serviceProviderType: ServiceProviderType.Business,
      );
      mezDbgPrint(
          "initiateChat: HasuraChat is null ${newChatData.toFirebaseFormattedJson()}");
      await BaseMessagingScreen.navigate(
        chatId: int.parse(newChatData.chatId.toString()),
        incomingViewLink: viewLink,
      );
      return;
    } else {
      // initiate previous chat
      mezDbgPrint("initiateChat: HasuraChat is not null $chatData");
      await get_chat_info(chat_id: chatData.id);
      await BaseMessagingScreen.navigate(
        chatId: chatData.id,
        incomingViewLink: viewLink,
      );
      return;
    }
  }
}
