import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";
import firebaseConfig from "../../firebase_config.json";
import * as firebase_functions from "firebase-functions";

export const functions = firebase_functions

export const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);