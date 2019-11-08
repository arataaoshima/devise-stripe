class ChargesController < ApplicationController

  def new
  end

  def create

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })


      subscription = Stripe::Subscription.create({
        customer: customer.id,
        plan: "plan_G8FtqbcawJzjs9"
        })

      current_user.stripe_id = customer.id
      current_user.subscription_id = subscription.id
      current_user.stripe_email = customer.email
      current_user.payment = true

      redirect_to  home_about_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

end
