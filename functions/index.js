
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().functions);
const database = admin.firestore();


exports.timerUpdate = functions.pubsub.schedule('0 0 * * *').onRun((context) => {
    database.doc("zamanlayici/suan").update({ "zaman": admin.firestore.Timestamp.now() });
    return console.log('basarili bir sekilde guncellendi');
});


/*
exports.timerUpdate = functions.pubsub.schedule('* * * * *').onRun((context) => {
    database.doc("zamanlayici/suan").update({ "zaman": admin.firestore.Timestamp.now() });
    return console.log('basarili bir sekilde guncellendi');
});
*/
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
