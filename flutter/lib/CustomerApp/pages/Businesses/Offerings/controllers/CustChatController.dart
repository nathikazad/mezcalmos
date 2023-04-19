import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';

class CustChatController {
  AuthController _authController = Get.find<AuthController>();

  Future<void> initiateChat({
    required int serviceProviderId,
  }) async {
    final HasuraChat? chatData = await get_service_provider_customer_chat(
      customerId: _authController.user!.hasuraId,
      serviceProviderId: serviceProviderId,
      serviceProviderType: ServiceProviderType.Business,
    );

    if (chatData == null) {
      // initiate new chat
      var newChatData =
          await CloudFunctions.serviceProvider_createServiceProviderChat(
        serviceProviderId: serviceProviderId,
        serviceProviderType: ServiceProviderType.Business,
      );
      mezDbgPrint(
          "initiateChat: HasuraChat is null ${newChatData.toFirebaseFormattedJson()}");
      await BaseMessagingScreen.navigate(
          chatId: int.parse(newChatData.chatId.toString()));
      return;
    } else {
      // initiate previous chat
      mezDbgPrint("initiateChat: HasuraChat is not null $chatData");
      await get_chat_info(chat_id: chatData.id);
      await BaseMessagingScreen.navigate(chatId: chatData.id);
      return;
    }
  }
}
