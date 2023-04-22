
export enum UserType {
    student = "student",
    staff = "staff"
}
export interface User {
    id: string
    type: UserType
}