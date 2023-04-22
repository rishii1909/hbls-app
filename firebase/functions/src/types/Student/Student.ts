import { Favourites } from "./Favourites";
import { Guardian } from "./Guardian";

export interface Student {
    favourites: Favourites
    guardians: Guardian[]
}