import { getMezAdmin } from "./graphql/user/mezAdmin/getMezAdmin";

export async function isMezAdmin(userId: number): Promise<boolean> {
    try {
        await getMezAdmin(userId);
        return true;
    } catch(error) {
        return false;
    }
}