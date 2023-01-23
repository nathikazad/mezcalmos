import 'dart:convert';

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/__generated/cart.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

final HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<Cart?> get_customer_cart({required int customerId}) async {
  final QueryResult<Query$getCustomerCart> getCartResp =
      await _hasuraDb.graphQLClient.query$getCustomerCart(
    Options$Query$getCustomerCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$getCustomerCart(customer_id: customerId),
    ),
  );

  if (getCartResp.parsedData?.customer_customer_by_pk == null) {
    throw Exception(
        "[🛑] create_customer_cart :: exception ===> ${getCartResp.exception}!");
  }
  mezDbgPrint(
      "[✅] called :: getCustomerCart :: NO Exception CUS_ID ( $customerId )!");

  final Query$getCustomerCart$customer_customer_by_pk$cart? cartData =
      getCartResp.parsedData?.customer_customer_by_pk?.cart;
  mezDbgPrint("[✅✅✅] called ::${cartData.toString()} [✅✅✅]");

  PaymentInfo paymentInfo = PaymentInfo();
  if (cartData?.restaurant?.stripe_info != null &&
      cartData?.restaurant?.accepted_payments != null) {
    paymentInfo = PaymentInfo.fromData(
        stripeInfo: cartData?.restaurant?.stripe_info!,
        acceptedPayments: cartData?.restaurant?.accepted_payments!);
  }
  // if (data?.stripe_info != null) {
  //   paymentInfo.stripe = parseServiceStripeInfo(data!.stripe_info);
  // }
  if (cartData != null) {
    final Cart cart = Cart(
        restaurant: cartData.restaurant != null
            ? Restaurant(
                userInfo: ServiceInfo(
                  hasuraId: cartData.restaurant!.id,
                  description:
                      (cartData.restaurant!.description?.translations != null)
                          ? {
                              cartData.restaurant!.description!.translations
                                      .first.language_id
                                      .toLanguageType():
                                  cartData.restaurant!.description!.translations
                                      .first.value,
                              cartData.restaurant!.description!.translations[1]
                                      .language_id
                                      .toLanguageType():
                                  cartData.restaurant!.description!
                                      .translations[1].value,
                            }
                          : null,
                  image: cartData.restaurant!.image,
                  firebaseId: cartData.restaurant?.firebase_id,
                  name: cartData.restaurant!.name,
                  descriptionId: cartData.restaurant!.description_id,
                  //   descriptionId: data.d,
                  location: Location.fromHasura(
                    cartData.restaurant!.location_gps,
                    cartData.restaurant!.location_text,
                  ),
                ),
                schedule: cartData.restaurant?.schedule != null
                    ? Schedule.fromData(cartData.restaurant?.schedule)
                    : null,
                paymentInfo: paymentInfo,
                restaurantState: ServiceState(
                  cartData.restaurant!.open_status.toServiceStatus(),
                  cartData.restaurant!.approved,
                ),
                primaryLanguage: cartData.restaurant!.language_id
                    .toString()
                    .toLanguageType(),
                secondaryLanguage: cartData.restaurant!.language_id
                    .toString()
                    .toLanguageType()
                    .toOpLang())
            : null);
    cartData.items.forEach(
        (Query$getCustomerCart$customer_customer_by_pk$cart$items cartitem) {
      final CartItem data = CartItem(
        item: Item(
            startsAt: (cartitem.restaurant_item.special_period_start != null)
                ? DateTime.tryParse(
                    cartitem.restaurant_item.special_period_start!)
                : null,
            endsAt: (cartitem.restaurant_item.special_period_end != null)
                ? DateTime.tryParse(
                    cartitem.restaurant_item.special_period_end!)
                : null,
            id: cartitem.restaurant_item.id,
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
        restaurantId: cartitem.restaurant_item.restaurant_id,
        quantity: cartitem.quantity,
        notes: cartitem.note,
        idInCart: cartitem.id,
      );
      if (cartitem.selected_options != null) {
        (cartitem.selected_options as Map<String, dynamic>)
            .forEach((String key, value) {
          mezDbgPrint("Key ✅========>$key");
          mezDbgPrint("Value ✅========>$value");
          final List<Choice> choices = [];
          value['choices'].forEach((key, value) {
            choices.add(
              Choice(
                id: value['id'],
                name: {
                  LanguageType.EN: value['name']
                      [userLanguage.toFirebaseFormatString()],
                  LanguageType.ES: value['name']
                      [userLanguage.toFirebaseFormatString()]
                },
                cost: value['cost'],
              ),
            );
          });
          data.chosenChoices[key] = choices;
        });
        cartitem.restaurant_item.options.forEach(
            (Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options
                listOfOptions) {
          data.item.options.addAll(_convertOptionFromQuerry(listOfOptions));
        });
        cart.addItem(data);
      }
    });
    return cart;
  }
  return null;
}

