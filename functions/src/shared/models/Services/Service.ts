import { AuthorizationStatus } from "../Generic/Generic";
import { UserInfo } from "../Generic/User";

export interface State {
  authorizationStatus: AuthorizationStatus;
  open: boolean;
}

export interface Service {
  state: State;
  info: UserInfo;
}
