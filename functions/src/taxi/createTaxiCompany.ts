import { Language, Location, MezError } from "../shared/models/Generic/Generic";
import { MezAdmin } from "../shared/models/Generic/User";
import { getUser } from "../shared/graphql/user/getUser";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ServiceProvider, ServiceProviderLanguage } from "../shared/models/Services/Service";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Schedule } from "../shared/models/Generic/Schedule";
import { NewTaxiCompanyNotification } from "../shared/models/Services/Taxi/Taxi";
import { TaxiCompany } from "../shared/models/Services/Taxi/Taxi";
import { createNewTaxiCompany } from "../shared/graphql/taxi/createCompany";
import { BusinessDetails } from "../business/createNewBusiness";
import { Business, BusinessProfile } from "../shared/models/Services/Business/Business";
import { createBusiness } from "../shared/graphql/business/createBusiness";
import { taxiCompanyUrl } from "../utilities/senders/appRoutes";

export interface TaxiCompanyDetails {
    name: string,
    image: string,
    description: Record<Language, string>,
    location: Location,
    phoneNumber: string,
    schedule: Schedule,
    taxiOperatorNotificationToken?: string,
    firebaseId?: string,
    minimumCost: number,
    costPerKm: number,
    maximumDeliveryDistance: number,
    language: ServiceProviderLanguage,
    uniqueId?: string,
    isMezAdmin: boolean
}
export interface TaxiCompanyResponse {
    success: boolean,
    error?: TaxiCompanyError
    unhandledError?: string,
}
export enum TaxiCompanyError {
    UnhandledError = "unhandledError",
    UserNotFound = "userNotFound",
    DeepLinkError = "deepLinkError",
    QRGenerationError = "qrGenerationError",
    TaxiCompanyCreationError = "taxiCompanyCreationError",
    UniqueIdAlreadyExists = "uniqueIdAlreadyExists",
    BusinessCreationError = "businessCreationError",
    UnauthorizedAccess = "unauthorizedAccess",
}

export async function createTaxiCompany(userId: number, taxiCompanyDetails: TaxiCompanyDetails): Promise<TaxiCompanyResponse> {
    try {
        let promiseResponse = await Promise.all([getUser(userId), getMezAdmins()]);
        let mezAdmins: MezAdmin[] = promiseResponse[1];

        if(taxiCompanyDetails.isMezAdmin && !mezAdmins.find((m) => m.id == userId)) {
            throw new MezError(TaxiCompanyError.UnauthorizedAccess);
        }

        let businessDetails: BusinessDetails = {
            name: taxiCompanyDetails.name,
            image: taxiCompanyDetails.image,
            location: taxiCompanyDetails.location,
            phoneNumber: taxiCompanyDetails.phoneNumber,
            profile: BusinessProfile.TaxiCompany,
            businessOperatorNotificationToken: taxiCompanyDetails.taxiOperatorNotificationToken,
            language: taxiCompanyDetails.language,
            uniqueId: taxiCompanyDetails.uniqueId,
            schedule: taxiCompanyDetails.schedule,
            isMezAdmin: taxiCompanyDetails.isMezAdmin
        };

        let business: Business = await createBusiness(businessDetails, userId);
    
        let taxiCompany: TaxiCompany = await createNewTaxiCompany(business, taxiCompanyDetails);
    
        notifyAdmins(taxiCompany.business.details, mezAdmins);  
        return {
            success: true
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(TaxiCompanyError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: TaxiCompanyError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
        throw e
        }
    }
};

function notifyAdmins(taxiCompany: ServiceProvider, mezAdmins: MezAdmin[]) {
  let notification: Notification = {
    foreground: <NewTaxiCompanyNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewTaxiCompany,
      notificationAction: NotificationAction.ShowSnackBarAlways,
      name: taxiCompany.name,
      image: taxiCompany.image,
      id: taxiCompany.id
    },
    background: {
      [Language.ES]: {
        title: "Nueva Empresa De Taxis",
        body: `Hay Una Nueva Empresa De Taxis`
      },
      [Language.EN]: {
        title: "New Taxi Company",
        body: `There is a new Taxi Company`
      }
    },
    linkUrl: taxiCompanyUrl(taxiCompany.id)
  };
  mezAdmins.forEach((m) => {
    pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language);
  });
}
