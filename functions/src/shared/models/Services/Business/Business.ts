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
  Unit = "unit",
}
export interface Rental {
  id?: number;
  category1: RentalCategory1;
  category2?: RentalCategory2;
  category3?: RentalCategory3;
  details: BusinessItemDetails;
  bedrooms?: number;
  bathrooms?: number;
  gpsLocation?: Location;
  homeType?: HomeType;
}
export interface Event {
  id?: number;
  category1: EventCategory1;
  category2?: EventCategory2;
  scheduleType: ScheduleType;
  schedule?: Schedule;
  details: BusinessItemDetails;
  gpsLocation?: Location;
  startsAt?: string;
  endsAt?: string;
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
  Uncategorized = "uncategorized",
}
export enum HomeType {
  Apartment = "apartment",
  Villa = "villa",
  Condo = "condo",
  Bungalow = "bungalow",
  Hotel = "hotel",
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
  YogaStudio = "yogaStudio",
  HomeRental = "homeRental",
  LanguageSchool = "languageSchool",
  TourAgency = "tourAgency",
  ArtisanalProduct = "artisanalProduct",
  CleaningService = "cleaningService",
  PetSitting = "petSitting",
  WellnessPractitioner = "wellnessPractitioner",
  Volunteer = "volunteer",
  Entertainment = "entertainment",
}
export enum RentalCategory2 {
  Motorcycle = "motorcycle",
  Car = "car",
  ATB = "aTB",
  Bicycle = "bicycle",
  Uncategorized = "uncategorized",
}

export enum RentalCategory3 {
  Retro = "retro",
  Scooter = "scooter",
  ThreeWheeler = "3-wheeler",
  Uncategorized = "uncategorized",
}
export enum ServiceCategory1 {
  MealPlanning = "mealPlanning",
  Cleaning = "cleaning",
  PetSitting = "petSitting",
  Uncategorized = "uncategorized",
}
export enum ProductCategory1 {
  Consumable = "consumable",
  PersonalCare = "personalCare",
  Art = "art",
  Uncategorized = "uncategorized",
}
export enum EventTag {
  Class = "class",
}
export interface NewBusinessNotification extends ForegroundNotification {
  name: string;
  image: string;
  id: number;
}