Future<int> create_customer_cart({int? restaurant_id}) async {
  mezDbgPrint(
      "[🗿🗿🗿🗿🗿🗿🗿] Called :: create_customer_cart! =======>${Get.find<AuthController>().hasuraUserId!}");
  final QueryResult<Mutation$create_customer_cart> res =
      await _hasuraDb.graphQLClient.mutate$create_customer_cart(
    Options$Mutation$create_customer_cart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$create_customer_cart(
        cart: Input$restaurant_cart_insert_input(
          customer_id: Get.find<AuthController>().hasuraUserId!,
          restaurant_id: restaurant_id,
        ),
      ),
    ),
  );

  if (res.parsedData?.insert_restaurant_cart_one?.restaurant_id == null) {
    throw Exception(
        "🛑🛑🛑🛑 create_customer_cart :: exception ===> ${res.exception}!");
  } else {
    return res.parsedData!.insert_restaurant_cart_one!.restaurant_id!;
  }
}

extension HasuraCartItem on CartItem {
  Input$restaurant_cart_item_insert_input toHasuraInputCartItem() {
    return Input$restaurant_cart_item_insert_input(
      cost_per_one: costPerOne().toDouble(),
      customer_id: Get.find<AuthController>().user!.hasuraId,
      note: notes,
      quantity: quantity,
      selected_options: selectedOptionsToJson(),
      restaurant_item_id: item.id,
    );
  }
}

/// Returns Item Id
Future<int> add_item_to_cart({required CartItem cartItem}) async {
  mezDbgPrint("🤣 Calling add item  ${cartItem.item.id}");
  mezDbgPrint(
      "Encoooodedd ==> ${jsonEncode(cartItem.selectedOptionsToJson().toString())}");
  mezDbgPrint(
      "Adding Item :: selected_options ${cartItem.selectedOptionsToJson()}");
  final QueryResult<Mutation$addItemToCart> addItemResult =
      await _hasuraDb.graphQLClient.mutate$addItemToCart(
    Options$Mutation$addItemToCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$addItemToCart(
          item: cartItem.toHasuraInputCartItem()),
    ),
  );

  if (addItemResult.parsedData?.insert_restaurant_cart_item_one?.id == null) {
    throw Exception(
        "🚨 graphql::add_item_to_cart::exception :: ${addItemResult.exception}");
  } else {
    mezDbgPrint(
        "✅ _add_item_result :: success :D Item Id --> ${addItemResult.parsedData?.insert_restaurant_cart_item_one?.toJson()}");
    return addItemResult.parsedData!.insert_restaurant_cart_item_one!.id;
  }
}

