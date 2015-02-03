class Mailer < ApplicationMailer
  default template_path: 'mailer'
  layout false

  def receipt_email(user_id)
    category 'Receipt email'
    deliver_to_customer_by_id(customer_id)
  end

  private

  def deliver_to_customer_by_id(customer_id)
    @customer = Customer.find_by(id: customer_id)

    if @cusomer.email.present?
      mail to: @customer.email, subject: t('.subject')
    end
  end
end
