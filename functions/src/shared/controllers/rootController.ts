import { userInfoNode } from "../databaseNodes/root";
import { UserInfo } from "../models/User";



export async function getUserInfo(userId: string): Promise<UserInfo> {
  return (await userInfoNode(userId).once('value')).val();
}

export async function setUserInfo(userId: string, userInfo: UserInfo): Promise<void> {
  return userInfoNode(userId).set(userInfo);
}