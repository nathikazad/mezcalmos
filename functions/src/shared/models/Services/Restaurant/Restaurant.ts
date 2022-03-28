import { Language } from "../../Generic/Generic";
import { Service } from "../Service";

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


export interface Restaurant extends Service {
  details: Details;
  menu: Record<string, MenuItem>;
}
