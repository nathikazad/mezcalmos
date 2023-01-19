import { Language } from "../../Generic/Generic";

export enum ItemType {
  Daily = "daily",
  Special = "special"
}

export interface Item {
  itemId: number;
  name: Record<Language, string>;
  description?: Record<Language, string>;
  position: number;
  categoryId?: number;
  available: boolean;
  itemType: ItemType;
  restaurantId: number;
  specialPeriodStart?: string;
  specialPeriodEnd?: string;
  archived: boolean;
  cost: number;
  options?: Array<Option>;
}

export interface Option {
  optionId: number;
  optionNames: Record<Language, string>;
  choices: Array<Choice>;
  position: number;
  optionType: string;
  minimumChoice: number;
  maximumChoice: number;
  freeChoice: number;
  costPerExtra: number;
}
  
export interface Choice {
  choiceId: number;
  name: Record<Language, string>;
  available: boolean;
  cost: number;
}