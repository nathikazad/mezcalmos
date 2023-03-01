
// interface HandleRequestDetails {
//     orderRequestId: number,
//     requestConfirmed: boolean,
// }

// export async function handleOrderRequestByAdmin(userId: number, handleRequestDetails: HandleRequestDetails) {

//     await passChecksForBusiness(userId, handleRequestDetails.orderRequestId)

//     let order: BusinessOrder = await getBusinessOrderRequest(handleRequestDetails.orderRequestId);
//     let customer: CustomerInfo = await getCustomer(order.customerId);

//     if (order.status != BusinessOrderRequestStatus.RequestReceived) {
//         throw new HttpsError(
//             "internal",
//             "request already confirmed or cancelled"
//         );
//     } 
//     if(handleRequestDetails.requestConfirmed) {
//         order.status = BusinessOrderRequestStatus.RequestApprovedByBusiness;
//         handleRequestDetails.items?.forEach((i) => {
//             let itemIdx = order.items.findIndex((j) => (i.serviceId == j.serviceId && i.serviceType == j.serviceType));
//             order.items[itemIdx].finalCostPerOne = i.finalCostPerOne;
//         });
//         confirmBusinessOrderFromOperator(order);
//     } else {
//         order.status = BusinessOrderRequestStatus.RequestRejectedByBusiness;
//         cancelBusinessOrderFromOperator(order)
//     }

//     notifyCustomer(order, customer);
// }