export { portsInit }

function portsInit(elmApp, { db }) {
    elmApp.ports.createTable.subscribe(record => {
        console.log("createTable")
        db
            .collection("version")
            .doc("v1")
            .collection("tableInfos")
            .add(record)
            .then(docRef => {
                console.log("Document written with ID: ", docRef.id)
            })
            .catch(error => {
                console.error("Error adding document: ", error)
            })
    })
}
