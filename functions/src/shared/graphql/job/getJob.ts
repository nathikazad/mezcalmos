import { getHasura } from "../../../utilities/hasura";
import { JobApplicarionStatus, MezError } from "../../models/Generic/Generic";

export async function checkJob(jobId: number): Promise<number> {
    let chain = getHasura();

    let response = await chain.query({
        finance_job_by_pk: [{
            id: jobId
        }, {
            availability: true,
            business_id: true
        }],
    });
    if(response.finance_job_by_pk == null) {
        throw new MezError("jobNotFound");
    }
    if(response.finance_job_by_pk.availability == false) {
        throw new MezError("jobUnavailable");
    }
    return response.finance_job_by_pk.business_id;
}

export async function checkJobApplicant(applicantId: number, businessId: number) {
    let chain = getHasura();

    let response = await chain.query({
        finance_job_applicant_by_pk: [{
            id: applicantId
        }, {
            job: {
                business_id: true,
            },
            job_id: true,
            customer_id: true,
            status: true
        }],
    });
    if(response.finance_job_applicant_by_pk == null) {
        throw new MezError("applicantNotFound");
    }
    if(response.finance_job_applicant_by_pk.job.business_id != businessId) {
        throw new MezError("incorrectBusinessId");
    }
    if(response.finance_job_applicant_by_pk.status != JobApplicarionStatus.Pending) {
        throw new MezError("applicantNotPending");
    }
    return response.finance_job_applicant_by_pk.customer_id;
}