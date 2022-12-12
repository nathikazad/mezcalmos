import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
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

final HasuraDb hasuraDb = Get.find<HasuraDb>();

Future<Cart?> getCustomerCart({required int customerId}) async {
  final QueryResult<Query$getCustomerCart> _get_cart_resp =
      await hasuraDb.graphQLClient.query$getCustomerCart(
    Options$Query$getCustomerCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$getCustomerCart(customer_id: customerId),
    ),
  );

  if (_get_cart_resp.hasException) {
    mezDbgPrint(
        "[cc] called :: getCustomerCart :: Exception ==> ${_get_cart_resp.exception}");
    return null;
  }
  mezDbgPrint(
      "[cc] called :: getCustomerCart :: NO Exception CUS_ID ( $customerId )!");

  Query$getCustomerCart$customer_by_pk$cart? _cart_data =
      _get_cart_resp.parsedData?.customer_by_pk?.cart;
  mezDbgPrint("Caart_TO_JSON ==> ${_cart_data?.toJson()}");
  if (_cart_data != null) {
    Cart cart = Cart(
        restaurant: _cart_data.restaurant != null
            ? Restaurant(
                userInfo: ServiceInfo(
                  hasuraId: _cart_data.restaurant!.id,
                  image: _cart_data.restaurant!.image,
                  firebaseId: _cart_data.restaurant?.firebase_id,
                  name: _cart_data.restaurant!.name,
                  descriptionId: _cart_data.restaurant!.description_id,
                  //   descriptionId: data.d,
                  location: Location.fromHasura(
                    _cart_data.restaurant!.location_gps,
                    _cart_data.restaurant!.location_text,
                  ),
                ),
                description: null,

                // {
                //   _cart_data
                //           .restaurant!.description!.translations.first.language_id
                //           .toLanguageType():
                //       _cart_data
                //           .restaurant!.description!.translations.first.value,
                //   _cart_data
                //           .restaurant!.description!.translations[1].language_id
                //           .toLanguageType():
                //       _cart_data.restaurant!.description!.translations[1].value,
                // },
                schedule: Schedule(openHours: {}),
                paymentInfo: PaymentInfo(),
                restaurantState: ServiceState(
                  _cart_data.restaurant!.open_status.toServiceStatus(),
                  _cart_data.restaurant!.approved,
                ),
                primaryLanguage: _cart_data.restaurant!.language_id
                    .toString()
                    .toLanguageType(),
                secondaryLanguage: _cart_data.restaurant!.language_id
                    .toString()
                    .toLanguageType()
                    .toOpLang())
            : null);
    _cart_data.items
        .forEach((Query$getCustomerCart$customer_by_pk$cart$items _cart_item) {
      mezDbgPrint("Item  ID [bb] ===> ${_cart_item.id}!");
      cart.addItem(
        CartItem(
          Item(
              name: {
                _cart_item.restaurant_item.name.translations.first.language_id
                        .toLanguageType():
                    _cart_item.restaurant_item.name.translations.first.value,
                _cart_item.restaurant_item.name.translations[1].language_id
                        .toLanguageType():
                    _cart_item.restaurant_item.name.translations[1].value,
              },
              itemType: _cart_item.restaurant_item.item_type.toItemType(),
              cost: _cart_item.restaurant_item.cost),
          _cart_item.restaurant_item.restaurant_id,
          quantity: _cart_item.quantity,
          notes: _cart_item.note,
          idInCart: _cart_item.id,
        ),
      );
    });
    return cart;
  }

  return null;
  // if (_hasura_cart.parsedData?.customer_by_pk?.cart != null) {
  //   _hasura_cart.parsedData!.customer_by_pk!.cart!.items
  //       .forEach((Query$getCustomerCart$customer_by_pk$cart$items item) {
  //         cart.addItem(CartItem(Item(name: item., itemType: itemType, cost: cost), restaurantId))
  //       });
  // }
}

