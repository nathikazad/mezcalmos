import { userInfoNode } from "../databaseNodes/root";
import { Language } from "./Generic";

export interface UserInfo {
  id: string;
  image: string;
  name: string;
  language?: Language;
  email?: string;
  phoneNumber?: string;
}

export async function getUserInfo(userId: string): Promise<UserInfo> {
  return (await userInfoNode(userId).once('value')).val();
}

export async function setUserInfo(userId: string, userInfo: UserInfo): Promise<void> {
  return userInfoNode(userId).set(userInfo);
}