export { portsInit }

function portsInit(elmApp, { auth, authProvider }) {
    elmApp.ports.signIn.subscribe(_ => {
        if (auth.currentUser && auth.currentUser.isAnonymous) {
            auth.currentUser.linkWithRedirect(authProvider)
        } else {
            auth.signInWithRedirect(authProvider)
        }
    })

    elmApp.ports.signInAnonymously.subscribe(_ => {
        console.log("signInAnonymously")
        auth.signInAnonymously().catch(error => {
            if (error.code === "auth/operation-not-allowed") {
                alert("You must enable Anonymous auth in the Firebase Console.")
            } else {
                console.error(error)
            }
        })
    })

    elmApp.ports.signOut.subscribe(_ => {
        console.log("signOut")
        auth.signOut()
    })

    auth.onAuthStateChanged(user => {
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
}