Future<void> create_customer_cart({required int restaurant_id}) async {
  mezDbgPrint("[cc] Called :: create_customer_cart!");
  final QueryResult<Mutation$create_customer_cart> _insert_cart_response =
      await hasuraDb.graphQLClient.mutate$create_customer_cart(
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

  if (_insert_cart_response.hasException) {
    mezDbgPrint(
        "[cc] Called :: create_customer_cart :: exception ===> ${_insert_cart_response.exception}!");
  } else {
    mezDbgPrint("[cc] Called :: create_customer_cart :: SUCCESS!!!");
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
  mezDbgPrint("CustomerId ==> ${Get.find<AuthController>().hasuraUserId}");
  final QueryResult<Mutation$addItemToCart> _add_item_result =
      await hasuraDb.graphQLClient.mutate$addItemToCart(
    Options$Mutation$addItemToCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$addItemToCart(
        item: Input$restaurant_cart_item_insert_input(
          cost_per_one: cartItem.costPerOne().toDouble(),
          customer_id: Get.find<AuthController>().user!.hasuraId,
          note: cartItem.notes,
          quantity: cartItem.quantity,
          selected_options: cartItem.item.toJson(),
          restaurant_item_id: cartItem.item.id,

          // restaurant_cart: Input$restaurant_cart_obj_rel_insert_input(
          //   data: Input$restaurant_cart_insert_input(
          //     customer_id: Get.find<AuthController>().hasuraUserId,
          //   ),
          // ),
        ),
      ),
    ),
  );

  if (_add_item_result.hasException) {
    mezDbgPrint(
        "[88] graphql::add_item_to_cart::exception :: ${_add_item_result.exception}");
  } else {
    mezDbgPrint(
        "[88] _add_item_result :: success :D Item Id --> ${_add_item_result.parsedData?.insert_restaurant_cart_item_one?.id}");
    return _add_item_result.parsedData?.insert_restaurant_cart_item_one?.id;
  }
  return null;
}

Stream<Cart?> listen_on_customer_cart({required int customer_id}) async* {
  // .subscribe$Subscription$listen_on_customer_cart$customer_by_pk$cart$items(

  yield* hasuraDb.graphQLClient
      .subscribe$listen_on_customer_cart(
    Options$Subscription$listen_on_customer_cart(
      variables: Variables$Subscription$listen_on_customer_cart(
          customer_id: customer_id),
    ),
  )
      .asyncMap<Cart?>(
          (QueryResult<Subscription$listen_on_customer_cart> cart) {
    Cart _c = Cart();
    Subscription$listen_on_customer_cart$customer_by_pk$cart? parsed_cart =
        cart.parsedData?.customer_by_pk?.cart;
    if (cart.parsedData?.customer_by_pk?.cart != null) {
      parsed_cart!.items.forEach(
          (Subscription$listen_on_customer_cart$customer_by_pk$cart$items
              _cart_item) {
        _c.addItem(
          CartItem(
            Item(
                name: {
                  _cart_item.restaurant_item.name.translations.first.language_id
                          .toLanguageType():
                      _cart_item.restaurant_item.name.translations.first.value,
                  _cart_item.restaurant_item.name.translations[1].language_id
                          .toLanguageType():
                      _cart_item.restaurant_item.name.translations[1].value,
                },
                itemType: _cart_item.restaurant_item.item_type.toItemType(),
                cost: _cart_item.restaurant_item.cost),
            _cart_item.restaurant_item.restaurant_id,
            quantity: _cart_item.quantity,
            notes: _cart_item.note,
            idInCart: _cart_item.id,
          ),
        );
      });
    }
  });
}

Future rm_item_from_cart({required int item_id}) async {
  mezDbgPrint("CustomerId ==> ${Get.find<AuthController>().hasuraUserId}");
  final QueryResult<Mutation$removeItemFromCart> _rm_item_result =
      await hasuraDb.graphQLClient.mutate$removeItemFromCart(
    Options$Mutation$removeItemFromCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$removeItemFromCart(item_id: item_id),
    ),
  );

  if (_rm_item_result.hasException) {
    mezDbgPrint(
        "[88] graphql::add_item_to_cart::exception :: ${_rm_item_result.exception}");
  } else {
    mezDbgPrint("[88] _rm_item_result :: success :D ");
  }
}

