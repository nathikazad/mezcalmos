import { UserInfo } from "../../Generic/User";

export interface Influencer {
  tag: string;
  id: number;
  user_id: number;
  info: UserInfo;
}
