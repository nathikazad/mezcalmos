import { getBusiness } from "../shared/graphql/business/getBusiness";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { CustomerInfo } from "../shared/models/Generic/User";
import { JobApplicationNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Business } from "../shared/models/Services/Business/Business";
import { pushNotification } from "../utilities/senders/notifyUser";
import { checkJob } from "../shared/graphql/job/getJob";
import { createJobApplication } from "../shared/graphql/job/createJobApplication";

export interface ApplicationDetails {
    jobId: number
} 
export interface ApplicationResponse {
  success: boolean,
  error?: ApplicationError
  unhandledError?: string
}
export enum ApplicationError {
    UnhandledError = "unhandledError",
    CustomerNotFound = "customerNotFound",
    ResumeNotFound = "resumeNotFound",
    JobNotFound = "jobNotFound",
    JobUnavailable = "jobUnavailable",
    BusinessNotFound = "businessNotFound",
    ApplicationError = "applicationError"
}

export async function applyJob(customerId: number, applicationDetails: ApplicationDetails): Promise<ApplicationResponse> {
  try {
    let response = await Promise.all([
        getCustomer(customerId),
        // getMezAdmins(),
        checkJob(applicationDetails.jobId)
    ]);
    let customer: CustomerInfo = response[0];
    // let mezAdmins: MezAdmin[] = response[1];
    let businessId: number = response[1];

    let business: Business = await getBusiness(businessId);

    if(customer.resume == undefined) {
        throw new MezError(ApplicationError.ResumeNotFound);
    }
    
    await createJobApplication(customerId, applicationDetails.jobId);

    // setBusinessOrderRequestChatInfo(order, business, customer);

    notify(applicationDetails.jobId, business);
 
    return {
      success: true,
    }
  } catch (e: any) {
    if (e instanceof MezError) {
        if (Object.values(ApplicationError).includes(e.message as any)) {
            return {
                success: false,
                error: e.message as any
            }
        } else {
            return {
                success: false,
                error: ApplicationError.UnhandledError,
                unhandledError: e.message as any
            }
        }
    } else {
        throw e
    }
  }
}

async function notify(jobId: number, business: Business) {
  
    let notification: Notification = {
        foreground: <JobApplicationNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.JobApplication,
            jobId,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            // business: {
            //     name: business.details.name,
            //     image: business.details.image,
            //     id: business.details.id
            // }
        },
        background: {
            [Language.ES]: {
                title: "Nuevo solicitante",
                body: `Hay una nueva solicitud de empleo.`
            },
            [Language.EN]: {
                title: "New Applicant",
                body: `There is a new job application`
            }
        },
        linkUrl: `/`
    }
    if(business.details.operators != undefined) {
        business.details.operators.forEach((l) => {
            if(l.user && l.notificationInfo?.turnOffNotifications == false) {
                pushNotification(l.user.firebaseId, notification, l.notificationInfo, ParticipantType.BusinessOperator, l.user.language);
            }
        });
    }
}
    