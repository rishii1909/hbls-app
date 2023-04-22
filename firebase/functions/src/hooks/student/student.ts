import { doc, getDoc } from "firebase/firestore";
import { setGuardianRequestSchema } from "../../types/Student/Guardian";
import { db, functions } from "../../init";
import { authHook, getUid } from "../../utils";

const STUDENT_PATH = 'student'

const getStudent = functions.https.onCall((data, context) => {

    return getDoc(doc(db, STUDENT_PATH, data.studentId))
})

export const setGuardians = authHook(async (data, context) => {
    const uid = getUid(context)

    const guardians = await setGuardianRequestSchema.validate(data.guardians)

    
    
})