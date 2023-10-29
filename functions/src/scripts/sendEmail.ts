import * as functions from 'firebase-functions';
import * as nodemailer from 'nodemailer';

// Create a Nodemailer transporter object
const transporter = nodemailer.createTransport({
  host: 'mail.privateemail.com',
  port: 587,
  secure: false,  // true for 465 (SSL), false for 587 (TLS/STARTTLS)
  auth: {
    user: 'admin@mezcalmos.com',  // replace with your email address
    pass: '{tZ!-Cf/Vumrp86',  // replace with your email password
  },
});

export const sendEmail = functions.https.onRequest(async (req, res) => {
  // Define email options
  try {
  await sendMail();
  res.status(200).send('Email sent');
} catch (error) {
    console.error('Error sending email:', error);
    res.status(500).send('Error sending email');
}
});
async function sendMail() {
    const mailOptions = {
        from: 'admin@mezcalmos.com',
        to: 'nathikazad@gmail.com',
        subject: 'Test email from GCF',
        text: 'Hello, this is a test email from Google Cloud Functions!',
    };

    
        // Send email
        const info = await transporter.sendMail(mailOptions);
        console.log('Email sent:', info.response);
}

sendMail()
