import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/__generated/cart.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

final HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<Cart?> getCustomerCart({required int customerId}) async {
  final QueryResult<Query$getCustomerCart> getCartResp =
      await _hasuraDb.graphQLClient.query$getCustomerCart(
    Options$Query$getCustomerCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$getCustomerCart(customer_id: customerId),
    ),
  );

  if (getCartResp.hasException) {
    mezDbgPrint(
        "[JJ] called :: getCustomerCart :: Exception ==> ${getCartResp.exception}");
    return null;
  }
  mezDbgPrint(
      "[JJ] called :: getCustomerCart :: NO Exception CUS_ID ( $customerId )!");

  final Query$getCustomerCart$customer_by_pk$cart? CartData =
      getCartResp.parsedData?.customer_by_pk?.cart;
  mezDbgPrint("[JJ] Caart_TO_JSON ==> ${CartData?.toJson()}");
  if (CartData != null) {
    final Cart cart = Cart(
        restaurant: CartData.restaurant != null
            ? Restaurant(
                userInfo: ServiceInfo(
                  hasuraId: CartData.restaurant!.id,
                  description:
                      (CartData.restaurant!.description?.translations != null)
                          ? {
                              CartData.restaurant!.description!.translations
                                      .first.language_id
                                      .toLanguageType():
                                  CartData.restaurant!.description!.translations
                                      .first.value,
                              CartData.restaurant!.description!.translations[1]
                                      .language_id
                                      .toLanguageType():
                                  CartData.restaurant!.description!
                                      .translations[1].value,
                            }
                          : null,
                  image: CartData.restaurant!.image,
                  firebaseId: CartData.restaurant?.firebase_id,
                  name: CartData.restaurant!.name,
                  descriptionId: CartData.restaurant!.description_id,
                  //   descriptionId: data.d,
                  location: Location.fromHasura(
                    CartData.restaurant!.location_gps,
                    CartData.restaurant!.location_text,
                  ),
                ),
                schedule: CartData.restaurant?.schedule != null
                    ? Schedule.fromData(CartData.restaurant?.schedule)
                    : null,
                paymentInfo: PaymentInfo(),
                restaurantState: ServiceState(
                  CartData.restaurant!.open_status.toServiceStatus(),
                  CartData.restaurant!.approved,
                ),
                primaryLanguage: CartData.restaurant!.language_id
                    .toString()
                    .toLanguageType(),
                secondaryLanguage: CartData.restaurant!.language_id
                    .toString()
                    .toLanguageType()
                    .toOpLang())
            : null);
    CartData.items
        .forEach((Query$getCustomerCart$customer_by_pk$cart$items cartitem) {
      mezDbgPrint("Item !");
      cart.addItem(
        CartItem(
          Item(
              name: {
                cartitem.restaurant_item.name.translations.first.language_id
                        .toLanguageType():
                    cartitem.restaurant_item.name.translations.first.value,
                cartitem.restaurant_item.name.translations[1].language_id
                        .toLanguageType():
                    cartitem.restaurant_item.name.translations[1].value,
              },
              itemType: cartitem.restaurant_item.item_type.toItemType(),
              cost: cartitem.restaurant_item.cost),
          cartitem.restaurant_item.restaurant_id,
          quantity: cartitem.quantity,
          notes: cartitem.note,
          idInCart: cartitem.id,
        ),
      );
    });
    return cart;
  }

  return null;
}

Future<void> create_customer_cart({required int restaurant_id}) async {
  mezDbgPrint("[cc] Called :: create_customer_cart!");
  final QueryResult<Mutation$create_customer_cart> InsertCartResponse =
      await _hasuraDb.graphQLClient.mutate$create_customer_cart(
    Options$Mutation$create_customer_cart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$create_customer_cart(
        cart: Input$restaurant_cart_insert_input(
          customer_id: Get.find<AuthController>().hasuraUserId,
          restaurant_id: restaurant_id,
        ),
      ),
    ),
  );

  if (InsertCartResponse.hasException) {
    mezDbgPrint(
        "[[JJ]] Called :: create_customer_cart :: exception ===> ${InsertCartResponse.exception}!");
  } else {
    mezDbgPrint("[[JJ]] Called :: create_customer_cart :: SUCCESS!!!");
  }
}

