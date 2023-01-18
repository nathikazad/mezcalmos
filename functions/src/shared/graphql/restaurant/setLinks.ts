import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ServiceLink } from "../../models/Services/Service";

export async function insertServiceLink(serviceLink: ServiceLink) {
  console.log("\n service link : ", serviceLink);

  let chain = getHasura();

  let response = await chain.mutation({
    insert_service_provider_service_link_one: [
      {
        object: {
          service_provider_id: serviceLink.service_provider_id,
          service_provider_type: serviceLink.service_provider_type,
          operator_deep_link: serviceLink.operator_deep_link,
          operator_qr_image_link: serviceLink.operator_qr_image_link,
          driver_deep_link: serviceLink.driver_deep_link,
          driver_qr_image_link: serviceLink.driver_qr_image_link,
        },
      },
      {
        id: true,
        service_provider_id: true,
      },
    ],
  });
  console.log("response set operator links: ", response);

  if (response.insert_service_provider_service_link_one == null) {
    throw new HttpsError("internal", "restaurant creation error");
  }
}
export async function updateOperatorLink(serviceLink: ServiceLink) {
  console.log("\n service link : ", serviceLink);

  let chain = getHasura();

  let response = await chain.mutation({
    update_service_provider_service_link_by_pk: [
      {
        pk_columns: { id: serviceLink.id! },
        _set: {
          operator_deep_link: serviceLink.operator_deep_link,
          operator_qr_image_link: serviceLink.operator_qr_image_link,
        },
      },
      {
        id: true,
        service_provider_id: true,
      },
    ],
  });
  console.log("response set operator links: ", response);

  if (response.update_service_provider_service_link_by_pk == null) {
    throw new HttpsError("internal", "restaurant creation error");
  }
}export async function updateDriverLink(serviceLink: ServiceLink) {
  console.log("\n service link : ", serviceLink);

  let chain = getHasura();

  let response = await chain.mutation({
    update_service_provider_service_link_by_pk: [
      {
        pk_columns: { id: serviceLink.id! },
        _set: {
          driver_deep_link: serviceLink.driver_deep_link,
          driver_qr_image_link: serviceLink.driver_qr_image_link,
        },
      },
      {
        id: true,
        service_provider_id: true,
      },
    ],
  });
  console.log("response set operator links: ", response);

  if (response.update_service_provider_service_link_by_pk == null) {
    throw new HttpsError("internal", "restaurant creation error");
  }
}
export async function setOperatorDeepLink(
  operatorDeepLink: string,
  restaurantId: number
) {
  console.log("setting deep link to ", restaurantId);
  console.log("\n deep link : ", operatorDeepLink);

  // let chain = getHasura();

  // let response = await chain.mutation({
  //   update_restaurant_by_pk: [
  //     {
  //       pk_columns: { id: restaurantId },
  //       _set: {
  //         operator_deep_link: operatorDeepLink,
  //       },
  //     },
  //     {
  //       id: true,
  //       operator_deep_link: true,
  //       operator_qr_image_link: true,
  //     },
  //   ],
  // });
  // console.log("response set operator links: ", response);

  // if (response.update_restaurant_by_pk == null) {
  //   throw new HttpsError("internal", "restaurant creation error");
  // }
}
export async function setOperatorQrImageLink(
  operatorQrImageLink: string,
  restaurantId: number
) {
  console.log("setting qr image link to ", restaurantId);
  console.log("\n qr link : ", operatorQrImageLink);
  // let chain = getHasura();

  // let response = await chain.mutation({
  //   update_restaurant_by_pk: [
  //     {
  //       pk_columns: { id: restaurantId },
  //       _set: {
  //         operator_qr_image_link: operatorQrImageLink,
  //       },
  //     },
  //     {
  //       id: true,
  //       operator_deep_link: true,
  //       operator_qr_image_link: true,
  //     },
  //   ],
  // });
  // console.log("response set operator links: ", response);
  // if (response.update_restaurant_by_pk == null) {
  //   throw new HttpsError("internal", "restaurant creation error");
  // }
}
