import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustServiceViewController {
  // state vars //
  Rxn<ServiceWithBusinessCard> _service = Rxn<ServiceWithBusinessCard>();

  // getters //
  ServiceWithBusinessCard? get service => _service.value;
  // methods //
  Future<void> fetchData({required int serviceId}) async {
    _service.value = await get_service_by_id(id: serviceId, withCache: false);
  }
}
//

class CustProductViewController {
  // state vars //
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();

  // getters //
  ProductWithBusinessCard? get product => _product.value;
  // methods //
  Future<void> fetchData({required int productId}) async {
    _product.value = await get_product_by_id(id: productId, withCache: false);
  }
}

class CustEventViewController {
  // state vars //
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();

  // getters //
  EventWithBusinessCard? get event => _event.value;
  // methods //
  Future<void> fetchData({required int eventId}) async {
    _event.value = await get_event_by_id(id: eventId, withCache: false);
  }
}

class CustHomeRentalViewController {
  // state vars //
  Rxn<RentalWithBusinessCard> _homeRental = Rxn<RentalWithBusinessCard>();

  // getters //
  RentalWithBusinessCard? get homeRental => _homeRental.value;
  // methods //
  Future<void> fetchData({required int rentalId}) async {
    _homeRental.value = await get_rental_by_id(
      id: rentalId,
      withCache: true,
    );
  }
}

class CustRentalViewController {
  // state vars //
  Rxn<RentalWithBusinessCard> _rental = Rxn<RentalWithBusinessCard>();

  // getters //
  RentalWithBusinessCard? get rental => _rental.value;
  // methods //
  Future<void> fetchData({required int rentalId}) async {
    _rental.value = await get_rental_by_id(
      id: rentalId,
      withCache: true,
    );
  }
}

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
      mezDbgPrint(
          "initiateChat: HasuraChat is not null $chatData ${mapFromJson("{timestamp: 2023-04-20 16:45:24.951842Z, message: hi, userId: 32, link: {name: Encore dance academy, image: https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80, url: /event/8}}")}");
      await BaseMessagingScreen.navigate(
        chatId: chatData.id,
        incomingViewLink: viewLink,
      );
      return;
    }
  }
}

// "{\"timestamp\":\"2023-04-20 16:45:24.951842Z\",\"message\":\"Hi\",\"userId\":32, \"link\":\"{\"name\": \"Encore dance academy\", \"image\": \"https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80\", \"url\": \"/event/8}\"}"
