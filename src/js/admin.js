export { portsInit }

function portsInit(elmApp, { db }) {
    elmApp.ports.createTable.subscribe(record => {
        console.log("createTable")
        const batch = db.batch()
        const tableInfoRef = db
            .collection("version")
            .doc("v1")
            .collection("tableInfos")
            .doc()

        const tableRef = db
            .collection("version")
            .doc("v1")
            .collection("tables")
            .doc(tableInfoRef.id)

        batch
            .set(tableInfoRef, record.tableInfo)
            .set(tableRef, record.table)
            .commit()
            .then(() => {
                console.log("Completed creating table")
            })
            .catch(error => {
                console.error(
                    "Error adding table and tableInfo document: ",
                    error
                )
            })
    })
}
