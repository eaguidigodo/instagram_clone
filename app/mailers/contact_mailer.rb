class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact
        mail to: "enselme20@gmail.com", subject: "I'm just testing mailer function!"
    end
end
