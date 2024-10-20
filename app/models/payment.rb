# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  product    :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Payment < ApplicationRecord
  state_machine :state, initial: :pending do
    after_transition pending: :processing, do: :process_stripe_payment
    # before_transition successful: :refunded, do: :process_stripe_refund

    event :process do
      transition pending: :processing
    end

    event :failed do
      transition processing: :failed
    end

    event :success do
      transition processing: :successful
    end

    event :refund do
      transition successful: :refunded
    end

    state :refunded do
      def refunded_at
        Time.zone.now
      end
    end
  end

  def process_stripe_payment
    if true
      success
    else
      failed
    end
  end

  # def process_stripe_refund
  #   raise StandardError, 'Refund failed'
  # end
end
