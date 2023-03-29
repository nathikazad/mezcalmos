import { Language } from "../../Generic/Generic";
import { ForegroundNotification } from "../../Notification";
import { ServiceProvider } from "../Service";

export interface Business extends ServiceProvider {
    profile: BusinessProfile;
}

export interface BusinessService {
    id: number;
    name: Record<Language, string>;
    description?: Record<Language, string>;
    position: number;
    businessId: number;
    available: boolean;
    image: string;
    cost: number;
}
export interface Rental extends BusinessService {
    rentalCategory1: RentalCategory1
}
export interface Class extends BusinessService {
    scheduleType: ScheduleType;
    schedule?: any;
}
export interface Event extends BusinessService {
    scheduleType: ScheduleType;
    schedule?: any;
}
export enum RentalCategory1 {
    Surf,
    Motorcycle,
    Home,
    x
}
export enum ServiceType {
    Rental = "rental",
    Class = "class",
    Event = "event",
}
export enum ScheduleType {
    Scheduled = "scheduled",
    OnDemand = "onDemand",
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