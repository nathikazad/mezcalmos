
export interface Schedule {
    openHours: Record<Weekday, WorkingDay>;
}
export interface WorkingDay{
    isOpen: boolean;
    openHours: Array<OpenHours>;
}

export interface OpenHours {
   
    from: Array<number>;
    to: Array<number>;
}

export enum Weekday {
    Monday = "monday",
    Tuesday = "tuesday",
    Wednesday = "wednesday",
    Thursday = "thursday",
    Friday = "friday",
    Saturday = "saturday",
    Sunday = "sunday"
}
