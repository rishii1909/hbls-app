import { HttpsError } from "firebase-functions/v1/auth"
import { functions } from "./init"
import { CallableContext } from "firebase-functions/v1/https"

export const authHook = (callback: (data: any, context: CallableContext) => any) => {
    return functions.https.onCall((data, context) => {
        if (!context.auth) throw new HttpsError('unauthenticated', 'You are not authenticated')
        callback(data, context)
    })
}

export const getUid = (context: CallableContext) => {
    return context.auth?.uid
}