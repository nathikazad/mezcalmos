import { Review, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { getUser } from "../shared/graphql/user/getUser";
import { createReview } from "../shared/graphql/restaurant/createReview";

export async function addReview(userId: number, review: Review) {

  await getUser(userId);
  await createReview(review);

  // if (!data.rating || !data.comment || !data.orderId || !data.serviceProviderId || !data.orderType) {
  //   return {
  //     status: ServerResponseStatus.Error,
  //     errorMessage:
  //       "required parameters rating, comment, orderType ,orderId and restaurantId",
  //   };
  // }
  // let customerInfo: UserInfo = await getUserInfo(userId);

  //   const newReview:JSON = <JSON><unknown>{
  //     "rating": data.rating,
  //     "authorName" : customerInfo.name,
  //     "comment": data.comment,
  //       "orderType" : data.orderType,
  //     "authorId": userId,
  //     "reviewTime": (new Date()).toISOString(),
  //     }

  // adding review to service provider review array 
  // serviceProviderNodes
  //   .serviceProviderReviews(data.orderType, data.serviceProviderId)
  //   .child(data.orderId)
  //     .set(newReview);
    
  // adding review to service provider past order  
  // serviceProviderNodes
  //   .serviceProviderPastOrders(
  //    data.orderType,
  //     data.serviceProviderId,
  //     data.orderId
  //   )
  //   .child("review")
  //     .set(newReview);
  // adding review to customer past orders node  
  // customerNodes
  //   .pastOrders(userId, data.orderId)
  //   .child("review")
  //     .set(newReview);
 // adding review to root past orders node   
  // rootNodes
  //   .pastOrders(data.orderType, data.orderId)
  //   .child("review")
  //     .set(newReview);
// updating global review //  
    // let restaurantReview = 0;
    
    // let restaurantReviews :any[] = await getRestaurantReviews(data.serviceProviderId);
    
    
    // restaurantReviews?.forEach((element) => {
    //     restaurantReview += element["rating"];
    // });
    // restaurantReview = restaurantReview / restaurantReviews.length;
    // serviceProviderNodes.serviceProviderDetails(data.orderType, data.serviceProviderId).child("rating").set(restaurantReview);
    

  return { status: ServerResponseStatus.Success };
};
