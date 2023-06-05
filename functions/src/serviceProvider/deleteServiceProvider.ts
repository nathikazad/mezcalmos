import { getBusinessOperatorByUserId } from "../shared/graphql/business/operator/getBusinessOperator";
import { getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getLaundryOperatorByUserId } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { removeServiceProvider } from "../shared/graphql/serviceProvider/deleteServiceProvider";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { isMezAdmin } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Operator, ServiceProviderDeletedNotification, ServiceProviderType } from "../shared/models/Services/Service";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface DeleteServiceProviderRequest {
    serviceProviderType: ServiceProviderType;
    serviceProviderId: number;
}
export interface DeleteServiceProviderResponse {
  success: boolean,
  error?: DeleteServiceProviderError
  unhandledError?: string
}
export enum DeleteServiceProviderError {
  UnhandledError = "unhandledError",
  InvalidServiceProviderType = "invalidServiceProviderType",
  UnauthorizedAccess = "unauthorizedAccess",
  DeletionError = "deletionError",
}

export async function deleteServiceProvider(userId: number, deleteServiceProviderReq: DeleteServiceProviderRequest): Promise<DeleteServiceProviderResponse> {
  try {
    if((await isMezAdmin(userId)) == false) {
        let operator: Operator;
        switch (deleteServiceProviderReq.serviceProviderType) {
            case ServiceProviderType.Business:
                operator = await getBusinessOperatorByUserId(userId);
                break;
            case ServiceProviderType.Restaurant:
                operator = await getRestaurantOperatorByUserId(userId);
                break;
            case ServiceProviderType.DeliveryCompany:
                operator = await getDeliveryOperatorByUserId(userId);
                break;
            case ServiceProviderType.Laundry:
                operator = await getLaundryOperatorByUserId(userId);
                break;
            default:
                throw new MezError(DeleteServiceProviderError.InvalidServiceProviderType);
        }
        
        if(operator.serviceProviderId != deleteServiceProviderReq.serviceProviderId || operator.owner == false) {
            throw new MezError(DeleteServiceProviderError.UnauthorizedAccess);
        }
    }
    await removeServiceProvider(deleteServiceProviderReq)
  
    notifyAdmins(deleteServiceProviderReq);
    
    return {
      success: true
    }
  } catch (e: any) {
    if (e instanceof MezError) {
        if (Object.values(DeleteServiceProviderError).includes(e.message as any)) {
            return {
                success: false,
                error: e.message as any
            }
        } else {
            return {
                success: false,
                error: DeleteServiceProviderError.UnhandledError,
                unhandledError: e.message as any
            }
        }
    } else {
        throw e
    }
  }
};

async function notifyAdmins(deleteServiceProviderReq: DeleteServiceProviderRequest) {

    let mezAdmins: MezAdmin[] = await getMezAdmins();
    let notification: Notification = {
      foreground: <ServiceProviderDeletedNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.ServiceProviderDeleted,
        notificationAction: NotificationAction.ShowSnackBarAlways,
        serviceProviderId: deleteServiceProviderReq.serviceProviderId,
        serviceProviderType: deleteServiceProviderReq.serviceProviderType,
      },
      background: {
        [Language.ES]: {
          title: "Proveedor de servicios eliminado",
          body: `Se ha eliminado un proveedor de servicios`
        },
        [Language.EN]: {
          title: "Service Provider Deleted",
          body: `A service provider has been deleted`
        }
      },
      linkUrl: `/`
    };
    mezAdmins.forEach((m) => {
      pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
  }