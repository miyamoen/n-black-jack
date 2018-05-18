import "./css/main.css"
import { Main } from "./elm/Main.elm"
import registerServiceWorker from "./js/registerServiceWorker"
import firebase from "firebase"
// Required for side-effects
import "firebase/firestore"
import "firebase/auth"

const app = Main.fullscreen()

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
const db = firebase.firestore()
const auth = firebaseApp.auth()
auth.languageCode = "ja"
const provider = new firebase.auth.TwitterAuthProvider()
//
// db
//     .collection("users")
//     .get()
//     .then(function(querySnapshot) {
//         querySnapshot.forEach(function(doc) {
//             console.log(doc.id, " => ", doc.data())
//         })
//     })

firebase.auth().onAuthStateChanged(user => {
    if (user) {
        console.log("ログイン済み")

        console.log(user)
        if (user.isAnonymous) {
        } else {
        }
        /*---------------------------------------*/
        /* 5.1 ログインしている場合 */
        /*---------------------------------------*/

        // const docRef = db.collection("messages").doc(user.uid)
        //
        // docRef
        //     .set({
        //         value: "test2の値だよ"
        //     })
        //     .then(() => {
        //         console.log("success")
        //     })
        //     .catch(error => {
        //         console.error(error)
        //     })

        // auth.signOut()
    } else {
        console.log("未認証")

        /*---------------------------------------*/
        /* 5.2 ログインしていない場合 */
        /*---------------------------------------*/
    }
})

app.ports.signIn.subscribe(_ => {
    if (auth.currentUser && auth.currentUser.isAnonymous) {
        auth.currentUser.linkWithRedirect(provider)
    } else {
        auth.signInWithRedirect(provider)
    }
})

app.ports.signInAnonymously.subscribe(_ => {
    console.log("signInAnonymously")
    auth.signInAnonymously().catch(error => {
        if (error.code === "auth/operation-not-allowed") {
            alert("You must enable Anonymous auth in the Firebase Console.")
        } else {
            console.error(error)
        }
    })
})

app.ports.signOut.subscribe(_ => {
    console.log("signOut")
    auth.signOut()
})
