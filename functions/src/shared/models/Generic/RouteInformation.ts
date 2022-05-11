export interface RouteInformation {
    polyline: string;
    duration: RideDuration;
    distance: RideDistance;
}

interface RideDistance {
    text    : string,
    value   : number
}

interface RideDuration {
    text    : string,
    value   : number
}
