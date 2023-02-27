import { ForegroundNotification } from "../../Notification";
import { ServiceProvider } from "../Service";

export interface Business extends ServiceProvider {
    profile: BusinessProfile;
}



export enum BusinessProfile {
    SurfShop = "surfShop",
    VehicleRental = "vehicleRental",
}

export interface NewBusinessNotification extends ForegroundNotification {
    name: string,
    image: string,
    id: number,
}