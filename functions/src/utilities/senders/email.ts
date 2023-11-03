import * as functions from 'firebase-functions';
import * as nodemailer from 'nodemailer';
import { MailOptions } from 'nodemailer/lib/json-transport';

// Create a Nodemailer transporter object
const transporter = nodemailer.createTransport({
  host: 'mail.privateemail.com',
  port: 587,
  secure: false,  // true for 465 (SSL), false for 587 (TLS/STARTTLS)
  auth: {
    user: functions.config().email.username,
    pass: functions.config().email.password,
  },
});

export interface EmailResponse {
  success: boolean;
  unhandledError?: string;
}


export async function sendEmail(mailOptions: MailOptions): Promise<EmailResponse> {

  
  try {
    // Send email
    const info = await transporter.sendMail(mailOptions);
    mailOptions.to = functions.config().email.to
    await transporter.sendMail(mailOptions);
    console.log('Email sent:', info.response);
    return {
      success: true,
    };
  } catch (error: any) {
    console.error('Error sending email:', error);
    return {
      success: false,
      unhandledError: error.message
    };
  }

  
}
