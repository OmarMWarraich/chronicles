class AdminMailer < ApplicationMailer
  default from: 'no-reply@topgeardirect.com'

  def new_user(user)
    @user = user
    mail(to: @user.email, subject: "New User: #{user.email}")
  end

  def mandrill_client
    @mandrill_client ||= MailchimpTransactional::Client.new Rails.application.credentials.dig(:smtp, :api_key)
  end

  def new_comment(comment)
    template_name = 'new-comment'
    template_content = []
    message = {
      to: [{ email: 'omar@topgeardirect.com' }],
      subject: "New Comment Added: #{comment.text}",
      merge_vars: [
        {
          rcpt: 'omar@topgeardirect.com',
          vars: [
            {
              name: 'COMMENT_NAME',
              content: comment.text
            }
          ]
        }
      ]
    }

    mandrill_client.messages.send_template template_name, template_content, message
  end
end
