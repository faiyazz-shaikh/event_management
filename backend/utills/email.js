const nodemailer = require('nodemailer');
module.exports = class Email {
  constructor(user) {
    this.to = user.email;
    this.from = `YOUR ORG`;
  }

  newTransport() {
    const transport = nodemailer.createTransport({
      host: process.env.EMAIL_HOST,
      port: process.env.EMAIL_PORT,
      auth: {
        user: process.env.EMAIL_USERNAME,
        pass: process.env.EMAIL_PASSWORD,
      },
    });

    return transport;
  }

  async send(text, subject) {
    const mailOption = {
      from: this.from,
      to: this.to,
      subject,
      text,
    };

    await this.newTransport().sendMail(mailOption);
  }
};