extension HasuraCartItem on CartItem {
  Input$restaurant_cart_item_insert_input toHasuraInputCartItem() {
    return Input$restaurant_cart_item_insert_input(
      cost_per_one: costPerOne().toDouble(),
      customer_id: Get.find<AuthController>().user!.hasuraId,
      note: notes,
      quantity: quantity,
      selected_options: item.toJson(),
      restaurant_item_id: item.id,
    );
  }
}

/// Returns Item Id
Future<int?> add_item_to_cart({required CartItem cartItem}) async {
  mezDbgPrint("[JJ] CustomerId ==> ${Get.find<AuthController>().hasuraUserId}");
  mezDbgPrint("🤣 Calling add item  ${cartItem.item.id}");
  final QueryResult<Mutation$addItemToCart> addItemResult =
      await _hasuraDb.graphQLClient.mutate$addItemToCart(
    Options$Mutation$addItemToCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$addItemToCart(
        item: Input$restaurant_cart_item_insert_input(
          cost_per_one: cartItem.costPerOne().toDouble(),
          customer_id: Get.find<AuthController>().user!.hasuraId,
          note: cartItem.notes,
          quantity: cartItem.quantity,
          selected_options: {},
          restaurant_item_id: cartItem.item.id,
        ),
      ),
    ),
  );

  if (addItemResult.hasException) {
    mezDbgPrint(
        "[[JJ]] graphql::add_item_to_cart::exception :: ${addItemResult.exception}");
  } else {
    mezDbgPrint(
        "[[JJ]] _add_item_result :: success :D Item Id --> ${addItemResult.parsedData?.insert_restaurant_cart_item_one?.toJson()}");
    return addItemResult.parsedData?.insert_restaurant_cart_item_one?.id;
  }
  return null;
}

Stream<Cart?> listen_on_customer_cart({required int customer_id}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_customer_cart(
    Options$Subscription$listen_on_customer_cart(
      variables: Variables$Subscription$listen_on_customer_cart(
          customer_id: customer_id),
    ),
  )
      .map<Cart?>((QueryResult<Subscription$listen_on_customer_cart> cart) {
    mezDbgPrint(
        "[[JJ]]  listen_on_customer_cart:::TRIGGERED:: ${cart.parsedData?.customer_by_pk?.cart?.items.length} ::");

    final Cart _c = Cart();
    final Subscription$listen_on_customer_cart$customer_by_pk$cart? parsedCart =
        cart.parsedData?.customer_by_pk?.cart;
    if (cart.parsedData?.customer_by_pk?.cart != null) {
      parsedCart!.items.forEach(
          (Subscription$listen_on_customer_cart$customer_by_pk$cart$items
              cartitem) {
        _c.addItem(
          CartItem(
            Item(
                name: {
                  cartitem.restaurant_item.name.translations.first.language_id
                          .toLanguageType():
                      cartitem.restaurant_item.name.translations.first.value,
                  cartitem.restaurant_item.name.translations[1].language_id
                          .toLanguageType():
                      cartitem.restaurant_item.name.translations[1].value,
                },
                itemType: cartitem.restaurant_item.item_type.toItemType(),
                cost: cartitem.restaurant_item.cost),
            cartitem.restaurant_item.restaurant_id,
            quantity: cartitem.quantity,
            notes: cartitem.note,
            idInCart: cartitem.id,
          ),
        );
      });
    }
    return null;
  });
}

Future rm_item_from_cart({required int item_id}) async {
  mezDbgPrint("CustomerId ==> ${Get.find<AuthController>().hasuraUserId}");
  final QueryResult<Mutation$removeItemFromCart> RmItemResult =
      await _hasuraDb.graphQLClient.mutate$removeItemFromCart(
    Options$Mutation$removeItemFromCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$removeItemFromCart(item_id: item_id),
    ),
  );

  if (RmItemResult.hasException) {
    mezDbgPrint(
        "[88] graphql::add_item_to_cart::exception :: ${RmItemResult.exception}");
  } else {
    mezDbgPrint("[88] _rm_item_result :: success :D ");
  }
}

Future clear_customer_cart({required int customer_id}) async {
  final QueryResult<Mutation$clearCart> RmItemsResult =
      await _hasuraDb.graphQLClient.mutate$clearCart(
    Options$Mutation$clearCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$clearCart(customer_id: customer_id),
    ),
  );

  if (RmItemsResult.hasException) {
    mezDbgPrint(
        "[cc] graphql::clear_customer_cart::exception :: ${RmItemsResult.exception}");
  } else {
    mezDbgPrint("[cc] clear_customer_cart :: success :D ");
  }
}

