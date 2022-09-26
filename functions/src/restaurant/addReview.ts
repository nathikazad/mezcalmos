import * as serviceProviderNodes from "../shared/databaseNodes/services/serviceProvider";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as rootNodes from "../shared/databaseNodes/root";
import * as functions from "firebase-functions";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";

import { isSignedIn } from "../shared/helper/authorizer";
import { getRestaurantReviews } from "../shared/controllers/restaurantController";

export = functions.https.onCall(async (data, context) => {
  let response = await isSignedIn(context.auth);
  if (response != undefined) {
    return {
      ok: false,
      error: response,
    };
  }

  if (!data.rating || !data.comment || !data.orderId || !data.serviceProviderId || !data.orderType) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage:
        "required parameters rating, comment, orderType ,orderId and restaurantId",
    };
  }


    const newReview:JSON = <JSON><unknown>{
        "rating": data.rating,
        "comment": data.comment,
        "authorId" : context.auth?.uid
      }

  // adding review to service provider review array 
  serviceProviderNodes
    .serviceProviderReviews(data.orderType, data.serviceProviderId)
    .child(data.orderId)
      .set(newReview);
    
  // adding review to service provider past order  
  serviceProviderNodes
    .serviceProviderPastOrders(
     data.orderType,
      data.serviceProviderId,
      data.orderId
    )
    .child("review")
      .set(newReview);
  // adding review to customer past orders node  
  customerNodes
    .pastOrders(context.auth!.uid, data.orderId)
    .child("review")
      .set(newReview);
 // adding review to root past orders node   
  rootNodes
    .pastOrders(data.orderType, data.orderId)
    .child("review")
      .set(newReview);
// updating global review //  
    let restaurantReview = 0;
    
    let restaurantReviews :any[] = await getRestaurantReviews(data.serviceProviderId);
    
    
    restaurantReviews?.forEach((element) => {
        restaurantReview += element["rating"];
    });
    restaurantReview = restaurantReview / restaurantReviews.length;
    serviceProviderNodes.serviceProviderDetails(data.orderType, data.serviceProviderId).child("rating").set(restaurantReview);
    

  return { status: ServerResponseStatus.Success };
});
