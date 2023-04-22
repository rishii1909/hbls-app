
import { object, string, number, date, InferType, array } from 'yup';

export interface GuardianTypes {
    Mother: 'mother'
    Father: 'father'
    Guardian: 'guardian'
}

export const GuardianSchema = object({
    name: string().required(),
    phone: string().required(),
    email: string().required(),
    relation: string<(keyof GuardianTypes)>().required(),
    image_url: string()
})

export type Guardian = InferType<typeof GuardianSchema>;

export const setGuardianRequestSchema = array(GuardianSchema)