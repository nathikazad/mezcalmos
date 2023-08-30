import { ApplicationError } from "../../../business/applyJob";
import { getHasura } from "../../../utilities/hasura";
import { MezError } from "../../models/Generic/Generic";

export async function createJobApplication(customerId: number, jobId: number) {
    let chain = getHasura();

    let response = await chain.mutation({
        insert_finance_job_applicant_one: [{
            object: {
                customer_id: customerId,
                job_id: jobId
            }
        }, {
            id: true
        }],
    });
    if(response.insert_finance_job_applicant_one == null) {
        throw new MezError(ApplicationError.ApplicationError);
    }

}