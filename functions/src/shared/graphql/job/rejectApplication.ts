import { getHasura } from "../../../utilities/hasura";
import { JobApplicarionStatus } from "../../models/Generic/Generic";

export async function rejectApplication(applicantId: number) {
    let chain = getHasura();

    // let response = 
    await chain.mutation({
        update_finance_job_applicant_by_pk: [{
            pk_columns: {
                id: applicantId
            },
            _set: {
                status: JobApplicarionStatus.Rejected
            }
        }, {
            id: true
        }],
    });
}