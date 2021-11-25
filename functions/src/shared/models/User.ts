import { Language } from "./Generic";

export interface UserInfo {
  id: string;
  image: string;
  name: string;
  language?: Language;
  email?: string;
  phoneNumber?: string;
}