Future clear_customer_cart({required int customer_id}) async {
  final QueryResult<Mutation$clearCart> _rm_items_result =
      await hasuraDb.graphQLClient.mutate$clearCart(
    Options$Mutation$clearCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$clearCart(customer_id: customer_id),
    ),
  );

  if (_rm_items_result.hasException) {
    mezDbgPrint(
        "[cc] graphql::clear_customer_cart::exception :: ${_rm_items_result.exception}");
  } else {
    mezDbgPrint("[cc] clear_customer_cart :: success :D ");
  }
}

Future<void> update_item_quantity(
    {required int quantity,
    required int customer_id,
    required int item_id}) async {
  QueryResult<Mutation$update_item_quantity> _resp =
      await hasuraDb.graphQLClient.mutate$update_item_quantity(
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
  Cart? _ret_cart = null;
  QueryResult<Mutation$updateCart> _cart =
      await hasuraDb.graphQLClient.mutate$updateCart(
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

    Mutation$updateCart$update_restaurant_cart$returning? _restaurant_cart =
        _cart.parsedData?.update_restaurant_cart?.returning[0];
    _ret_cart = Cart(
        restaurant: _restaurant_cart?.restaurant != null
            ? Restaurant(
                userInfo: ServiceInfo(
                  hasuraId: _restaurant_cart!.restaurant!.id,
                  image: _restaurant_cart.restaurant!.image,
                  firebaseId: _restaurant_cart.restaurant!.firebase_id!,
                  name: _restaurant_cart.restaurant!.name,
                  descriptionId: _restaurant_cart.restaurant!.description_id,
                  //   descriptionId: data.d,
                  location: Location.fromHasura(
                    _restaurant_cart.restaurant!.location_gps,
                    _restaurant_cart.restaurant!.location_text,
                  ),
                ),
                description: {
                  _restaurant_cart
                          .restaurant!.description!.translations.first.language_id
                          .toLanguageType():
                      _restaurant_cart
                          .restaurant!.description!.translations.first.value,
                  _restaurant_cart
                          .restaurant!.description!.translations[1].language_id
                          .toLanguageType():
                      _restaurant_cart
                          .restaurant!.description!.translations[1].value,
                },
                schedule: Schedule(openHours: {}),
                paymentInfo: PaymentInfo(),
                restaurantState: ServiceState(
                  _restaurant_cart.restaurant!.open_status.toServiceStatus(),
                  _restaurant_cart.restaurant!.approved,
                ),
                primaryLanguage: _restaurant_cart.restaurant!.language_id
                    .toString()
                    .toLanguageType(),
                secondaryLanguage: _restaurant_cart.restaurant!.language_id
                    .toString()
                    .toLanguageType()
                    .toOpLang())
            : null);
    _cart.parsedData?.insert_restaurant_cart_item?.returning.forEach(
        (Mutation$updateCart$insert_restaurant_cart_item$returning _cart_item) {
      _ret_cart!.addItem(
        CartItem(
          Item(
              name: {
                _cart_item.restaurant_item.name.translations.first.language_id
                        .toLanguageType():
                    _cart_item.restaurant_item.name.translations.first.value,
                _cart_item.restaurant_item.name.translations[1].language_id
                        .toLanguageType():
                    _cart_item.restaurant_item.name.translations[1].value,
              },
              itemType: _cart_item.restaurant_item.item_type.toItemType(),
              cost: _cart_item.restaurant_item.cost),
          _cart_item.restaurant_item.restaurant_id,
          quantity: _cart_item.quantity,
          notes: _cart_item.note,
          idInCart: _cart_item.id,
        ),
      );
    });
  }
  return _ret_cart;
}
