import "./css/main.css"
import { Main } from "./elm/Main.elm"
import registerServiceWorker from "./js/registerServiceWorker"
import { portsInit as adminPortsInit } from "./js/admin"
import { portsInit as authenticationPortsInit } from "./js/authentication"
import firebase from "firebase"
// Required for side-effects
import "firebase/firestore"
import "firebase/auth"

const elmApp = Main.fullscreen()

registerServiceWorker()

const firebaseApp = firebase.initializeApp({
    apiKey: "AIzaSyBVhvjozUq4KV990A6xxKIwxIYTltZBGfI",
    authDomain: "blackjack-f4331.firebaseapp.com",
    databaseURL: "https://blackjack-f4331.firebaseio.com",
    projectId: "blackjack-f4331",
    storageBucket: "blackjack-f4331.appspot.com",
    messagingSenderId: "311216437106"
})
// Initialize Cloud Firestore through Firebase
const products = {
    db: firebaseApp.firestore(),
    auth: firebaseApp.auth(),
    authProvider: new firebase.auth.TwitterAuthProvider()
}
products.auth.languageCode = "ja"
//
// db
//     .collection("users")
//     .get()
//     .then(function(querySnapshot) {
//         querySnapshot.forEach(function(doc) {
//             console.log(doc.id, " => ", doc.data())
//         })
//     })

authenticationPortsInit(elmApp, products)
adminPortsInit(elmApp, products)
