import { getBusiness } from "../shared/graphql/business/getBusiness";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, MezError } from "../shared/models/Generic/Generic";
import { JobApplicationNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Business } from "../shared/models/Services/Business/Business";
import { pushNotification } from "../utilities/senders/notifyUser";
import { checkJobApplicant } from "../shared/graphql/job/getJob";
import { rejectApplication } from "../shared/graphql/job/rejectApplication";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { CustomerInfo } from "../shared/models/Generic/User";

export interface RejectCandidateDetails {
    businessId: number,
    applicantId: number
} 
export interface RejectCandidateResponse {
    success: boolean,
    error?: RejectCandidateError
    unhandledError?: string
}
enum RejectCandidateError {
    UnhandledError = "unhandledError",
    UnauthorizedAccess = "unauthorizedAccess",
    ApplicantNotFound = "applicantNotFound",
    IncorrectBusinessId = "incorrectBusinessId",
    ApplicantNotPending = "applicantNotPending",
    customerNotFound = "customerNotFound",
}

export async function rejectCandidate(userId: number, rejectCandidateDetails: RejectCandidateDetails): Promise<RejectCandidateResponse> {
  try {

    let business: Business = await getBusiness(rejectCandidateDetails.businessId);

    if(business.details.operators?.find((o) => o.userId == userId) == undefined) {
        throw new MezError(RejectCandidateError.UnauthorizedAccess);
    }

    let customerId: number = await checkJobApplicant(rejectCandidateDetails.applicantId, rejectCandidateDetails.businessId);
    
    await rejectApplication(rejectCandidateDetails.applicantId);

    let customer: CustomerInfo = await getCustomer(customerId);

    notify(customer, business);
 
    return {
      success: true,
    }
  } catch (e: any) {
    if (e instanceof MezError) {
        if (Object.values(RejectCandidateError).includes(e.message as any)) {
            return {
                success: false,
                error: e.message as any
            }
        } else {
            return {
                success: false,
                error: RejectCandidateError.UnhandledError,
                unhandledError: e.message as any
            }
        }
    } else {
        throw e
    }
  }
}

async function notify(customer: CustomerInfo, business: Business) {
  
    let notification: Notification = {
        foreground: <JobApplicationNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.JobApplication,
            // jobId,
            notificationAction: NotificationAction.ShowSnackBarAlways,
        },
        background: {
            [Language.ES]: {
                title: "Solicitud rechazada",
                body: `Su solicitud en ${business.details.name} ha sido rechazada.`
            },
            [Language.EN]: {
                title: "Application rejected",
                body: `Your application at ${business.details.name} has been rejected.`
            }
        },
        linkUrl: `/`
    }
    if(customer.notificationInfo?.turnOffNotifications == false) {
        pushNotification(customer.firebaseId, notification, customer.notificationInfo, ParticipantType.Customer, customer.language);
    }
}