import { AuthorizationStatus, Language } from "../../Generic/Generic";
import { UserInfo } from "../../Generic/User";

export interface Details {
  description: Record<Language, string>;
  languages: Language[];
}

export interface ChooseManyOption {
  cost: number;
  default: boolean;
  name: Record<Language, string>;
}

export interface ChooseOneOptionListItem {
  cost: number;
  name: Record<Language, string>;
}

export interface ChooseOneOption {
  dialog: Record<Language, string>;
  name: Record<Language, string>;
  options: Record<string, ChooseOneOptionListItem>;
}

export interface Options {
  chooseMany: Record<string, ChooseManyOption>;
  chooseOne: Record<string, ChooseOneOption>;
}

export interface MenuItem {
  available: boolean;
  cost: number;
  description: Record<Language, string>;
  image: string;
  name: Record<Language, string>;
  options: Options;
}

export interface State {
  authorizationStatus: AuthorizationStatus;
  open: boolean;
}

export interface Restaurant {
  details: Details;
  menu: Record<string, MenuItem>;
  state: State;
  info: UserInfo;
}
