

// const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");


const functions = require("firebase-functions");
const axios = require("axios");

exports.checkPhoneNumber = functions.https.onCall(async (data, context) => {
  const phoneNumber = data.phoneNumber;
  const apiKey = "YOUR_API_KEY";

  try {
    const response = await axios.get(`https://api.numverify.com/validate?access_key=${apiKey}&number=${phoneNumber}`);
    const isScam = response.data.line_type === "scam";

    return {isScam: isScam};
  } catch (error) {
    console.error("Error validating phone number:", error);
    // eslint-disable-next-line max-len
    throw new functions.https.HttpsError("internal", "Phone number validation failed");
  }
});