/// Returns Item Id
Future<int> update_cart_item(
    {required CartItem cartItem, required int id}) async {
  mezDbgPrint(
      "Sending data ======= > 😔 ${cartItem.toFirebaseFunctionFormattedJson()}");
  final QueryResult<Mutation$updateRestaurantCartItem> result =
      await _hasuraDb.graphQLClient.mutate$updateRestaurantCartItem(
    Options$Mutation$updateRestaurantCartItem(
      variables: Variables$Mutation$updateRestaurantCartItem(
        itemId: id,
        itemData: Input$restaurant_cart_item_set_input(
          cost_per_one: cartItem.costPerOne().toDouble(),
          note: cartItem.notes,
          quantity: cartItem.quantity,
          selected_options: cartItem.selectedOptionsToJson(),
        ),
      ),
    ),
  );

  if (result.parsedData?.update_restaurant_cart_item_by_pk?.id == null) {
    throw Exception(
        "🚨 graphql::update_item_to_cart::exception :: ${result.exception}");
  } else {
    mezDbgPrint("✅ _update_item_result :: success :D}");
    return result.parsedData!.update_restaurant_cart_item_by_pk!.id;
  }
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
        "✅ From stream ============>>>>${cart.parsedData?.customer_customer_by_pk?.cart?.items}");
    final Cart _cartEvent = Cart();
    final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart?
        parsedCart = cart.parsedData?.customer_customer_by_pk?.cart;
    if (cart.parsedData?.customer_customer_by_pk?.cart != null) {
      final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant?
          _res = cart.parsedData?.customer_customer_by_pk?.cart?.restaurant;
      PaymentInfo paymentInfo = PaymentInfo();
      if (_res?.stripe_info != null && _res?.accepted_payments != null) {
        paymentInfo = PaymentInfo.fromData(
            stripeInfo: _res?.stripe_info!,
            acceptedPayments: _res?.accepted_payments!);
      }
      if (cart.parsedData?.customer_customer_by_pk?.cart?.restaurant != null) {
        _cartEvent.restaurant = Restaurant(
          userInfo: ServiceInfo(
            hasuraId: _res!.id,
            image: _res.image,
            firebaseId: _res.firebase_id,
            name: _res.name,
            description: (_res.description?.translations != null)
                ? {
                    _res.description!.translations.first.language_id
                            .toLanguageType():
                        _res.description!.translations.first.value,
                    _res.description!.translations[1].language_id
                            .toLanguageType():
                        _res.description!.translations[1].value,
                  }
                : null,
            descriptionId: _res.description_id,
            //   descriptionId: data.d,
            location: Location.fromHasura(
              _res.location_gps,
              _res.location_text,
            ),
          ),
          schedule:
              _res.schedule != null ? Schedule.fromData(_res.schedule) : null,
          paymentInfo: paymentInfo,
          restaurantState: ServiceState(
            _res.open_status.toServiceStatus(),
            _res.approved,
          ),
          primaryLanguage: _res.language_id.toString().toLanguageType(),
          secondaryLanguage:
              _res.language_id.toString().toLanguageType().toOpLang(),
        );
      }

      parsedCart!.items.forEach(
          (Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items
              cartitem) {
        final CartItem data = CartItem(
          item: Item(
              startsAt: (cartitem.restaurant_item.special_period_start != null)
                  ? DateTime.tryParse(
                      cartitem.restaurant_item.special_period_start!)
                  : null,
              endsAt: (cartitem.restaurant_item.special_period_end != null)
                  ? DateTime.tryParse(
                      cartitem.restaurant_item.special_period_end!)
                  : null,
              id: cartitem.restaurant_item.id,
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
          restaurantId: cartitem.restaurant_item.restaurant_id,
          quantity: cartitem.quantity,
          notes: cartitem.note,
          idInCart: cartitem.id,
        );
        if (cartitem.selected_options != null) {
          (cartitem.selected_options as Map<String, dynamic>)
              .forEach((String key, value) {
            final List<Choice> choices = [];
            value['choices'].forEach((key, value) {
              choices.add(
                Choice(
                  id: value['id'],
                  name: {
                    LanguageType.EN: value['name']["en"],
                    LanguageType.ES: value['name']["es"]
                  },
                  cost: value['cost'],
                ),
              );
            });
            data.chosenChoices[key] = choices;
          });
        }
        cartitem.restaurant_item.options.forEach(
            (Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options
                listOfOptions) {
          data.item.options.addAll(_convertOptionFromStream(listOfOptions));
        });
        _cartEvent.addItem(data);
      });
      return _cartEvent;
    } else {
      return null;
    }
  });
}

