import { Language, Location } from "../../Generic/Generic";
import { ForegroundNotification } from "../../Notification";
import { ServiceProvider } from "../Service";

export interface Business {
    profile: BusinessProfile;
    details: ServiceProvider;
    rentals?: Array<Rental>;
    events?: Array<Event>;
    services?: Array<Service>;
    products?: Array<Product>;
}

export interface BusinessItemDetails {
    id: number;
    name: Record<Language, string>;
    description?: Record<Language, string>;
    position?: number;
    businessId: number;
    available: boolean;
    image?: Array<string>;
    cost: Record<TimeUnit, number>;
    additionalParameters?: Record<string, any>;
}

export enum TimeUnit {
    PerHour = "perHour",
    PerDay = "perDay",
    PerWeek = "perWeek",
    PerMonth = "perMonth",
    PerPerson = "perPerson",
    Total = "total",
}
export interface Rental {
    category1: RentalCategory1;
    category2?: RentalCategory2;
    category3?: string;
    details: BusinessItemDetails;
    bedrooms?: number;
    bathrooms?: number;
    gpsLocation?: Location,
    homeType?: string,
}
export interface Event {
    category1: EventCategory1;
    category2?: EventCategory2;
    scheduleType: ScheduleType;
    schedule?: any;
    details: BusinessItemDetails;
    gpsLocation?: Location;
    time?: string;
    tags?: Array<EventTag>;
}
export interface Service {
    category1: string;
    details: BusinessItemDetails;
}
export interface Product {
    category1: string;
    details: BusinessItemDetails;
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
    Social = "social",
    Therapy = "therapy",
    Fitness = "fitness",
    Adventure = "adventure",
    Volunteer = "volunteer",
    Uncategorized = "uncategorized",
}
export enum EventCategory2 {
    Salsa = "salsa",
    Zumba = "zumba",
    HIIT = "hIIT",
    Ecstatic = "ecstatic",
    Spin = "spin",
    Jiujitsu = "jiujitsu",
    Karate = "karate",
    Uncategorized = "uncategorized",
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
    TourAgency = "tourAgency",
    DanceClass = "danceClass",
    Therapy = "therapy",
    Cleaning = "cleaning",
}
export enum RentalCategory2 {
    Motorcycle = "motorcycle",
    Car = "car",
    ATB = "aTB",
    Bicycle = "bicycle",
    Uncategorized = "uncategorized"
}
export enum EventTag {
    Class = "class",
}
export interface NewBusinessNotification extends ForegroundNotification {
    name: string,
    image: string,
    id: number,
}