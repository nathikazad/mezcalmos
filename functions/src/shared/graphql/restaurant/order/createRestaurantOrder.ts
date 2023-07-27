import { $ } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { CheckoutRequest } from "../../../../restaurant/checkoutCart";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
import { AppType, MezError } from "../../../models/Generic/Generic";
import { DeliveryType, OrderType, PaymentType } from "../../../models/Generic/Order";
import { MezAdmin } from "../../../models/Generic/User";
import { Cart } from "../../../models/Services/Restaurant/Cart";
import { OrderItem, RestaurantOrder, RestaurantOrderStatus } from "../../../models/Services/Restaurant/RestaurantOrder";
import { ServiceProvider } from "../../../models/Services/Service";


export async function createRestaurantOrder(restaurant: ServiceProvider, checkoutReq : CheckoutRequest, customerCart: Cart, mezAdmins: MezAdmin[])
  : Promise<{restaurantOrder: RestaurantOrder, deliveryOrder: DeliveryOrder}> {

  let chain = getHasura();

  let restaurantOperatorsDetails = restaurant.operators!.map((v) => {
    return {
      participant_id: v.userId,
      app_type_id: AppType.Restaurant
    };
  });
  let mezAdminDetails = mezAdmins!.map((v) => {
    return {
      participant_id: v.id,
      app_type_id: AppType.MezAdmin
    };
  });
  let params: any = {
    "dropoff_gps": {
      "type": "Point",
      "coordinates": [checkoutReq.customerLocation.lng, checkoutReq.customerLocation.lat ],
    },
    "data": customerCart.items!.map((i:any) => {
      console.log("+ SelectedOptions of item ", i.itemId , ": ",i.selectedOptions);
      console.log("+ ItemName ", i.name);
      return {
        cost_per_one: i.costPerOne,
        notes: i.notes,
        quantity: i.quantity,
        restaurant_item_id: i.itemId,
        in_json: {
          name: i.name,
          image : i.image,
          selected_options: parseSelectedOptions(i.selectedOptions)
        },
      };
    })
  }
  if(checkoutReq.deliveryType == DeliveryType.Delivery) {
    params["pickup_gps"] = {
      "type": "Point",
      "coordinates": [restaurant.location.lng, restaurant.location.lat],
    }
  }
  let response = await chain.mutation({
    insert_restaurant_order_one: [{
      object: {
       scheduled_time: checkoutReq.scheduledTime,
        customer_id: customerCart.customerId,
        restaurant_id: checkoutReq.restaurantId,
        customer_app_type: checkoutReq.customerAppType,
        delivery_type: checkoutReq.deliveryType,
        chat: {
          data: {
            chat_participants: {
              data: [{
                participant_id: customerCart.customerId,
                app_type_id: AppType.Customer
              },
              ...restaurantOperatorsDetails,
              ...mezAdminDetails]
            }
          }
        },
        delivery: (checkoutReq.deliveryType == DeliveryType.Delivery) ? {
          data: {
            customer_id: customerCart.customerId,
            order_type: OrderType.Restaurant,
            dropoff_gps: $`dropoff_gps`,
            dropoff_address: checkoutReq.customerLocation.address,
            pickup_gps: $`pickup_gps`,
            pickup_address: restaurant.location.address,
            schedule_time: checkoutReq.scheduledTime,
            chat_with_customer: {
              data: {
                chat_participants: {
                  data: [{
                    participant_id: customerCart.customerId,
                    app_type_id: AppType.Customer
                  },]
                }
              }
            },
            chat_with_service_provider: {
              data: {
                chat_participants: {
                  data: [...restaurantOperatorsDetails, ...mezAdminDetails]
                }
              }
            },
            payment_type: checkoutReq.paymentType,
            customer_offer: checkoutReq.customerDeliveryOffer,
            delivery_cost: checkoutReq.customerDeliveryOffer,
            chosen_companies: checkoutReq.chosenCompanies,
            status: DeliveryOrderStatus.OrderReceived,
            service_provider_id: (restaurant.deliveryDetails.selfDelivery) 
              ? restaurant.id 
              : null!,
            service_provider_type: (restaurant.deliveryDetails.selfDelivery) 
              ? DeliveryServiceProviderType.Restaurant
              : DeliveryServiceProviderType.DeliveryCompany,
            scheduled_time: checkoutReq.scheduledTime,
            trip_distance: checkoutReq.tripDistance,
            trip_duration: checkoutReq.tripDuration,
            trip_polyline: checkoutReq.tripPolyline,
            package_cost: checkoutReq.paymentType == PaymentType.Cash ? customerCart.cost : 0,
            distance_from_base: checkoutReq.distanceFromBase
          }
        }: undefined,
        payment_type: checkoutReq.paymentType,
        to_location_gps: $`dropoff_gps`,
        to_location_address: checkoutReq.customerLocation.address,
        notes: checkoutReq.notes,
        status: RestaurantOrderStatus.OrderReceived,
        stripe_fees: checkoutReq.stripeFees ?? 0,
        discount_value: checkoutReq.discountValue ?? 0,
        tax: checkoutReq.tax ?? 0,
        items: {
          data: $`data` 
        },
      }
    }, {
      id: true,
      chat_id: true,
      order_time: true,
      delivery: {
        id: true,
        chat_with_customer_id: true,
        chat_with_service_provider_id: true,
      }
    }],
  }, params);

  if(response.insert_restaurant_order_one == null) {
    throw new MezError("orderCreationError");
  }
  let orderItems: OrderItem[] = customerCart.items.map((i:any) => {
    return {
      itemId: i.itemId,
      name: i.name,
      image: i.image,
      selectedOptions: i.selectedOptions,
      notes: i.notes,
      quantity: i.quantity,
      costPerOne: i.costPerOne
    }
  })
  let restaurantOrder: RestaurantOrder = {
    orderId: response.insert_restaurant_order_one.id,
    spDetailsId: restaurant.serviceProviderDetailsId,
    customerId: customerCart.customerId,
    restaurantId: checkoutReq.restaurantId,
    paymentType: checkoutReq.paymentType,
    toLocation: checkoutReq.customerLocation,
    status: RestaurantOrderStatus.OrderReceived,
    deliveryType: checkoutReq.deliveryType ?? DeliveryType.Delivery,
    customerAppType: checkoutReq.customerAppType,
    items: orderItems,
    itemsCost: customerCart.cost,
    notes: checkoutReq.notes,
    deliveryCost: 0,
    scheduledTime: checkoutReq.scheduledTime,
    chatId: response.insert_restaurant_order_one.chat_id
    
  }
  let deliveryOrder: DeliveryOrder;
  if(checkoutReq.deliveryType == DeliveryType.Delivery) {
    if(response.insert_restaurant_order_one.delivery == null) {
      throw new MezError("orderCreationError");
    }
    restaurantOrder.deliveryId = response.insert_restaurant_order_one.delivery.id;
    deliveryOrder = {
      deliveryId: response.insert_restaurant_order_one.delivery.id,
      orderType: OrderType.Restaurant,
      pickupLocation: restaurant.location,
      dropoffLocation: checkoutReq.customerLocation,
      chatWithServiceProviderId: response.insert_restaurant_order_one.delivery.chat_with_service_provider_id,
      chatWithCustomerId: response.insert_restaurant_order_one.delivery.chat_with_customer_id,
      paymentType: checkoutReq.paymentType,
      status: DeliveryOrderStatus.OrderReceived,
      customerId: customerCart.customerId,
      deliveryCost: checkoutReq.customerDeliveryOffer,
      notifiedDrivers: [],
      packageCost: checkoutReq.paymentType == PaymentType.Cash ? customerCart.cost : 0,
      orderTime: response.insert_restaurant_order_one.order_time,
      tripDistance : checkoutReq.tripDistance,
      tripDuration : checkoutReq.tripDuration,
      tripPolyline : checkoutReq.tripPolyline,
      customerOffer: checkoutReq.customerDeliveryOffer,
      chosenCompanies: checkoutReq.chosenCompanies,
      serviceProviderType: (restaurant.deliveryDetails.selfDelivery == false) 
        ? DeliveryServiceProviderType.DeliveryCompany 
        : DeliveryServiceProviderType.Restaurant,
      serviceProviderId: (restaurant.deliveryDetails.selfDelivery) 
        ? restaurant.id 
        : undefined,
      direction: DeliveryDirection.ToCustomer,
      packageReady:false,
      distanceFromBase: checkoutReq.distanceFromBase
    }
  } else {
    deliveryOrder = {
      deliveryId: 0,
      orderType: OrderType.Restaurant,
      pickupLocation: restaurant.location,
      dropoffLocation: checkoutReq.customerLocation,
      chatWithServiceProviderId: 0,
      chatWithCustomerId: 0,
      paymentType: checkoutReq.paymentType,
      status: DeliveryOrderStatus.OrderReceived,
      customerId: customerCart.customerId,
      deliveryCost: checkoutReq.customerDeliveryOffer,
      notifiedDrivers: [],
      packageCost: checkoutReq.paymentType == PaymentType.Cash ? customerCart.cost : 0,
      orderTime: response.insert_restaurant_order_one.order_time,
      tripDistance : checkoutReq.tripDistance,
      tripDuration : checkoutReq.tripDuration,
      tripPolyline : checkoutReq.tripPolyline,
      serviceProviderType: (restaurant.deliveryDetails.selfDelivery == false) 
        ? DeliveryServiceProviderType.DeliveryCompany 
        : DeliveryServiceProviderType.Restaurant,
      serviceProviderId: (restaurant.deliveryDetails.selfDelivery == false) 
        ? undefined
        : restaurant.id,
      direction: DeliveryDirection.ToCustomer,
      packageReady:false,
    }
  }
  return {restaurantOrder, deliveryOrder}

  function parseSelectedOptions(selectedOptions: object | string) {
    if (typeof selectedOptions === 'string') {
      try {
        return JSON.parse(selectedOptions);
      } catch (e) {
        // Handle JSON parsing error if needed
        return null; // or any other default value
      }
    }
    return selectedOptions;
  }
}

