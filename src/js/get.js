export { portsInit }

function portsInit(elmApp, { db }) {
    elmApp.ports.getTableInfos.subscribe((_)=> {
        db
        .collection("version")
        .doc("v1")
        .collection("tableInfos")
        .get()
        .then((querySnapshot) => {
            querySnapshot.forEach(function(doc) {
                // doc.data() is never undefined for query doc snapshots
                console.log(doc.id, " => ", doc.data());
            });
        });

    })
}
