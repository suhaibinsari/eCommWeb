class CheckoutController < ApplicationController

    def create

            @session = Stripe::Checkout::Session.create({
              payment_method_types: ['card'],
              line_items: @cart.collect { |item| item.to_builder.attributes! },
              allow_promotion_codes: true,
              mode: 'payment',
              success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
              cancel_url: cancel_url,
            })
            redirect_to @session.url
    end 

end
