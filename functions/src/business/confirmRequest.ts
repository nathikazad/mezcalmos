import { HttpsError } from "firebase-functions/v1/auth";
import { getBusinessCheckDetails } from "../shared/graphql/business/businessCheck";
import { getBusinessOrderRequest } from "../shared/graphql/business/order/getOrderRequest";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { isMezAdmin } from "../shared/helper";
import { CustomerInfo } from "../shared/models/Generic/User";
import { BusinessOrder, BusinessOrderRequestItem, BusinessOrderRequestStatus } from "../shared/models/Services/Business/BusinessOrder";

export interface ConfirmRequestDetails {
    orderRequestId: number,
    requestConfirmed: boolean,
    items: Array<BusinessOrderRequestItem>;
}

export async function confirmOrderRequest(userId: number, confirmRequestDetails: ConfirmRequestDetails) {

    await passChecksForBusiness(userId, confirmRequestDetails.orderRequestId)

    let order: BusinessOrder = await getBusinessOrderRequest(confirmRequestDetails.orderRequestId);
    let customer: CustomerInfo = await getCustomer(order.customerId);

    if (order.status != BusinessOrderRequestStatus.RequestReceived) {
        throw new HttpsError(
            "internal",
            "request already confirmed or cancelled"
        );
    } 
    if(confirmRequestDetails.requestConfirmed) {
        order.status = BusinessOrderRequestStatus.RequestApprovedByBusiness;
        
        
    } 
}

export async function passChecksForBusiness(userId: number, orderId: number) {

    let response = await getBusinessCheckDetails(orderId, userId);
    let order = response.business_order_request_by_pk;
  
    if (order == null) {
        throw new HttpsError(
            "internal",
            "order does not exist"
        );
    }
  
    if((await isMezAdmin(userId)) == false) {
        if (response.business_operator.length == 0) {
            throw new HttpsError(
                "internal",
                "Only authorized business operators or MezAdmin can run this operation"
            );
        }
        if(response.business_operator[0].business_id != order.business_id) {
            throw new HttpsError(
                "internal",
                "Only authorized business operators can run this operation"
            );
        }
    }
  }