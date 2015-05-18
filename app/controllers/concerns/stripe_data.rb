require 'active_support/concern'

module StripeData
  extend ActiveSupport::Concern

  included do
    def stripe_button_data
      @stripe_button_data ||= {
        key: "#{ENV['STRIPE_PUBLISHABLE_KEY']}",
        description: "Premium Membership",
        amount: Amount.default
      }
    end
    helper_method :stripe_button_data
  end
end