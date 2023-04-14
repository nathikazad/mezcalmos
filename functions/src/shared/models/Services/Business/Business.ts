import { Language, Location } from "../../Generic/Generic";
import { ForegroundNotification } from "../../Notification";
import { ServiceProvider } from "../Service";

export interface Business {
    profile: BusinessProfile;
    details: ServiceProvider;
    rentals?: Array<Rental>;
    events?: Array<Event>;
}

export interface BusinessService {
    id: number;
    name: Record<Language, string>;
    description?: Record<Language, string>;
    position: number;
    businessId: number;
    available: boolean;
    image?: Array<string>;
    cost: Record<TimeUnit, number>;
    additionalParameters?: Record<string, any>
}

export enum TimeUnit {
    PerHour = "perHour",
    PerDay = "perDay",
    PerWeek = "perWeek",
    PerMonth = "perMonth",
    Total = "total",
}
export interface Rental {
    category1: RentalCategory1;
    category2?: RentalCategory2;
    category3?: string;
    details: BusinessService;
    bedrooms?: number;
    bathrooms?: number;
    gpsLocation?: Location,
    homeType?: string,
}
export interface Event {
    category1: EventCategory1;
    scheduleType: ScheduleType;
    schedule?: any;
    details: BusinessService;
    gpsLocation?: Location;
    time?: string;
}
export enum RentalCategory1 {
    Surf = "surf",
    Vehicle = "vehicle",
    Home = "home",
    Uncategorized = "uncategorized"
}
export enum EventCategory1 {
    Yoga = "yoga",
    Surf = "surf",
    MartialArt = "martialArt",
    Party = "party",
    Dance = "dance",
    GetTogether = "getTogether"
}
export enum ServiceType {
    Rental = "rental",
    Class = "class",
    Event = "event",
}
export enum ScheduleType {
    Scheduled = "scheduled",
    OnDemand = "onDemand",
    OneTime = "oneTime",
}
export enum BusinessProfile {
    SurfShop = "surfShop",
    VehicleRental = "vehicleRental",
    HomeRental = "homeRental",
    WellnessClass = "wellnessClass",
    Party = "party",
    Volunteer = "volunteer",
    TourAgency = "tourAgency"
}
export enum RentalCategory2 {
    Motorcycle = "motorcycle",
    Car = "car",
    Uncategorized = "uncategorized"
}
export interface NewBusinessNotification extends ForegroundNotification {
    name: string,
    image: string,
    id: number,
}