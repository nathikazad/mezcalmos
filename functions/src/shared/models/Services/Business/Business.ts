import { Language, Location } from "../../Generic/Generic";
import { Schedule } from "../../Generic/Schedule";
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
    nameId?: number;
    descriptionId?: number;
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
    id?: number;
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
    id?: number;
    category1: EventCategory1;
    category2?: EventCategory2;
    scheduleType: ScheduleType;
    schedule?: Schedule;
    details: BusinessItemDetails;
    gpsLocation?: Location;
    time?: string;
    tags?: Array<EventTag>;
}
export interface Service {
    id?: number;
    category1: ServiceCategory1;
    details: BusinessItemDetails;
}
export interface Product {
    id?: number;
    category1: ProductCategory1;
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
export enum ServiceCategory1 {
    MealPlanning = "mealPlanning",
    Cleaning = "cleaning",
    PetSitting = "petSitting",
    Uncategorized = "uncategorized"
}
export enum ProductCategory1 {
    Consumable = "consumable",
    PersonalCare = "personalCare",
    Art = "art",
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