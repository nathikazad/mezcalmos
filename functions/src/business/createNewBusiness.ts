import { createBusiness } from "../shared/graphql/business/createBusiness";
import { getUser } from "../shared/graphql/user/getUser";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, Location, MezError } from "../shared/models/Generic/Generic";
import { Schedule } from "../shared/models/Generic/Schedule";
import { MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Business, BusinessProfile, NewBusinessNotification } from "../shared/models/Services/Business/Business";
import { ServiceProviderLanguage } from "../shared/models/Services/Service";
import { businessUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface BusinessDetails {
    name: string,
    image: string,
    profile: BusinessProfile,
    location: Location,
    businessOperatorNotificationToken?: string,
    language: ServiceProviderLanguage,
    schedule: Schedule
}
export interface BusinessResponse {
  success: boolean,
  error?: BusinessError
  unhandledError?: string
}
export enum BusinessError {
  UnhandledError = "unhandledError",
  UserNotFound = "userNotFound",
  BusinessCreationError = "businessCreationError"
}

export async function createNewBusiness(userId: number, businessDetails: BusinessDetails): Promise<BusinessResponse> {
  try {
    let userPromise = getUser(userId);
    let mezAdminsPromise = getMezAdmins();
    let promiseResponse = await Promise.all([userPromise, mezAdminsPromise]);
    let mezAdmins: MezAdmin[] = promiseResponse[1];
  
    let business: Business = await createBusiness(businessDetails, userId);
  
    notifyAdmins(business, mezAdmins);
    
    return {
      success: true
    }
  } catch (e: any) {
    if (e instanceof MezError) {
        if (Object.values(BusinessError).includes(e.message as any)) {
            return {
                success: false,
                error: e.message as any
            }
        } else {
            return {
                success: false,
                error: BusinessError.UnhandledError,
                unhandledError: e.message as any
            }
        }
    } else {
        throw e
    }
  }
};

function notifyAdmins(business: Business, mezAdmins: MezAdmin[]) {
    let notification: Notification = {
      foreground: <NewBusinessNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewBusiness,
        notificationAction: NotificationAction.ShowSnackBarAlways,
        name: business.details.name,
        image: business.details.image,
        id: business.details.id
      },
      background: {
        [Language.ES]: {
          title: "Nuevo negocio",
          body: `Hay un nuevo negocio`
        },
        [Language.EN]: {
          title: "New Business",
          body: `Thers is a new business`
        }
      },
      linkUrl: businessUrl(business.details.id)
    };
    mezAdmins.forEach((m) => {
      pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
  }