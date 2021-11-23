import { Language } from "../../shared/models/Generic";
import { UserInfo } from "../../shared/models/User";

export interface Details {
  description: Record<Language, string>;
  languages: Language[];
  info: UserInfo;
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
  authorizationStatus: boolean;
  open: boolean;
}

export interface Restaurant {
  details: Details;
  menu: Record<string, MenuItem>;
  state: State;
}



