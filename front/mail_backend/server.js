// server.js
const express = require("express");
const nodemailer = require("nodemailer");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

app.post("/api/send-email", async (req, res) => {
    const { email, subject, message } = req.body;

    // Configure the email transporter
    const transporter = nodemailer.createTransport({
        service: "gmail", // Use your email service (e.g., Gmail, Outlook, etc.)
        auth: {
            user: process.env.email,
            pass: process.env.passwd,
        },
    });

    // Set up email options
    const mailOptions = {
        from: process.env.email,
        to: email,
        subject: subject,
        text: message,
    };

    try {
        await transporter.sendMail(mailOptions);
        res.status(200).json({ message: "Email sent successfully" });
    } catch (error) {
        console.error("Email sending failed:", error);
        res.status(500).json({ error: "Failed to send email" });
    }
});

app.listen(3000, () => {
    console.log("Server running on port 3000");
});

