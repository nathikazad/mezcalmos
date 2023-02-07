import { Language } from "../../Generic/Generic";

// export interface Laundry extends ServiceProvider {
//     laundryOperators?: Array<LaundryOperator>
// }

// export interface LaundryOperator extends Operator {
//     storeId: number;
// }

export interface LaundryCategory {
    categoryid: number;
    name?: Record<Language, string>;
    storeId: number;
    costByKilo: number;
    position: number;
}