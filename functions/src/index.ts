/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import { onRequest } from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import { config } from "./config";

import * as nodemailer from 'nodemailer';
import { MailerSend, EmailParams, Sender, Recipient } from "mailersend";




export const helloWorld = onRequest((request, response) => {
    logger.info("Hello logs!", { structuredData: true });
    response.send("Hello from Firebase!");
});

export const createNewAdmin = onRequest(async (request, response) => {

    if (config.mailsenderapi == null) {
        logger.error("Mail sender API not configured");
        response.status(500).send("Mail sender API not configured");
        return;
    }

    const mailerSend = new MailerSend({
        apiKey: config.mailsenderapi,
    });


    if (request.method !== "POST") {
        response.status(400).send("Invalid request method");
        return;
    }

    const { user, password } = request.body;

    if (!user || !password) {
        response.status(400).send("Invalid request body");
        return;
    }


    const sentFrom = new Sender("lernza.deepeshkalura.xyz", "Deepesh Kalura");
    const recipients = [
        new Recipient(user["email"], user["fullName"]),
    ]



    const emailParams = new EmailParams()
        .setFrom(sentFrom)
        .setTo(recipients)
        .setReplyTo(sentFrom)
        .setSubject("This is a Subject")
        .setHtml("<strong>This is the HTML content</strong>")
        .setText("This is the text content");

    await mailerSend.email.send(emailParams);



});