

export interface WorkingDay{
    isOpen: boolean;
    openHours: Array<OpenHours>;
}
export interface OpenHours{
  to: Array<number>;
  from: Array<number>;
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

// export type Schedule = {
//     [day in Weekday]: {
//       isOpen: boolean;
//       openHours: {
//         to: string;
//         from: string;
//       }[];
//     };
//   };
  
export interface Schedule{
  openHours:  Record<Weekday, WorkingDay>;
}

