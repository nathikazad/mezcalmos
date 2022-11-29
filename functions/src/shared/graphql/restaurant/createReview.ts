import { getHasura } from "../../../utilities/hasura";
import { Review } from "../../models/Generic/Generic";

export async function createReview(review: Review) {

  let chain = getHasura();
  
  await chain.mutation({
    insert_review_one: [{
      object: {
        rating: review.rating,
        from_entity_id: review.fromEntityId,
        from_entity_type: review.fromEntityType,
        to_entity_id: review.toEntityId,
        to_entity_type: review.toEntityType
      }
    }, {}]
  });
}