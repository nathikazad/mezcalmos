import { Language } from "./Generic";


export interface GenericUser {
  id?: string;
  image: string;
  name: string;
}

export interface UserInfo {
  photo: string;
  displayName: string;
  email?: string;
  language: Language;
  phoneNumber?: string;
}