Future<int> delete_cart_item({required int item_id}) async {
  mezDbgPrint("CustomerId ==> ${Get.find<AuthController>().hasuraUserId}");
  final QueryResult<Mutation$removeItemFromCart> rmItemResult =
      await _hasuraDb.graphQLClient.mutate$removeItemFromCart(
    Options$Mutation$removeItemFromCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$removeItemFromCart(item_id: item_id),
    ),
  );

  if (rmItemResult.parsedData?.delete_restaurant_cart_item_by_pk?.id == null) {
    throw Exception(
        "[🛑] graphql::add_item_to_cart::exception :: ${rmItemResult.exception}");
  } else {
    mezDbgPrint("[✅] _rm_item_result :: success :D ");
    return rmItemResult.parsedData!.delete_restaurant_cart_item_by_pk!.id;
  }
}

Future<bool> clear_customer_cart({required int customer_id}) async {
  final QueryResult<Mutation$clearCart> response =
      await _hasuraDb.graphQLClient.mutate$clearCart(
    Options$Mutation$clearCart(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$clearCart(customer_id: customer_id),
    ),
  );

  if (response.parsedData?.delete_restaurant_cart_item == null) {
    throw Exception(
        " 🛑🛑 Clear customer cart exceptions 🛑🛑 \n ${response.exception}");
  } else {
    return response.parsedData?.delete_restaurant_cart_item!.affected_rows
            .isGreaterThan(0) ==
        true;
  }
}

List<Input$restaurant_cart_item_insert_input> _covertItems(
    List<CartItem> cartITems) {
  final List<Input$restaurant_cart_item_insert_input> data = [];
  cartITems
      .where((CartItem element) => element.idInCart == null)
      .map((CartItem e) => e.toHasuraInputCartItem());
  return data;
}

Future<int> set_cart_restaurant_id({
  required int restaurant_id,
  required int customer_id,
}) async {
  final QueryResult<Mutation$set_cart_restaurant_id> _cart =
      await _hasuraDb.graphQLClient.mutate$set_cart_restaurant_id(
    Options$Mutation$set_cart_restaurant_id(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$set_cart_restaurant_id(
        customer_id: customer_id,
        restaurant_id: restaurant_id,
      ),
    ),
  );
  if (_cart.parsedData?.update_restaurant_cart_by_pk == null ||
      _cart.parsedData!.update_restaurant_cart_by_pk?.restaurant_id == null) {
    throw Exception(
        "[🛑] called :: set_cart_restaurant_id :: exception :: ${_cart.hasException}");
  } else {
    mezDbgPrint(
        "[✅] called :: set_cart_restaurant_id :: cus_id ($customer_id) :: rest_id($restaurant_id) SUCESS  !");

    final int newRestId =
        _cart.parsedData!.update_restaurant_cart_by_pk!.restaurant_id!;
    return newRestId;
  }
}

List<Option> _convertOptionFromStream(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options
        optionsData) {
  final List<Option> options = optionsData.item_options.map((var oneOption) {
    final Option newOption = Option(
      id: oneOption.id,
      nameId: oneOption.name.id,
      name: toLanguageMap(translations: oneOption.name.translations),
      costPerExtra: oneOption.cost_per_extra,
      freeChoice: oneOption.free_choice,
      maximumChoice: oneOption.maximum_choice,
      minimumChoice: oneOption.minimum_choice,
      optionType: oneOption.option_type.toOptionType(),
      position: oneOption.position,
    );
    // oneOption.choices.forEach(
    //     (Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$options$item_options$choices
    //         listOfChoices) {
    //   newOption.choices.addAll(_convertChoices(listOfChoices));
    // });
    return newOption;
  }).toList();
  return options;
}

List<Option> _convertOptionFromQuerry(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options
        optionsData) {
  final List<Option> options = optionsData.item_options.map(
      (Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
          oneOption) {
    final Option newOption = Option(
      id: oneOption.id,
      nameId: oneOption.name.id,
      name: toLanguageMap(translations: oneOption.name.translations),
      costPerExtra: oneOption.cost_per_extra,
      freeChoice: oneOption.free_choice,
      maximumChoice: oneOption.maximum_choice,
      minimumChoice: oneOption.minimum_choice,
      optionType: oneOption.option_type.toOptionType(),
      position: oneOption.position,
    );
    // oneOption.choices.forEach(
    //     (Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$options$item_options$choices
    //         listOfChoices) {
    //   newOption.choices.addAll(_convertChoices(listOfChoices));
    // });
    return newOption;
  }).toList();
  return options;
}