Future<void> update_item_quantity(
    {required int quantity,
    required int customer_id,
    required int item_id}) async {
  final QueryResult<Mutation$update_item_quantity> _resp =
      await _hasuraDb.graphQLClient.mutate$update_item_quantity(
    Options$Mutation$update_item_quantity(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$update_item_quantity(
        customer_id: customer_id,
        item_id: item_id,
        quantity: quantity,
      ),
    ),
  );

  if (_resp.hasException) {
    mezDbgPrint(
        "[66] Called update_item_quantity :: Has Exception - ${_resp.exception}");
  } else {
    mezDbgPrint("[66] update_item_quantity :: SUCCESS!");
  }
}

Future<Cart?> update_cart({
  required int customer_id,
  required int restaurant_id,
  required List<CartItem> items,
}) async {
  Cart? retCart = null;
  final QueryResult<Mutation$updateCart> _cart =
      await _hasuraDb.graphQLClient.mutate$updateCart(
    Options$Mutation$updateCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$updateCart(
        customer_id: customer_id,
        restaurant_id: restaurant_id,
        items: items
            .map<Input$restaurant_cart_item_insert_input>((CartItem _item) {
          mezDbgPrint("[66] loop::item :: ${_item.item.name}");
          return _item.toHasuraInputCartItem();
        }).toList(),
      ),
    ),
  );
  if (_cart.hasException) {
    mezDbgPrint(
        "[66] called :: update_cart :: exception :: ${_cart.hasException}");
  } else {
    mezDbgPrint(
        "[66] called :: update_cart :: cus_id ($customer_id) :: rest_id($restaurant_id) :: item(${items.length}) SUCESS  !");

    final Mutation$updateCart$update_restaurant_cart$returning? restaurantCart =
        _cart.parsedData?.update_restaurant_cart?.returning[0];
    retCart = Cart(
        restaurant: restaurantCart?.restaurant != null
            ? Restaurant(
                userInfo: ServiceInfo(
                  hasuraId: restaurantCart!.restaurant!.id,
                  image: restaurantCart.restaurant!.image,
                  firebaseId: restaurantCart.restaurant!.firebase_id,
                  name: restaurantCart.restaurant!.name,
                  description:
                      (restaurantCart.restaurant!.description?.translations !=
                              null)
                          ? {
                              restaurantCart.restaurant!.description!
                                      .translations.first.language_id
                                      .toLanguageType():
                                  restaurantCart.restaurant!.description!
                                      .translations.first.value,
                              restaurantCart.restaurant!.description!
                                      .translations[1].language_id
                                      .toLanguageType():
                                  restaurantCart.restaurant!.description!
                                      .translations[1].value,
                            }
                          : null,
                  descriptionId: restaurantCart.restaurant!.description_id,
                  //   descriptionId: data.d,
                  location: Location.fromHasura(
                    restaurantCart.restaurant!.location_gps,
                    restaurantCart.restaurant!.location_text,
                  ),
                ),
                schedule: restaurantCart.restaurant?.schedule != null
                    ? Schedule.fromData(restaurantCart.restaurant?.schedule)
                    : null,
                paymentInfo: PaymentInfo(),
                restaurantState: ServiceState(
                  restaurantCart.restaurant!.open_status.toServiceStatus(),
                  restaurantCart.restaurant!.approved,
                ),
                primaryLanguage: restaurantCart.restaurant!.language_id
                    .toString()
                    .toLanguageType(),
                secondaryLanguage: restaurantCart.restaurant!.language_id
                    .toString()
                    .toLanguageType()
                    .toOpLang())
            : null);
    _cart.parsedData?.insert_restaurant_cart_item?.returning.forEach(
        (Mutation$updateCart$insert_restaurant_cart_item$returning cartItem) {
      retCart!.addItem(
        CartItem(
          Item(
              name: {
                cartItem.restaurant_item.name.translations.first.language_id
                        .toLanguageType():
                    cartItem.restaurant_item.name.translations.first.value,
                cartItem.restaurant_item.name.translations[1].language_id
                        .toLanguageType():
                    cartItem.restaurant_item.name.translations[1].value,
              },
              itemType: cartItem.restaurant_item.item_type.toItemType(),
              cost: cartItem.restaurant_item.cost),
          cartItem.restaurant_item.restaurant_id,
          quantity: cartItem.quantity,
          notes: cartItem.note,
          idInCart: cartItem.id,
        ),
      );
    });
  }
  return retCart;
}
