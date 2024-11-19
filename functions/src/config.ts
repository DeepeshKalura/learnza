import * as functions from "firebase-functions";
import * as dotenv from "dotenv";

dotenv.config();

export const config = {
    mailsenderapi: process.env.MAIL_SENDER_API || functions.config().mailsenderapi.key,
};